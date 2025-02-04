Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45833C02193
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07CE10E079;
	Tue,  4 Feb 2025 18:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMB13H+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9E10E079
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692995; x=1770228995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J95URdbesc3GVSknyGCFyf/3Jeb7Af8oouHXNPWn1Qc=;
 b=JMB13H+FoAZuS8TWBJMf2z8fhAw1VoP2k7ZYhTdM83NTjCv1jwWJ2CuQ
 B8/t9Y8QaRIzjdm86DNUxerejInZlvYuJiNEcdDv0HBaH+zWF9xGdp9Js
 Upn9uYDt8uG580ds9/ZzfMFbxDgFfKgJhh0SADYZvAWPXZmf+4gW7gTev
 AiGhI1Araf/50E3oKlxaAIS2qb7D+1liNe9JGHN7xoh9OjFLkt/4sPCm2
 hBEPKImd3pbxhtkTOtIsclL6MzIhpX701eOXSCsibvMZMOEzUuW4bhVjW
 rZoJgDN/zH7ojcWpWYiiI1j3eZ1/ehMuQyMf4y0/t4lScBappz71zYq4N w==;
X-CSE-ConnectionGUID: UIc3540vSViPqTx+JgvBiA==
X-CSE-MsgGUID: g7dPj9OHTxmWqGgxV48HXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39264976"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39264976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:16:34 -0800
X-CSE-ConnectionGUID: pdujEkqMSM6pfiwO0zkwug==
X-CSE-MsgGUID: AD/cgbmLTt2WOsrXXcOCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110845697"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 10:16:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 10:16:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 10:16:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 10:16:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oljS8+fMDm6K8KOSqz9MFcUn3X541mJL7mI7SQrrwIQB6XDA4GJ1cOGCIVIr2/MpKOFtaPSz8DGAqyi+1qH5Q09D22MfiWFcZnElzJ3fEFKN4OmpKP+gChxXx2zdbl/vKzpdAdtnrmnBUyXZK3Ctfr8GhvcVlTTUPAj125uMNemZjrTa92OlO0srWuyieiEa39hO16B0u3f7RhTiuMX9a8mZmf0oKDOgeG1ybU3xk+iV7i3pid7C9LcZrJf9JqXslBfrdJYO49zSJMREp68nHbkk/SSj0k5v9OsjG+Iv04brrtLzOmg1qAJoYPU4zl2z+gGErm19O75nJnWvAEqncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r51bzpvVnXM1NyaHxRzsuwlG7ZnvXJzKoGITpk33j3c=;
 b=n4GSPES3PMXNrg6UxpiTTM9sC5sM2OwkN7QjrN7POOEALRuc2BYtU2CrU30RFcXkXnoRQKjno2urvBO6M7HKVApGx1U/RzbB9loy+dcTR2h3OG6erVojgD4/2a5tJx0vnim2/2dyqK1RZ+N3frln8UqYno4Qo0UTb6KrczzyFTSm5YM3xFBcpiB/E26BvyRxvfz/aVGBqctpHttgh6PlWL2sknK2kdx7qGc35t4cuL3M27crNw0S5aUjpLociDhavzraUJi4GU+mwV3AXYK8B1tJeIsDrQTLPXr0pQzO4PH+El1U+SGHT+8mPpp6Kyh7MmwOf8wPtXrt37mCKtbvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CH3PR11MB7348.namprd11.prod.outlook.com (2603:10b6:610:14d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 18:16:25 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:16:25 +0000
Date: Tue, 4 Feb 2025 13:16:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6JZdGTnucfiqC6P@intel.com>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204175302.18147-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW4PR04CA0325.namprd04.prod.outlook.com
 (2603:10b6:303:82::30) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CH3PR11MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: eb46a274-54ac-4e90-48ea-08dd454807e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LhFYxHIpOSVjzCajlE1fcqg1cmyUzn1LUJSVENA9WIDEYgeUsLS4s+IHMla5?=
 =?us-ascii?Q?s+ADRHhK8jPMAzfMfSgXhxIR62YcNkamMh/m/FY0pql3oQMwW5udkhFxBxks?=
 =?us-ascii?Q?9EpXRAAMs4rNqO4So/QFg/XNG1tR7M9Ud4zdFHOl5VGFh67jKLUHmJ7VfQV0?=
 =?us-ascii?Q?QNDyP3HoZ5VuNTXv8QvsEwms0RqeR0j35Uz1iD1piuZJk/VT5qp9Mi/4cchC?=
 =?us-ascii?Q?UHjc4i20ud8w3Md30/A+u7xZyWt7DqG/4aOAI0d1QeOx3D5jO03L5X1pOvFw?=
 =?us-ascii?Q?LYQ2BCfJyP7gesaZQsemJ26hORkbiW08jd4hnr2/zOewWBmMGpdOleKLam+q?=
 =?us-ascii?Q?/7Q5NPwJdghsvH2IKitj7iw38fSbit6QlY3L762XgZigxpl8OgvgZB66XC5v?=
 =?us-ascii?Q?pPvFJQMpdbrlztvdgPswQK1QAfkzuAUJ77Kg6cINv3VCphXoL8Ig863Z7ICK?=
 =?us-ascii?Q?WWBUaTddXZ76LovbZ42C3pSktc4CaYY1HsplqdguluU2vzutMtH1uOA+ZyuM?=
 =?us-ascii?Q?GLBeG2j1s3FE42vznwDhjeX0NjR3+kjuvw5XIU/0G36QvREONoPYBNtwXlTn?=
 =?us-ascii?Q?8zEcmgF9YBm3JG/fkbT9mpDD92rzBajif/NVQNeqwdjFlwqdzwzy9v6cJO6d?=
 =?us-ascii?Q?9pbE4J6uqNd9bCNW3Y0/xZCJ3JRoBJEeyMJAgkHmpChGrnoxZIFXmKCYrUOR?=
 =?us-ascii?Q?2ndF3qk9Nyct83cn6d2gIZO15dOAJauibhPxIBssTys8awnSyhLqawVgkqsk?=
 =?us-ascii?Q?z4oXa6lvck8omApbKkI3sS2CK4lryqdsLIM0qx9HDEvcjpRlPCG6RQu38buL?=
 =?us-ascii?Q?+AKQlNvrq/m2bgWjreWgDliBHBalR9BLnXL1aXR2KIZAZhO+Tc+B/Jl7qUpF?=
 =?us-ascii?Q?R0LGbfJk7cowLbNH2uPnSKHkq72nD2Hh7wisBnF6MclbUYc37ioKZxU3oCkD?=
 =?us-ascii?Q?sdbQfxEHnq2jQ+QJhweQ4D30diOlp5m30zLJ4RLAtC61wiiRXegXpq1Eh4Yd?=
 =?us-ascii?Q?BDobUbOKD8JH7s6zmS3Bkzy4bcGrMabj2IBxfp43qwseHVYgk9cn6mDNJBw6?=
 =?us-ascii?Q?0HbbGYwFaJ5kFN820eQp4RkNkYSgSDFI5AP0x05e7qeFsDsLLbA/ZEZr9o3o?=
 =?us-ascii?Q?OtbXJUg+K9zf7h8WgHDlNJppBaT6QuvtbmckGfWOXspewHpZQo1l7RzRiIpb?=
 =?us-ascii?Q?D6O8CbPUBxa+GeTRWlZ9raUDpl+PfWko8+hTOJ+mfR5rQEQsvwPm4JmC8XLj?=
 =?us-ascii?Q?hDA6bZGQ9yoYxc9JqOd+41W7bQUwRsVkpEk5/O0+tkpUckUcrkiIQ3B/A2CJ?=
 =?us-ascii?Q?jRIGiLoQGFOp4u1anQaFTsvyY9o8ia0e8LPW/UBDivkif1LWChjPKxteczkP?=
 =?us-ascii?Q?OyR68zRcOAKaoEDV4PBCdkHCrA7G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:ca; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qEYoFrJqYUM9yBI/C0bCnafUrg9X/N5xDMqjmuiHuvncHmCU95xOXlJYbyVP?=
 =?us-ascii?Q?ZZz4UQM2qw/2HhZToqgAj6x6Op0XXqu7veOGs7+vrV7jMnh+8h5UW665Gr0w?=
 =?us-ascii?Q?4vjmhxI807g7NROfCwIOPV7t4DKVHG5zD/cKkzGJDL8iKMTQ5XfQWZaGAcH4?=
 =?us-ascii?Q?TbvTFHxLeIcwbWV+VZx5sWYd18klOYkwDSneXA/9EtXqyHHzliUvgDrSewJN?=
 =?us-ascii?Q?EyHdfDTmyjQ/mNHblVrXW7FNH/Fgsn9jqbBhYCsAcqg8aPuw0zfBbVoniVuk?=
 =?us-ascii?Q?zQ4h26E0T7me+g13HMfLWq54932MZBZQIKkOnZAV6I/v/C/HBtY2lbM0g6TI?=
 =?us-ascii?Q?pzjG0NxwFxw4f5JnBtACw4VUjkyX0pcaqeiP8U49QFPqBWmj4Qx/hSC2zCx9?=
 =?us-ascii?Q?s0VCTIOAs0/JO9xj7dvijGTxlq9/adNsujn5Dw1dDCRACsux3ttwnoKEGXMV?=
 =?us-ascii?Q?wvzK2YqkeuJj6w11rGOaZR+CcdA2GxBocrvS9Xgp95y5a2jB+Y4oRLQLd+D5?=
 =?us-ascii?Q?Gv7d7DgiAA96k7H1xiO3p3UzkZ8zryOjPktMzRyL0S8ehQ10Ng9Cy+4qvsyF?=
 =?us-ascii?Q?reegf58YYw22iIOjqxtQaHjjfAkItg63xOw8Ap+D80ZJokM4kkx7XyScpg1T?=
 =?us-ascii?Q?HCR6L5HYD9FrWTkVBiiEyrhPRYNU/Cj7XKorAZK9MV0m+YKzz9ZeP2hP0zhQ?=
 =?us-ascii?Q?wnXGji644zM9MPCWeWuEuF8OtENMslKOfpHQoW3UsGOa7SKz0HX4I+w9fmIw?=
 =?us-ascii?Q?6DJV+0H7u4LoYRMC6NWnafmsbtXBfOftbgNiqFOZsOe7axgSeEbGdLuOZAVF?=
 =?us-ascii?Q?ahcvQhpEqnKDcUbC0tA3se+fPxRs38jtdIKQpCzzGWs0V6BZjEkt4d9zNOfT?=
 =?us-ascii?Q?a6k8GCpJ4zA5bgNyTjHOXjDHOfsPxrlHpbML2+OR0GhFSbl1IRD7RqVMyKed?=
 =?us-ascii?Q?x0NM6nR9RHUI7EXoDeEJWkJT3p8iP0BV3DbA8chvxwF/7V4zwVl1vPqyU3/E?=
 =?us-ascii?Q?mMxvsd5eM467r8dx0xFJ70JwLLhvbnX3atMwzmRWSec1J1DpL0UJrO4dRjAQ?=
 =?us-ascii?Q?itlz6REQS8VpmV94BzOolXUNMok0dIsvdA5/jApydn4oeRxSDJ84LfQ4/0mC?=
 =?us-ascii?Q?WyPcliDdy1oyPo+EIrvMFuoVwnsrNGtc/irl0YtSRV9wOkqp62JOCGQM+SNZ?=
 =?us-ascii?Q?nh5QEeRbv7UMVf2T074q9JYfV1T2MDDxZPN11W47AD7s//tn4uQd6qL73C27?=
 =?us-ascii?Q?0yxrAcSlDNwvQsrnsvSy41T3HgaMLDn8+QtGDWJMlnyQ9ryr2lKw06Okt/Wb?=
 =?us-ascii?Q?rpU8G6WHYUv69daHenn9L8NQIGmUvSdZsutk9OKGhOLyQBR/QAOOtrGznG1B?=
 =?us-ascii?Q?rP+YMzEVwRIhQPcIk4Kla/M5PqS+hwBPIg7m95t15K733cWh/xW17RRjWdHY?=
 =?us-ascii?Q?uPzUIcMNnAD/qnEc5wJIUyy07D+/P3TRYo6soglbh0vXEPpm9xzQaBA1cUNh?=
 =?us-ascii?Q?L8frx1S14AWCH8XVue0Qt1a76GxFTut+GO7Vxrmik/qEwEN+HTREu1ZO81I2?=
 =?us-ascii?Q?lOf4YQt9r/+0W/SPXcdzrTsHEQl85sBmskd9eSHRbui0bU+BIeSd8FkWUqp9?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb46a274-54ac-4e90-48ea-08dd454807e7
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 18:16:25.2104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvGXJlZq50AH6tYI9VytI5NWurR7M2vzDEygl1xnn+Jyum3WbxaOLSH2V6rtpCfSFriW4XKh4kfZA0YVb1zHbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7348
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

On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> There have been several changes to pciids upstream that need to be
> sync'd into igt.
> 
> Sync with the following kernel commits:
> f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> ranges")
> e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 23f349f65..4736ea525 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -717,37 +717,66 @@
>  	MACRO__(0xA7AB, ## __VA_ARGS__)
>  
>  /* DG2 */
> -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> -	MACRO__(0x5690, ## __VA_ARGS__), \
> -	MACRO__(0x5691, ## __VA_ARGS__), \
> -	MACRO__(0x5692, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A0, ## __VA_ARGS__), \
>  	MACRO__(0x56A1, ## __VA_ARGS__), \
> -	MACRO__(0x56A2, ## __VA_ARGS__), \
> +	MACRO__(0x56A2, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>  	MACRO__(0x56BE, ## __VA_ARGS__), \
>  	MACRO__(0x56BF, ## __VA_ARGS__)
>  
> -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> -	MACRO__(0x5693, ## __VA_ARGS__), \
> -	MACRO__(0x5694, ## __VA_ARGS__), \
> -	MACRO__(0x5695, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5690, ## __VA_ARGS__), \
> +	MACRO__(0x5691, ## __VA_ARGS__), \
> +	MACRO__(0x5692, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A5, ## __VA_ARGS__), \
>  	MACRO__(0x56A6, ## __VA_ARGS__), \
>  	MACRO__(0x56B0, ## __VA_ARGS__), \
> -	MACRO__(0x56B1, ## __VA_ARGS__), \
> +	MACRO__(0x56B1, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>  	MACRO__(0x56BA, ## __VA_ARGS__), \
>  	MACRO__(0x56BB, ## __VA_ARGS__), \
>  	MACRO__(0x56BC, ## __VA_ARGS__), \
>  	MACRO__(0x56BD, ## __VA_ARGS__)
>  
> -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> -	MACRO__(0x5696, ## __VA_ARGS__), \
> -	MACRO__(0x5697, ## __VA_ARGS__), \
> +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5693, ## __VA_ARGS__), \
> +	MACRO__(0x5694, ## __VA_ARGS__), \
> +	MACRO__(0x5695, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A3, ## __VA_ARGS__), \
>  	MACRO__(0x56A4, ## __VA_ARGS__), \
>  	MACRO__(0x56B2, ## __VA_ARGS__), \
>  	MACRO__(0x56B3, ## __VA_ARGS__)
>  
> +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5696, ## __VA_ARGS__), \
> +	MACRO__(0x5697, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> +
>  #define INTEL_DG2_IDS(MACRO__, ...) \
>  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> @@ -782,9 +811,12 @@
>  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* MTL */
> -#define INTEL_MTL_IDS(MACRO__, ...) \
> +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>  	MACRO__(0x7D40, ## __VA_ARGS__), \
> -	MACRO__(0x7D45, ## __VA_ARGS__), \
> +	MACRO__(0x7D45, ## __VA_ARGS__)
> +
> +#define INTEL_MTL_IDS(MACRO__, ...) \
> +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>  	MACRO__(0x7D55, ## __VA_ARGS__), \
>  	MACRO__(0x7D60, ## __VA_ARGS__), \
>  	MACRO__(0x7DD5, ## __VA_ARGS__)
> -- 
> 2.45.0
> 
