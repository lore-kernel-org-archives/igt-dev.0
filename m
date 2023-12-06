Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CB710E059
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 00:31:26 +0000 (UTC)
Date: Wed, 6 Dec 2023 01:31:09 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZW_AzVGpHEXUutgJ@ashyti-mobl2.lan>
References: <20231204053638.29960-1-niranjana.vishwanathapura@intel.com>
 <20231204053638.29960-4-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053638.29960-4-niranjana.vishwanathapura@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] tests/xe_compute: Validate
 ccs_mode setting
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

Hi Niranjana,

On Sun, Dec 03, 2023 at 09:36:38PM -0800, Niranjana Vishwanathapura wrote:
> Validate 'ccs_mode' sysfs uapi interface and ensure compute
> kernels can be run on enabled compute engines.
> 
> v2: Separate num_cslices sysfs interface
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

looks good to me,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
