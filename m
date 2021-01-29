Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
 <20210126130505.2938391-2-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <7b1ef598-71d0-e289-1288-a09d1b3ad977@linux.intel.com>
Date: Fri, 29 Jan 2021 09:18:50 +0000
MIME-Version: 1.0
In-Reply-To: <20210126130505.2938391-2-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t 2/2] i915/sysfs_clients: Check that
 client ids are cyclic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 26/01/2021 13:05, Chris Wilson wrote:
> The client id used is a cyclic allocator as that reduces the likelihood
> of userspace seeing the same id used again (and so confusing the new
> client as the old). Verify that each new client has an id greater than
> the last.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   tests/i915/sysfs_clients.c | 129 +++++++++++++++++++++++++++++++------
>   1 file changed, 108 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
> index a3a1f81e1..d2c1ebc5f 100644
> --- a/tests/i915/sysfs_clients.c
> +++ b/tests/i915/sysfs_clients.c
> @@ -8,6 +8,7 @@
>   #include <errno.h>
>   #include <fcntl.h>
>   #include <inttypes.h>
> +#include <limits.h>
>   #include <math.h>
>   #include <sched.h>
>   #include <sys/socket.h>
> @@ -47,6 +48,8 @@
>   #define assert_within_epsilon(x, ref, tolerance) \
>   	__assert_within_epsilon(x, ref, tolerance / 100., tolerance / 100.)
>   
> +#define BUFSZ 280
> +
>   #define MI_BATCH_BUFFER_START (0x31 << 23)
>   #define MI_BATCH_BUFFER_END (0xa << 23)
>   #define MI_ARB_CHECK (0x5 << 23)
> @@ -75,7 +78,7 @@ static void pidname(int i915, int clients)
>   {
>   	struct dirent *de;
>   	int sv[2], rv[2];
> -	char buf[280];
> +	char buf[BUFSZ];
>   	int me = -1;
>   	long count;
>   	pid_t pid;
> @@ -180,7 +183,7 @@ static long count_clients(int clients)
>   {
>   	struct dirent *de;
>   	long count = 0;
> -	char buf[280];
> +	char buf[BUFSZ];
>   	DIR *dir;
>   
>   	dir = fdopendir(dup(clients));
> @@ -229,32 +232,113 @@ static void create(int i915, int clients)
>   	igt_assert_eq(count_clients(clients), 1);
>   }
>   
> +static const char *find_client(int clients, pid_t pid, char *buf)
> +{
> +	DIR *dir = fdopendir(dup(clients));
> +
> +	/* Reading a dir as it changes does not appear to be stable, SEP */
> +	for (int pass = 0; pass < 2; pass++) {
> +		struct dirent *de;
> +
> +		rewinddir(dir);
> +		while ((de = readdir(dir))) {
> +			if (!isdigit(de->d_name[0]))
> +				continue;
> +
> +			snprintf(buf, BUFSZ, "%s/pid", de->d_name);
> +			igt_sysfs_read(clients, buf, buf, sizeof(buf));
> +			if (atoi(buf) != pid)
> +				continue;
> +
> +			strncpy(buf, de->d_name, BUFSZ);
> +			goto out;
> +		}
> +	}
> +	*buf = '\0';
> +out:
> +	closedir(dir);
> +	return buf;
> +}
> +
>   static int find_me(int clients, pid_t pid)
>   {
> -	struct dirent *de;
> -	char buf[280];
> -	int me = -1;
> -	DIR *dir;
> +	char buf[BUFSZ];
>   
> -	dir = fdopendir(dup(clients));
> -	igt_assert(dir);
> -	rewinddir(dir);
> +	return openat(clients,
> +		      find_client(clients, pid, buf),
> +		      O_DIRECTORY | O_RDONLY);
> +}
>   
> -	while ((de = readdir(dir))) {
> -		if (!isdigit(de->d_name[0]))
> -			continue;
> +static int reopen_directory(int fd)
> +{
> +	char buf[BUFSZ];
> +	int dir;
>   
> -		snprintf(buf, sizeof(buf), "%s/pid", de->d_name);
> -		igt_sysfs_read(clients, buf, buf, sizeof(buf));
> -		if (atoi(buf) != pid)
> -			continue;
> +	snprintf(buf, sizeof(buf), "/proc/self/fd/%d", fd);
> +	dir = open(buf, O_RDONLY);

Maybe O_DIRECTORY if it is open_directory.

> +	igt_assert_fd(dir);
>   
> -		me = openat(clients, de->d_name, O_DIRECTORY | O_RDONLY);
> -		break;
> +	return dir;
> +}
> +
> +static unsigned int my_id(int clients, pid_t pid)
> +{
> +	char buf[BUFSZ];
> +
> +	return atoi(find_client(clients, pid, buf));
> +}
> +
> +static unsigned int recycle_client(int i915, int clients)
> +{
> +	int device, client;
> +
> +	device = gem_reopen_driver(i915);
> +	client = my_id(clients, getpid());
> +	close(device);
> +
> +	return client;
> +}
> +
> +static void recycle(int i915, int clients)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +
> +	/*
> +	 * As we open and close clients, we do not expect to reuse old ids,
> +	 * i.e. we use a cyclic ida. This reduces the likelihood of userspace
> +	 * watchers becoming confused and mistaking the new client as a
> +	 * continuation of the old.
> +	 */
> +	igt_require(my_id(clients, getpid()) < INT_MAX / 2);

Hm this is a bit dodgy - it will cause "permanent" skips if running the 
test in a loop. Just for the client > last assert below? I guess it is 
hard to handle wrap with forked clients.

> +	igt_assert(my_id(clients, getpid()));
> +
> +	igt_fork(child, 2 * ncpus) {
> +		unsigned int client, last;
> +
> +		/* Reopen the directory fd for each client */
> +		clients = reopen_directory(clients);
> +
> +		last = recycle_client(i915, clients);
> +		igt_info("Child[%d] first client:%d\n", getpid(), last);
> +		igt_until_timeout(5) {
> +			client = recycle_client(i915, clients);
> +
> +			/* In 5 seconds we are not going to exhaust the ids */
> +			igt_assert(client > last);
> +			last = client;
> +		}
> +		igt_info("Child[%d] last client:%d\n", getpid(), last);
>   	}
> +	igt_waitchildren();
>   
> -	closedir(dir);
> -	return me;
> +	/* Cleanup delayed behind rcu */
> +	igt_until_timeout(30) {
> +		sched_yield();
> +		if (count_clients(clients) == 1)
> +			break;
> +		usleep(10000);
> +	}
> +	igt_assert_eq(count_clients(clients), 1);
>   }
>   
>   static int64_t read_runtime(int client, int class)
> @@ -719,7 +803,7 @@ sema(int i915, int clients, const struct intel_execution_engine2 *e, int f)
>   static int read_all(int clients, pid_t pid, int class, uint64_t *runtime)
>   {
>   	struct dirent *de;
> -	char buf[280];
> +	char buf[BUFSZ];
>   	int count = 0;
>   	DIR *dir;
>   
> @@ -958,6 +1042,9 @@ igt_main
>   	igt_subtest("create")
>   		create(i915, clients);
>   
> +	igt_subtest("recycle")
> +		recycle(i915, clients);
> +
>   	igt_subtest_group
>   		test_busy(i915, clients);
>   
> 

Okay better than nothing.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
