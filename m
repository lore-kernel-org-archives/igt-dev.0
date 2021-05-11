Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959A6EA11
 for <igt-dev@lists.freedesktop.org>; Tue, 11 May 2021 10:40:16 +0000 (UTC)
Date: Tue, 11 May 2021 13:41:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YJpfZMmb2Vu+/F8B@platvala-desk.ger.corp.intel.com>
References: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
 <YJpTbnb1mdUScc49@platvala-desk.ger.corp.intel.com>
 <d97a3684-a7e1-53f7-ad1c-c5a34826d8ba@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d97a3684-a7e1-53f7-ad1c-c5a34826d8ba@linux.intel.com>
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 11, 2021 at 12:07:06PM +0200, Maarten Lankhorst wrote:
> Op 11-05-2021 om 11:50 schreef Petri Latvala:
> > On Tue, May 11, 2021 at 11:00:00AM +0200, Maarten Lankhorst wrote:
> >> We will remove support for the legacy mmap ioctl, so handle that
> >> case without rewriting all tests.
> >>
> >> When the gem_mmap ioctl is not available, transparently fallback to mmap_offset.
> >>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> >> Test-with: 20210510132305.1440923-1-maarten.lankhorst@linux.intel.com
> >
> > Test-with needs to be:
> >
> > - in cover letter, not in patch
> > - in kernel's cover letter, not IGT's
> >
> >
> >
> Thanks for the explanation!
> 
> Is a cover letter required even for a single patch?

Yeah, T-W parsing is only done on the cover letter.


-- 
Petri Latvala

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
