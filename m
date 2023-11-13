Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4108A10E041
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 10:04:47 +0000 (UTC)
Message-ID: <7d479bc6-7a2e-97c8-b5c1-b90e0567e3d8@intel.com>
Date: Mon, 13 Nov 2023 15:34:27 +0530
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
 <8HEEyr-hZOCEfFX_B7QVCqB5hDIu6JDdaZPl1vyqw6Ep-AMyApTLBdgROVNAKPiKb6fXfAr-Yqz-HcQ4evk3knZ-lGv5F9xjpILCCztDf4c=@emersion.fr>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <8HEEyr-hZOCEfFX_B7QVCqB5hDIu6JDdaZPl1vyqw6Ep-AMyApTLBdgROVNAKPiKb6fXfAr-Yqz-HcQ4evk3knZ-lGv5F9xjpILCCztDf4c=@emersion.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] Revert "syncobj_timeline: don't expect EINVAL
 for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
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



On Mon-13-11-2023 03:25 pm, Simon Ser wrote:
> NACK. Please fix your docs/testplan/i915_tests.rst instead.

As "CI" won't pick the latest head, my patch can't go through the CI. 
And we can't guarantee that my fix may not end up in some other problem.
