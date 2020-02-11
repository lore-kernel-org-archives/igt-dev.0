Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C706E47E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 08:27:38 +0000 (UTC)
Date: Tue, 11 Feb 2020 10:27:34 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200211082734.wj6bptg2ka7psgqa@ahiler-desk1.fi.intel.com>
References: <20200122231655.9702-1-juston.li@intel.com>
 <157978751655.1144.297062955688673644@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157978751655.1144.297062955688673644@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bv5=2Ci-g-t=2C1/2=5D__include/drm-uapi=3A?=
 =?utf-8?q?_Import_headers_from_3ff4c24bdb1f?=
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
To: igt-dev@lists.freedesktop.org
Cc: Juston Li <juston.li@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 01:51:56PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v5,i-g-t,1/2] include/drm-uapi: Import headers from 3ff4c24bdb1f
> URL   : https://patchwork.freedesktop.org/series/72429/
> State : failure
> 
> == Summary ==
> 
> ERROR! This series introduces new undocumented tests:
> 
> gem_mmap_offset@open-flood
> kms_getfb@getfb-handle-protection
> kms_getfb@getfb2-accept-ccs
> kms_getfb@getfb2-handle-closed
> kms_getfb@getfb2-handle-not-fb
> kms_getfb@getfb2-handle-protection
> kms_getfb@getfb2-handle-zero
> kms_getfb@getfb2-into-addfb2
> 
> Can you document them as per the requirement in the [CONTRIBUTING.md]?
> 
> [Documentation] has more details on how to do this.
> 
> Here are few examples:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d
> 
> Thanks in advance!
> 
> [CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
> [Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> 
> Other than that, pipeline status: SUCCESS.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100200 for the overview.
> 
> == Logs ==
> 
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100200

Can you document the newly introduced tests? Otherwise looks good to
merge.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
