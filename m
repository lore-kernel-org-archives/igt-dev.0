Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487876EC24
 for <igt-dev@lists.freedesktop.org>; Wed, 26 May 2021 09:36:08 +0000 (UTC)
References: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
 <871radw8dl.wl-ashutosh.dixit@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <518babdc-088f-4e7d-bac6-434d9e2ccd78@linux.intel.com>
Date: Wed, 26 May 2021 11:36:00 +0200
MIME-Version: 1.0
In-Reply-To: <871radw8dl.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915: Handle the case where legacy mmap
 is not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Op 11-05-2021 om 18:19 schreef Dixit, Ashutosh:
> On Tue, 11 May 2021 02:00:00 -0700, Maarten Lankhorst wrote:
>> We will remove support for the legacy mmap ioctl, so handle that
>> case without rewriting all tests.
>>
>> When the gem_mmap ioctl is not available, transparently fallback to
>> mmap_offset.
> Unless we've done something in the kernel, with this we should expect to
> see failures when object size approaches available system memory since as
> we know the mmap_offset page fault handler tries to pin the entire object
> which would fail for large objects. The old gem_mmap doesn't have this
> limitation.
>
> With pread/pwrite gone, the only option for large objects was to gem_mmap
> and read/write but appears that will now go away too.
>
> See e.g.
> https://patchwork.freedesktop.org/patch/426749/?series=88561&rev=3

I think we should be able to do partial mmaps on new platforms too,

if we cannot, then that should be fixed inside the kernel, not igt.

We already have the mmap_offset ioctl, we should be able to do partial mmaps with that. If not, we should probably adapt ttm for shared memory objects too.

~Maarten

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
