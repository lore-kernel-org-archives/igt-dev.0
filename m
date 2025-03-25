Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9467C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8802710E520;
	Tue, 25 Mar 2025 09:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8E/vQHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8914410E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893790; x=1774429790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UAf17PrLc1HrMcjGBG1Hpjw9AlBbzBeZN2qIGtyR8RQ=;
 b=H8E/vQHoxho9iQiVcMyHsbg6t9HKGzawVDJn4ypP7xvlaQT9tI6Nwnks
 mtu4Ukhoa8AZ2Bm3h4V0mztR2rAkih/2x6sfCdx7tPUR2UiE3pTaI/zir
 yGxTqAbxbB/3iOwe/i3rDcQMAnjuIhVMGHzzmqfRc36haDCA54mZwfgLx
 D0AoKEJ3xmPg8aISmoejUTU2bSjyIdRo9a3nNiJV/pydRJp1hgGz8xags
 ATUWnXOtd/4pKu2MdfPzYbGq+3wsgcgEPPbuH/WyNys6LVUxZJ6kpPpuw
 I0v0oXGoet9CUm9lX3lXTBa7UeTzsLFOsxAkCml7oVFgEWoHnVsGhPlvQ Q==;
X-CSE-ConnectionGUID: k+G1T5JKRJGVAienSHiwsA==
X-CSE-MsgGUID: GgyK0RVfRxOs5XXBe84GWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44253120"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44253120"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:09:49 -0700
X-CSE-ConnectionGUID: 6b3Glrn5Slq7kcklP1FbBQ==
X-CSE-MsgGUID: r/Wp+Z1UT7GzuvOEvAI2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="125258686"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:09:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 02:09:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:09:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLiGhV/rK1EcKieacxVFl/slRauJJaH7XLvBrR+Bl0+AF/TuWfRGJ6Bm577HJ4XVI4LoNT+O75xxF9X3lST9WHc6MJxWXwiU3BBECUtWUPzEi31psJImUYbmX+dMW/CdHQMlsW+WQq9b2R2qlXL7vNg+KS6tazRavV4xTWPybjo2HHxJh5U581eqR3+X5OKqDJ1Z/DDHpAfnU3R5F/iEHYqF9DnVx+qZ6ZJ0UoNps3JFAu9aFQBA/pGFdPNBLhdqzKtT4Tu7u9ea/g2Zxtxn86UsAgxNxI+ok3e/qH3x3eewhVSBC7FWMq/2L4kUP0LjC9+8PjdCihjinagLJjLnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUNzvVvu1BwsIEm4IT+H4ngPeL4Gx8+OD3siDiNfG3s=;
 b=hCZKwZ2uTE9CksOFV3NzB3tgpx+P5rUzXbYFvZWqZ5N6Pbf68AT43yIGe9Ow1yYRhOkA4bx1MfHQhx44Cmu18heiHMiNsMKQ6OYiZQzsrafwveenmuuqzdoBY7z0iB59ppBLVn83FKhNhR0d93TJvlmG+jc7anfa3+QWDOUPYlS3Hg6AIl9c7/UhVVjNOqBQfuEY/Xysxi0UTY6tohpflczlWiKKAmGIwie9VsEcVMe12Z+87B6baD2uFvJdY/rS7KiF+NsI2IBztHg4UjseiBPYTP99Ou8QPt82F/ClFgAOm0N1/4ZVJUxpCTUEMMqMiFHK61fyoNDyhK3s6bwhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:09:46 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:09:46 +0000
Date: Tue, 25 Mar 2025 10:09:38 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
CC: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 i-g-t] tests/intel/xe_fault_injection: Inject errors
 during observation IOCTL
