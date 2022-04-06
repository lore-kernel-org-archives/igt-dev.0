Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8DC10F2CC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 07:28:52 +0000 (UTC)
Date: Wed, 6 Apr 2022 10:28:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <Yk1BJ2mcf668FnsP@platvala-desk.ger.corp.intel.com>
References: <20220405084138.3216500-1-tvrtko.ursulin@linux.intel.com>
 <20220405084138.3216500-2-tvrtko.ursulin@linux.intel.com>
 <YkwKPGec1jTxuhlw@platvala-desk.ger.corp.intel.com>
 <e26c88e3-c6aa-57b7-2524-3155870dd134@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e26c88e3-c6aa-57b7-2524-3155870dd134@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib: Extract igt_drm_clients from
 intel_gpu_top
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 05, 2022 at 04:44:57PM +0100, Tvrtko Ursulin wrote:
> 
> On 05/04/2022 10:22, Petri Latvala wrote:
> > On Tue, Apr 05, 2022 at 09:41:31AM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > Code movement with some improvements to prepare for further work in
> > > making a vendor agnostic gputop tool possible.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > ---
> > >   lib/igt_drm_clients.c | 395 ++++++++++++++++++++++++++++++++
> > >   lib/igt_drm_clients.h |  96 ++++++++
> > >   lib/meson.build       |   8 +
> > >   tools/intel_gpu_top.c | 521 ++++++------------------------------------
> > >   tools/meson.build     |   2 +-
> > >   5 files changed, 573 insertions(+), 449 deletions(-)
> > >   create mode 100644 lib/igt_drm_clients.c
> > >   create mode 100644 lib/igt_drm_clients.h
> > > 
> > > diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> > > new file mode 100644
> > > index 000000000000..435de5364f39
> > > --- /dev/null
> > > +++ b/lib/igt_drm_clients.c
> > > @@ -0,0 +1,395 @@
> > > +/*
> > > + * Copyright © 2022 Intel Corporation
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtaining a
> > > + * copy of this software and associated documentation files (the "Software"),
> > > + * to deal in the Software without restriction, including without limitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > > + * and/or sell copies of the Software, and to permit persons to whom the
> > > + * Software is furnished to do so, subject to the following conditions:
> > > + *
> > > + * The above copyright notice and this permission notice (including the next
> > > + * paragraph) shall be included in all copies or substantial portions of the
> > > + * Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > > + * IN THE SOFTWARE.
> > > + *
> > > + */
> > 
> > Add SPDX line to new files please.
> 
> Oops I thought that was just the kernel thing!

We're slowly getting more SPDX declarations where we can. Which is
basically only new files.


