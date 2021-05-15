Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4A86E457
 for <igt-dev@lists.freedesktop.org>; Sat, 15 May 2021 23:58:28 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Sat, 15 May 2021 23:58:24 +0000
Message-ID: <BYAPR11MB37845ECF7EF6ABBC7E169F608A2F9@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
 <20210514064953.1644250-4-alan.previn.teres.alexis@intel.com>
 <1f62b09d-dd6a-063c-253d-e0db2ff4a73b@intel.com>
 <ba2dd6163c733eb1f6377175578d0bf01d8d8045.camel@intel.com>
 <87a6ovsi58.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87a6ovsi58.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 03/16] Add basic PXP testing of buffer
 and context alloc
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I have been using checkpatch.pl on last few revs with zero issues. One caveat though and I just realize this now:
- when I run checkpatch "--no-tree -f my_modified_file.c", I don't get any warnings.
- when I run but running on the patches I get warnings about "exceeding 100 columns".

What is the official hard rule? Are we at 120, 100 or 80?

...alan

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
Sent: Saturday, May 15, 2021 4:16 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t 03/16] Add basic PXP testing of buffer and context alloc

On Fri, 14 May 2021 02:40:26 -0700, Teres Alexis, Alan Previn wrote:
>
>
> Okay - i will fix them all and push a new rev.

Mostly coding style looks good now but an easy way to check for style/indendation issues in the code is to run checkpatch from the kernel on the IGT patches and fix all issues which are not kernel specific (and also ignore those which don't make sense):

https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl



_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
