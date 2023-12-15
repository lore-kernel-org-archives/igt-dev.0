Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C491510EA35
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 16:48:11 +0000 (UTC)
Date: Fri, 15 Dec 2023 11:48:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v1 00/10] uAPI Alignment - More cleanup before upstream
Message-ID: <ZXyDQ-zgcibgQY2B@intel.com>
References: <20231215155050.7-1-francois.dugast@intel.com>
 <87sf43bgt5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87sf43bgt5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 07:56:22AM -0800, Dixit, Ashutosh wrote:
> On Fri, 15 Dec 2023 07:50:40 -0800, Francois Dugast wrote:
> >
> 
> Hi Francois,
> 
> > This is a combined submission of series which have been sent and
> > reviewed separately. It aligns with this kernel series:
> > https://patchwork.freedesktop.org/series/127878/
> >
> 
> Could you please set your SubjectPrefix and label your IGT patches
> [PATCH i-g-t], then they will reach my correct email folder ;)

I wonder why do we still need this?
I understand that we needed this when igt was still using the same intel-gfx
mailing list so we wanted a clear way to differentiate the igt from the
kernel patches, but I don't see much sense on this after the mailng list
is split.

> 
> .git/config
> 
> [format]
> 	subjectPrefix = PATCH i-g-t

I even had forgotten that I had this there :)

> 
> Thanks.
> --
> Ashutosh