Message-ID: <Z-Jy0sYxGt-EIt2B@fdugast-desk>
References: <20250324090801.3121551-1-nakshtra.goyal@intel.com>
 <8500d363-541a-4706-8040-82860134f333@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8500d363-541a-4706-8040-82860134f333@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR07CA0212.eurprd07.prod.outlook.com
 (2603:10a6:802:58::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 2706dc5a-9772-4bc5-deb8-08dd6b7cc9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xp6iBFeogXIpAAaYZyVQhMdDTVRKzF6acEMVdVolOodPrjb7o1hCQQyRJvSI?=
 =?us-ascii?Q?RxwERxExIQUKKKnIx4Xpg1tAxWqES85oWwJaVUWYDB9VVmjv9r4S53h/gym8?=
 =?us-ascii?Q?qRHfysnQYBQnnKYw3geToskEwjp2x3qxlKfnjVmkHCnTe6z2iERQxR7WtlLE?=
 =?us-ascii?Q?f2Rs5GPU0Mu9EF8MdUw+0c4qahu/2VANQQgHP1pXuuydhwZXRxOI/EBiMflG?=
 =?us-ascii?Q?+9glWXtzvPggdTQ3+zmEWQq0XKVSNHH2BRwMQMmaPkkKUXMGYwvBhRTM+FuG?=
 =?us-ascii?Q?1d+RM0ZgptzcejuSbagHVRX4c6ujZ/+j3NMgmRWijB5ifIqDAldGki6tmxw0?=
 =?us-ascii?Q?7qVm6RWok+qefBqXdUpqNrm0Mckk+Biu2DELC+JCvDV9QGrhxcYdhx5xW0+B?=
 =?us-ascii?Q?802y0UrYYFptDdRespSvQYDaTLXs7+ICsbGJ8KxKLJYIUwVuuGGZHTcaeMRh?=
 =?us-ascii?Q?w+SYz2aonXQT5B+rWfjVVTgrS5pKJjxzc4m6s2c09tfYp490IpUFU6U9Jodj?=
 =?us-ascii?Q?582CuWjEHja+4vxZJH8YHQ3lpnLAE/22mtLOXkMOCgNIR3inSqS2mgX0NYK+?=
 =?us-ascii?Q?mgv7sTyiTZ/SeeFuq8JEBWvR8S1AeWPsHIdlHTqG1GWUYJpSDEkz7Uav25Ui?=
 =?us-ascii?Q?Lcef2Ca5f2cbQXlZJ74bOFCavL1CjNEQ6FdRBnWmiYW7jvgHxeu1MyiwTVKk?=
 =?us-ascii?Q?lKmQMxp5UbXkQM7eOeUb+2oMK6KOBKG+oYccFNQbXTAyV4DXpV1tgFkjLpzf?=
 =?us-ascii?Q?xjhIH2cIMzqgSm4qp3cBwTHapt//WLxHWSG/E5+Uyn1ayzKkRSwKlG7HahSK?=
 =?us-ascii?Q?aczu7+El1jlOCmSKQkVqdBbNtrbfyMSYxXSD2rhe8XE2M0rr72nPmcjGfPcq?=
 =?us-ascii?Q?g2nui1DCoVZrEtvpTw7ZRDLLLKgC1g+UuRI6R9qwQ7iO16MMgaB8YbyQA5DN?=
 =?us-ascii?Q?OMo4//HrfM1siUtMx2rVRuTHbrTyqSBJe8Kcs4B6lENcgD7MvO8RqfYmYU0s?=
 =?us-ascii?Q?ru53Z/Vysr/zbptK7Auo8Y5TEOEDBcERfFeVYxLfSAzdt29l4xZd5Y6x2CFx?=
 =?us-ascii?Q?0VeoqpQqeWr3gxF6JV0/6a8ZrBezI+yI9DlbGJ6XtuFypJLvz5hGGnyih/Cc?=
 =?us-ascii?Q?ECChM25wx32CF/91wJ2xaSQVdn+1kv1dCilP0/DtGBgeDEzFWg4v9HMKlCpN?=
 =?us-ascii?Q?zqzf+JVYhv7XITFctEUHUWj1W14ofo9/+hwzf3pDH/CU2NK5H8N2JZa4U3Ab?=
 =?us-ascii?Q?zhQp+AbPt2qJdBeTrfvz4LpdF4uDK43NYwUYlrE8JsAHQZ8wnar8h2dIED1+?=
 =?us-ascii?Q?sNh8drTiR15J+fQvdQQrVoYESduOnO64tLv1apQuupzyrP9xUjSNSBrWz7oi?=
 =?us-ascii?Q?DQbkXbbMV2f3KGbAG/YUhGiorpMt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dy/XWs9UTg0t7wvCmkWL2DrOMkSkZhej/7Qk5uHa+RGu/l7+fJFLtvoZdrcQ?=
 =?us-ascii?Q?u+1qOAhaSHFZNXV+E5oqnq+vmfjgdTi/iEVYKGJMxwhrWrmz3aTXaPXyhX6Q?=
 =?us-ascii?Q?Qrwk65RRSflRj2THrwx6G5x1TMsbDJ4XoaqluG3pXIBAtoofzkPmmdYJnBnY?=
 =?us-ascii?Q?E+W0zOKZp87guISjRAv3p9mXrKoxZvgrQsowst/jd+415ONvlquAmd1uej66?=
 =?us-ascii?Q?/GmB4UPQHd7GO/f7CLmeaBRTzeX3GYvM3cIFalwqpHoD4An3HFw8P78Hbp7O?=
 =?us-ascii?Q?ZpRXvGvec+VM9dw5tiELx+GTZxI6R9XtekpsPI4dnITRcDXpFQIovKM2FSnM?=
 =?us-ascii?Q?e0QwVMYPrjGAlTCXacyAvhFhJayJCiiLMfGA4//JP35khk1+UjXuMUNTnV+V?=
 =?us-ascii?Q?ulUoi+7Z3pUZeoaD228iRsy6xrmn+LvKi5Q9EgRs6WNiFpibtiNKrmawsnPG?=
 =?us-ascii?Q?7cHM02gINx7rk0HGKQmE7athQsFIGn85KQ9IotmahhU1DkJnaFOQTR3bxyQ5?=
 =?us-ascii?Q?UC45t8MxARgbOtGZ75wnpktP3a9eXZ6huobmtXjoeL9PhPfFf9tMtzG9ORTT?=
 =?us-ascii?Q?mmJVefq4XKS6wMzcSy1dWv5/msNvG3R1tnxHmmLYORopGC7UxFo6GC5RHilf?=
 =?us-ascii?Q?afi3IpUDccVnSgW31ShVs7tgrgAUmdRpjqkWszXZ2u4+eRoUCU2iCtEB8WYF?=
 =?us-ascii?Q?Wa1xUdzKAQYJnOHUIo3dmA/k8Rn8Np6rA/6sbkN2QwyfK4Gdxm7BaAwgHxD5?=
 =?us-ascii?Q?PSPYDvPDRwcP/nv0aTnuyRpM+yQclzCPiPJ3UBQqXSL5jNeJ3tb7L6voPO62?=
 =?us-ascii?Q?JrWSHZmoKaPojHzVgOtCos3H18bGMDbzdv7F56fkY+hanAP5gJi5Md6Qof63?=
 =?us-ascii?Q?gY4kf2AH7dPcIw3TmREvNZ9vkuJJQQCDCwzqkb/SzExX2aRJdm9oeQYIU/Dc?=
 =?us-ascii?Q?jxunPOW88z/XqgreUVQ7prfBCy2pXrzW7LCLr0QXDgOR9xwysmtMCVPFUUMU?=
 =?us-ascii?Q?OHqqAUYm0zUvKtkB/ocAFaRJlGzYhtlDtdWfG598Mwf75O8IUMkN3OMeIvFc?=
 =?us-ascii?Q?Zz0Ul/Obzlf/8aABMMli01k3Fc1WMJkExKIs2WtVUXqweHTpV3aZSJntLJ0x?=
 =?us-ascii?Q?4Ln3Mzr2hcqlxdTznHKuPQRHEqaYyigusDqaUGORwubdZDb14qxskubqOceM?=
 =?us-ascii?Q?tWJEG0DLHRVL1re3grpi3DqWWVDS5Dsj1o6JtcOMz37E9wCnrqPCSqJNQTB8?=
 =?us-ascii?Q?YlKMFE5XqN5DOdQ4xLzSsoRL+ZO179EGoBsOh3VXk4FZG9bU2aWdbN/6PWPY?=
 =?us-ascii?Q?BRC+NRnF3R1x0DPYINvG94s5eXanIe/plZGu2VsgwphCHwAYsTbGtqfaJJAu?=
 =?us-ascii?Q?xzfMCzpcW/UNwmQoCByx/XRLuhIhPRFO+FqPzS8PPS95R0OF95H9e/b4VhAp?=
 =?us-ascii?Q?VgH0ZInCQIXa+G14k2cYO9Vi0tD3sFy8br+0baRiGAM0+uEjEhHX+T3Xi5VF?=
 =?us-ascii?Q?XPia6oMjDnYdeO50FE6A+AR8a7tfIe29djYPxf+W5I044kY9j6Movnl4qiR5?=
 =?us-ascii?Q?cIYXjgdZtRVZth4JZQn0mtSBE8TYO/yXq1sprOqdHrnisvSIcgrgUmBpKNQP?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2706dc5a-9772-4bc5-deb8-08dd6b7cc9b3
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 09:09:46.3143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FzjuPJVRH9n9Evm5p821k9Bn3vO0xBVM8LCVjDK7b6LpBvD97ePa00x5XQfVXOd7XbfSA8MC/utJioQe+LMq/V7mn9C4uS807/gOshxTHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Mar 24, 2025 at 02:51:01PM +0530, Pottumuttu, Sai Teja wrote:
> On 24-03-2025 14:38, nakshtra.goyal@intel.com wrote:
> > From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> > 
> > Use the fault injection infrastructure to make targeted internal KMD
> > functions fail when executing xe_observation_ioctl()
> > so that more code paths are tested, such as error handling and unwinding.
> > 
> > v1: Adding remove config at end of test , Adding igt_sysfs into igt_assert
> > so test fails if sysfs read fails (Sai Teja)
> > 
> > v2: Run sysfs check before creating config to destroy prev. config if
> > present, add one check before creating new config after destroying old
> > one (Sai Teja)
> > 
> > Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

Acked-by: Francois Dugast <francois.dugast@intel.com>

> > ---
> >   tests/intel/xe_fault_injection.c | 62 +++++++++++++++++++++++++++++++-
> >   tests/meson.build                |  1 +
> >   2 files changed, 62 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> > index 5409d19a6..eaf93a0b2 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -20,6 +20,7 @@
> >   #include "lib/igt_syncobj.h"
> >   #include "lib/intel_pat.h"
> >   #include "xe/xe_ioctl.h"
> > +#include "xe/xe_oa.h"
> >   #include "xe/xe_query.h"
> >   #define INJECT_ERRNO	-ENOMEM
> > @@ -314,10 +315,57 @@ vm_bind_fail(int fd, const char function_name[])
> >   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> >   }
> > +/**
> > + * SUBTEST: oa-add-config-fail-%s
> > + * Description: inject an error in function %arg[1] used in oa add config IOCTL to make it fail
> > + * Functionality: fault
> > + *
> > + * arg[1]:
> > + * @xe_oa_alloc_regs:		xe_oa_alloc_regs
> > + */
> > +static void
> > +oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
> > +{
> > +	char path[512];
> > +	uint64_t config_id;
> > +#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
> > +			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
> > +
> > +	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
> > +	struct drm_xe_oa_config config;
> > +	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
> > +
> > +	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
> > +	/* Destroy previous configuration if present */
> > +	if (igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1)
> > +		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
> > +							&config_id), 0);
> > +
> > +	memset(&config, 0, sizeof(config));
> > +	memcpy(config.uuid, uuid, sizeof(config.uuid));
> > +	config.n_regs = 1;
> > +	config.regs_ptr = to_user_pointer(mux_regs);
> > +
> > +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> > +	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);
> 
> We could have dropped these sysfs reads as we get config_id directly as the
> return value of add config ioctl. But this way is also correct I guess, I
> don't see any harm as such.
> 
> > +	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> > +
> > +	ignore_faults_in_dmesg(function_name);
> > +	injection_list_do(INJECTION_LIST_ADD, function_name);
> > +	set_retval(function_name, INJECT_ERRNO);
> > +	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
> 
> I still think that it would be better to do an assert_eq to INJECT_ERRNO
> here. But then looking at other fault injection tests, it doesn't seem to be
> very important.
> 
> So, LGTM
> 
> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> 
> > +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> > +
> > +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> > +	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);
> > +	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> > +}
> > +
> >   igt_main
> >   {
> > -	int fd;
> > +	int fd, sysfs;
> >   	struct drm_xe_engine_class_instance *hwe;
> > +	static uint32_t devid;
> >   	char pci_slot[NAME_MAX];
> >   	const struct section {
> >   		const char *name;
> > @@ -366,9 +414,16 @@ igt_main
> >   		{ }
> >   	};
> > +	const struct section oa_add_config_fail_functions[] = {
> > +		{ "xe_oa_alloc_regs"},
> > +		{ }
> > +	};
> > +
> >   	igt_fixture {
> >   		igt_require(fail_function_injection_enabled());
> >   		fd = drm_open_driver(DRIVER_XE);
> > +		devid = intel_get_drm_devid(fd);
> > +		sysfs = igt_sysfs_open(fd);
> >   		igt_device_get_pci_slot_name(fd, pci_slot);
> >   		setup_injection_fault();
> >   	}
> > @@ -393,6 +448,10 @@ igt_main
> >   				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
> >   					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> > +	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
> > +		igt_subtest_f("oa-add-config-fail-%s", s->name)
> > +			oa_add_config_fail(fd, sysfs, devid, s->name);
> > +
> >   	igt_fixture {
> >   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
> >   	}
> > @@ -402,6 +461,7 @@ igt_main
> >   			inject_fault_probe(fd, pci_slot, s->name);
> >   	igt_fixture {
> > +		close(sysfs);
> >   		drm_close_driver(fd);
> >   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> >   	}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 2f5406523..c4a9093c4 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -401,6 +401,7 @@ extra_dependencies = {
> >   	'perf_pmu':  [ lib_igt_perf ],
> >   	'sw_sync': [ libatomic ],
> >   	'xe_oa': [ lib_igt_xe_oa ],
> > +	'xe_fault_injection': [ lib_igt_xe_oa ],
> >   }
> >   test_executables = []