> 
> > > +#include <assert.h>
> > > +#include <ctype.h>
> > > +#include <dirent.h>
> > > +#include <fcntl.h>
> > > +#include <stdbool.h>
> > > +#include <stdio.h>
> > > +#include <string.h>
> > > +#include <strings.h>
> > > +#include <stdlib.h>
> > > +#include <sys/stat.h>
> > > +#include <sys/sysmacros.h>
> > > +#include <sys/types.h>
> > > +#include <unistd.h>
> > > +
> > > +#include "igt_drm_clients.h"
> > > +#include "igt_drm_fdinfo.h"
> > > +
> > > +#ifndef ARRAY_SIZE
> > > +#define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))
> > > +#endif
> > > +
> > > +struct igt_drm_clients *igt_drm_clients_init(void *private_data)
> > > +{
> > > +	struct igt_drm_clients *clients;
> > > +
> > > +	clients = malloc(sizeof(*clients));
> > > +	if (!clients)
> > > +		return NULL;
> > > +
> > > +	memset(clients, 0, sizeof(*clients));
> > > +
> > > +	clients->private_data = private_data;
> > > +
> > > +	return clients;
> > > +}
> > > +
> > > +struct igt_drm_client *
> > > +igt_drm_clients_find(struct igt_drm_clients *clients,
> > > +		     enum igt_drm_client_status status,
> > > +		     unsigned int id)
> > > +{
> > > +	unsigned int start, num;
> > > +	struct igt_drm_client *c;
> > > +
> > > +	start = status == IGT_DRM_CLIENT_FREE ? clients->active_clients : 0; /* Free block at the end. */
> > > +	num = clients->num_clients - start;
> > > +
> > > +	for (c = &clients->client[start]; num; c++, num--) {
> > > +		if (status != c->status)
> > > +			continue;
> > > +
> > > +		if (status == IGT_DRM_CLIENT_FREE || c->id == id)
> > > +			return c;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static void
> > > +igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
> > > +		      const struct drm_client_fdinfo *info)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	if (c->pid != pid)
> > > +		c->pid = pid;
> > > +
> > > +	if (strcmp(c->name, name)) {
> > > +		char *p;
> > > +
> > > +		strncpy(c->name, name, sizeof(c->name) - 1);
> > > +		strncpy(c->print_name, name, sizeof(c->print_name) - 1);
> > > +
> > > +		p = c->print_name;
> > > +		while (*p) {
> > > +			if (!isprint(*p))
> > > +				*p = '*';
> > > +			p++;
> > > +		}
> > > +	}
> > > +
> > > +	c->last_runtime = 0;
> > > +	c->total_runtime = 0;
> > > +
> > > +	for (i = 0; i < c->clients->num_classes; i++) {
> > > +		assert(i < ARRAY_SIZE(info->busy));
> > > +
> > > +		if (info->busy[i] < c->last[i])
> > > +			continue; /* It will catch up soon. */
> > > +
> > > +		c->total_runtime += info->busy[i];
> > > +		c->val[i] = info->busy[i] - c->last[i];
> > > +		c->last_runtime += c->val[i];
> > > +		c->last[i] = info->busy[i];
> > > +	}
> > > +
> > > +	c->samples++;
> > > +	c->status = IGT_DRM_CLIENT_ALIVE;
> > > +}
> > > +
> > > +static void
> > > +igt_drm_client_add(struct igt_drm_clients *clients,
> > > +		   const struct drm_client_fdinfo *info,
> > > +		   unsigned int pid, char *name)
> > > +{
> > > +	struct igt_drm_client *c;
> > > +
> > > +	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, info->id));
> > > +
> > > +	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0);
> > > +	if (!c) {
> > > +		unsigned int idx = clients->num_clients;
> > > +
> > > +		clients->num_clients += (clients->num_clients + 2) / 2;
> > > +		clients->client = realloc(clients->client,
> > > +					  clients->num_clients * sizeof(*c));
> > > +		assert(clients->client);
> > > +
> > > +		c = &clients->client[idx];
> > > +		memset(c, 0, (clients->num_clients - idx) * sizeof(*c));
> > > +	}
> > > +
> > > +	c->id = info->id;
> > > +	c->clients = clients;
> > > +	c->val = calloc(clients->num_classes, sizeof(c->val));
> > > +	c->last = calloc(clients->num_classes, sizeof(c->last));
> > > +	assert(c->val && c->last);
> > > +
> > > +	igt_drm_client_update(c, pid, name, info);
> > > +}
> > > +
> > > +void igt_drm_client_free(struct igt_drm_client *c)
> > > +{
> > > +	free(c->val);
> > > +	free(c->last);
> > > +	memset(c, 0, sizeof(*c));
> > > +}
> > > +
> > > +struct igt_drm_clients *
> > > +igt_drm_clients_sort(struct igt_drm_clients *clients,
> > > +		     int (*cmp)(const void *, const void *))
> > > +{
> > > +	unsigned int active, free;
> > > +	struct igt_drm_client *c;
> > > +	int tmp;
> > > +
> > > +	if (!clients)
> > > +		return clients;
> > > +
> > > +	qsort(clients->client, clients->num_clients, sizeof(*clients->client),
> > > +	      cmp);
> > > +
> > > +	/* Trim excessive array space. */
> > > +	active = 0;
> > > +	igt_for_each_drm_client(clients, c, tmp) {
> > > +		if (c->status != IGT_DRM_CLIENT_ALIVE)
> > > +			break; /* Active clients are first in the array. */
> > > +		active++;
> > > +	}
> > > +
> > > +	clients->active_clients = active;
> > > +
> > > +	free = clients->num_clients - active;
> > > +	if (free > clients->num_clients / 2) {
> > > +		active = clients->num_clients - free / 2;
> > > +		if (active != clients->num_clients) {
> > > +			clients->num_clients = active;
> > > +			clients->client = realloc(clients->client,
> > > +						  clients->num_clients *
> > > +						  sizeof(*c));
> > > +		}
> > > +	}
> > > +
> > > +	return clients;
> > > +}
> > > +
> > > +void igt_drm_clients_free(struct igt_drm_clients *clients)
> > > +{
> > > +	struct igt_drm_client *c;
> > > +	unsigned int tmp;
> > > +
> > > +	igt_for_each_drm_client(clients, c, tmp)
> > > +		igt_drm_client_free(c);
> > > +
> > > +	free(clients->client);
> > > +	free(clients);
> > > +}
> > > +
> > > +static DIR *opendirat(int at, const char *name)
> > > +{
> > > +	DIR *dir;
> > > +	int fd;
> > > +
> > > +	fd = openat(at, name, O_DIRECTORY);
> > > +	if (fd < 0)
> > > +		return NULL;
> > > +
> > > +	dir = fdopendir(fd);
> > > +	if (!dir)
> > > +		close(fd);
> > > +
> > > +	return dir;
> > > +}
> > > +
> > > +static size_t readat2buf(char *buf, const size_t sz, int at, const char *name)
> > > +{
> > > +	size_t count;
> > > +	int fd;
> > > +
> > > +	fd = openat(at, name, O_RDONLY);
> > > +	if (fd < 0)
> > > +		return 0;
> > > +
> > > +	buf[sz - 1] = 0;
> > > +	count = read(fd, buf, sz);
> > > +	buf[count - 1] = 0;
> > > +	close(fd);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static bool get_task_name(const char *buffer, char *out, unsigned long sz)
> > > +{
> > > +	char *s = index(buffer, '(');
> > > +	char *e = rindex(buffer, ')');
> > > +	unsigned int len;
> > > +
> > > +	if (!s || !e)
> > > +		return false;
> > > +	assert(e >= s);
> > > +
> > > +	len = e - ++s;
> > > +	if(!len || (len + 1) >= sz)
> > > +		return false;
> > > +
> > > +	strncpy(out, s, len);
> > > +	out[len] = 0;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static bool is_drm_fd(int fd_dir, const char *name)
> > > +{
> > > +	struct stat stat;
> > > +	int ret;
> > > +
> > > +	ret = fstatat(fd_dir, name, &stat, 0);
> > > +
> > > +	return ret == 0 &&
> > > +	       (stat.st_mode & S_IFMT) == S_IFCHR &&
> > > +	       major(stat.st_rdev) == 226;
> > > +}
> > > +
> > > +struct igt_drm_clients *
> > > +igt_drm_clients_scan(struct igt_drm_clients *clients,
> > > +		     bool (*filter_client)(const struct igt_drm_clients *,
> > > +					   const struct drm_client_fdinfo *))
> > > +{
> > > +	struct dirent *proc_dent;
> > > +	struct igt_drm_client *c;
> > > +	DIR *proc_dir;
> > > +	int tmp;
> > > +
> > > +	if (!clients)
> > > +		return clients;
> > > +
> > > +	igt_for_each_drm_client(clients, c, tmp) {
> > > +		assert(c->status != IGT_DRM_CLIENT_PROBE);
> > > +		if (c->status == IGT_DRM_CLIENT_ALIVE)
> > > +			c->status = IGT_DRM_CLIENT_PROBE;
> > > +		else
> > > +			break; /* Free block at the end of array. */
> > > +	}
> > > +
> > > +	proc_dir = opendir("/proc");
> > > +	if (!proc_dir)
> > > +		return clients;
> > > +
> > > +	while ((proc_dent = readdir(proc_dir)) != NULL) {
> > > +		int pid_dir = -1, fd_dir = -1;
> > > +		struct dirent *fdinfo_dent;
> > > +		char client_name[64] = { };
> > > +		unsigned int client_pid;
> > > +		DIR *fdinfo_dir = NULL;
> > > +		char buf[4096];
> > > +		size_t count;
> > > +
> > > +		if (proc_dent->d_type != DT_DIR)
> > > +			continue;
> > > +		if (!isdigit(proc_dent->d_name[0]))
> > > +			continue;
> > > +
> > > +		pid_dir = openat(dirfd(proc_dir), proc_dent->d_name,
> > > +				 O_DIRECTORY | O_RDONLY);
> > > +		if (pid_dir < 0)
> > > +			continue;
> > > +
> > > +		count = readat2buf(buf, sizeof(buf), pid_dir, "stat");
> > > +		if (!count)
> > > +			goto next;
> > > +
> > > +		client_pid = atoi(buf);
> > > +		if (!client_pid)
> > > +			goto next;
> > > +
> > > +		if (!get_task_name(buf, client_name, sizeof(client_name)))
> > > +			goto next;
> > > +
> > > +		fd_dir = openat(pid_dir, "fd", O_DIRECTORY | O_RDONLY);
> > > +		if (fd_dir < 0)
> > > +			goto next;
> > > +
> > > +		fdinfo_dir = opendirat(pid_dir, "fdinfo");
> > > +		if (!fdinfo_dir)
> > > +			goto next;
> > > +
> > > +		while ((fdinfo_dent = readdir(fdinfo_dir)) != NULL) {
> > > +			struct drm_client_fdinfo info;
> > > +
> > > +			if (fdinfo_dent->d_type != DT_REG)
> > > +				continue;
> > > +			if (!isdigit(fdinfo_dent->d_name[0]))
> > > +				continue;
> > > +
> > > +			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
> > > +				continue;
> > > +
> > > +			memset(&info, 0, sizeof(info));
> > > +
> > > +			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
> > > +						    fdinfo_dent->d_name,
> > > +						    &info))
> > > +				continue;
> > > +
> > > +			if (filter_client && !filter_client(clients, &info))
> > > +				continue;
> > > +
> > > +			if (igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
> > > +						info.id))
> > > +				continue; /* Skip duplicate fds. */
> > > +
> > > +			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
> > > +						info.id);
> > > +			if (!c)
> > > +				igt_drm_client_add(clients, &info, client_pid,
> > > +						   client_name);
> > > +			else
> > > +				igt_drm_client_update(c, client_pid,
> > > +						      client_name, &info);
> > > +		}
> > > +
> > > +next:
> > > +		if (fdinfo_dir)
> > > +			closedir(fdinfo_dir);
> > > +		if (fd_dir >= 0)
> > > +			close(fd_dir);
> > > +		if (pid_dir >= 0)
> > > +			close(pid_dir);
> > > +	}
> > > +
> > > +	closedir(proc_dir);
> > > +
> > > +	igt_for_each_drm_client(clients, c, tmp) {
> > > +		if (c->status == IGT_DRM_CLIENT_PROBE)
> > > +			igt_drm_client_free(c);
> > > +		else if (c->status == IGT_DRM_CLIENT_FREE)
> > > +			break;
> > > +	}
> > > +
> > > +	return clients;
> > > +}
> > 
> > All this stuff needs documentation.
> 
> A bit more documentation yes, cover letter acknowledged that. ;)


Shows you how focused I am reading cover letters :/


-- 
Petri Latvala
