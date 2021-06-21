Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Mon, 21 Jun 2021 12:12:29 +0000
Message-ID: <BY5PR11MB4372F9795905F5681A318847890A9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
 <YNBp1bQ3YucQAnIs@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YNBp1bQ3YucQAnIs@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] [RFC] tests/drm_read: Fix subtest
 invalid-buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you so much Petri.

Regards
Vidya

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: Monday, June 21, 2021 3:59 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>
Cc: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org; markyacoub@chromium.org; Lin, Charlton <charlton.lin@intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] [RFC] tests/drm_read: Fix subtest invalid-buffer

On Fri, May 28, 2021 at 10:02:47AM +0530, Vidya Srinivas wrote:
> Using (void *)-1 directly in read is aborting on chrome systems.
> Following message is seen.
> 
> Starting subtest: invalid-buffer
> *** buffer overflow detected ***: terminated Received signal SIGABRT.
> Stack trace:
> Aborted (core dumped)
> 
> Patch just adds a pointer variable and uses it in read.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/drm_read.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/drm_read.c b/tests/drm_read.c index 
> ccf9d822fd8d..2fdec5be4078 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -103,10 +103,11 @@ static void teardown(int fd)  static void 
> test_invalid_buffer(int in)  {
>  	int fd = setup(in, 0);
> +	void *add = (void *)-1;
>  
>  	alarm(1);
>  
> -	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
> +	igt_assert_eq(read(fd, add, 4096), -1);
>  	igt_assert_eq(errno, EFAULT);
>  
>  	teardown(fd);

This looked weird but then I checked what glibc is actually doing. This is FORTIFY_SOURCE in action, and read() checks the buffer with __builtin_object_size() that it has room for the read. Which it can only do here if the address is a literal.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
