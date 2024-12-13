Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F522E77180
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 20:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E981510EE77;
	Fri, 13 Dec 2024 20:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcpwW2EG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1710EEA3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734122449; x=1765658449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GQq28OM5SYwHLm+PFKndtUukoal7PKcqc9PncVs5/hA=;
 b=IcpwW2EGsVC9SyQO3a4BVXpYW58BnUdFWU2kztjir3vyeKwRzGxrM2EJ
 hHDsfmVSLucf7BueNvA8RTjd0fFpXQL2Wz6ctQhgWLYsbdCFsXijzVqxD
 d4WXwPhx0uwWFikUaoZ5iHH5La8wmfdmK8q+jf9H3f11sLdO9JrP1sVxr
 z0iwAG15yfI+Zx8isc4jjAdjlmsHpPt0mw0NuzCKHrUDNgCE275UeN64o
 bIDWb/kDDPyxorEQgNzKhUz9auGWCyaTpGh8p9DwKvE1sJdnXFEwYAvHn
 br5JG47O0hTiAMdAPgHwla4bk8gAfWfwnjeUP9rLDzRPKib1i45iSsM7O Q==;
X-CSE-ConnectionGUID: aa0wUdF2TyKcwbSvl+zKOQ==
X-CSE-MsgGUID: tP73Y4XPT32AnWUYwFkqQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="51997251"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="51997251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 12:40:49 -0800
X-CSE-ConnectionGUID: klPSDDUdTVCpOPplS5vz7g==
X-CSE-MsgGUID: fg6wZQcsTs698s+F+TRR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100785474"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 12:40:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 12:40:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 12:40:48 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 12:40:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiLhzJIDWw3rZCRf0Snzxj7cXUcQ+klCdWSIXW+NxzptyJv5hneCtsrr92AQ5JGVoDG2dlLlsHRX4hd7FfReCCQ2RPMxWr+e1xpUfIbWNt4m4KHj3gOvTsgyk5uz47kEjO0DBSVodk8wLp2GqRXZQPSvupGIu23gg0+VKCm3l4PWtDTH4AaTEH+mik7PhKP0RuTO4QTweAWcXiB1QQinmNQqq2XM7nsmTyZDhkstYMsNf58IlCs81skWDeZFigjEuyE0oapVfjKvyr0R9uOO6eZ5tt/V8e9NAo/ESBeD4LXzxNMPfk9McfAoiw0ViDctyqxvGX9i6/ap5S4cGwv8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlQ77dPk873tCKfO3AVYHs4U6rNdxdpm5qtA3dTCfrQ=;
 b=yGL1O65HoMdetAki5HEg963YwZ8jX70dC4q1qjdAWhn7sijKAZ9rYg8hT1RU90WR4GA/SUZbu0jnRQDUADD5r9ayCfC2QsCNxeNnfVTl43SHk2ICSrfhYNwH9QW+FPSTsxyxZjfm8DdCgAdZxbeVoyOWeNsqLB7Ac9Bpi9DA8+4lDxaF3VRKIMHtXIgfHU7jZj0Zf/Elg3mJlxl1G8pSVNd0r3w4tbIjFiIHqo1xpbZeU41kwk8Fg3/09Drp18hhy09rnrMxkxYJNSGiYNypoTK346gIUNL50rnfMg5Gtnrom1v/+Ou1MgcRC4YEUi6R+IY9gYo5BVqkAWVztAhSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 20:40:40 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 20:40:40 +0000
Date: Fri, 13 Dec 2024 15:40:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <kamil.konieczny@linux.intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] tests/intel/xe_wedged: Add AUX error to ignore list
Message-ID: <Z1ybxDYsHhbxuJEa@intel.com>
References: <20241213164105.14015-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241213164105.14015-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: e35b37bf-2b3a-4454-0bf0-08dd1bb667e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1b1IZxj0+N8pN4Y+O9VS5UQ1qdDApvhLea3b/GHM83+U7ZJ57OJ4XqjVZQwF?=
 =?us-ascii?Q?rHyMDvOdPiU0JRO2MvKeIasvUaAs/Yt++n6A3iXyhqzntPc0IN6jOL5qdFW+?=
 =?us-ascii?Q?WbLCGO4dKadb47S0vGBpxgNftiOre05G90vjwIY4deg7TsYQwHeWPjNlAta0?=
 =?us-ascii?Q?p9nibbBwHblY21254si21T07b/iYI4KSGa/qbndFh0yEXgakYd9F2bKowrm4?=
 =?us-ascii?Q?F5Msoqe8G6YJzFTYXbBknZIzvXGyS7owilJWO0v4qDoopqUUg4lfYX7UaMmz?=
 =?us-ascii?Q?2zFAgiShj2vOHc5JPmtEoDmABXvkDIFYT52by+ziygNj/QL3Vo2eTSAI+E+w?=
 =?us-ascii?Q?JvS5ahunQuX03IvmA6UmfC/VCNKYrzy/hTIEc5uH9mUO5iT3Bp9pSty9vs36?=
 =?us-ascii?Q?AbyEACgzJY1xoSg6EvZ3xJxgsdrFrXfM3BZszRDuJXgoPs1xwZpD9RyZ40ta?=
 =?us-ascii?Q?8edp2LPHTBgAEftM4PB6CM2CUzj1XtJPUWUCxuVG6pMQCfaS8j/w3vIZtjm7?=
 =?us-ascii?Q?qHQJqWf33bXlmujbPH3Yv7pQ8cMgNfUwvLFj9eZcW5dHFQTd5KShudpaXOrR?=
 =?us-ascii?Q?iotQMe4KL/O1UumysfoKQrwmtZf1Yjp+4OCG27jERP+fVMGvHE8HSorlXZ3X?=
 =?us-ascii?Q?P3qev/BBIZZJiJzqTfI1EQGpIgw93+bpRuC3h4kTsQ2aytUKi7y+d+z84a2g?=
 =?us-ascii?Q?Ols6WysjKzSiZ/7rF91JoenQvM+pYrWI1rkja82sknPF7Y5jqOu5n1U9gxXV?=
 =?us-ascii?Q?qWWuPomW3OiNLEy45EmuCFYLpX8Tm5EpwlWviPn6frrO3gb50fpS5HtYVymV?=
 =?us-ascii?Q?1BNhRhhdINFcO6h5wBByt5iyd5YCUrc3mdVg2a/VRVWxeBtsEletOUjwU1k3?=
 =?us-ascii?Q?0V5Tqpg19f3PeAmLO6u2Ey5rTrWbnKEKbnNijCKDA91zmoYU6Lysni7uF9Wp?=
 =?us-ascii?Q?I3dz11xJ0ol/TJdRg+j2XnXjg5RG0F4hc/Mcwld3w61JO9xVDcYnyRchBLsz?=
 =?us-ascii?Q?1v8qQZ7DQGtTdZe01mxj5fX+4ELI7GL8du3c5jwe6NenPmZVw4cJNGPXgSDD?=
 =?us-ascii?Q?Pckdh5AhUPphBsEkLN/RH6iMCrrxb8o8qTG0Hfg0VxkLc4krS0WgwLUa4Y/O?=
 =?us-ascii?Q?Pvi7MZC/8ekQnwiKaf8KMnwVnG7MTL6WgDHt3O+pdSE8bNN0gixETWxWCky5?=
 =?us-ascii?Q?qeh6TGOrwgGgWvSRlnyjObIc9kZG4C6ejZK0a7FaLEBKD1tD8G7ShzQxB2d+?=
 =?us-ascii?Q?/ggMvH537jfWhkUCM4a+PRmBXFGKXmAtM//p18/1Hp+sJpVLH9+4rW033R9r?=
 =?us-ascii?Q?8bYJOzVOPnQ/hN+77XNgvQ5V+KT21rH7Ot8umahKP32cVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7q67DUSlz9mI6glWz0DPmxUmSwR+7zbBQh7msCM1v3Ud6gih+Rg2cE1odAfc?=
 =?us-ascii?Q?LccmKv9awMR9jWPeZU9fwlFyTqLF8PlDBvJD0cbME/hPEEsIXRTJek+9D+85?=
 =?us-ascii?Q?ZlNiR8KgCLgHgXV4XLdN5/kEo0uizDNuhCp5rV8ExOHKci7rgQq3DbzSdMFq?=
 =?us-ascii?Q?7L1lSrEUnYuTvxMrfyXTtMVtt9IwBUf8GWQrXHHfvcyyASo0hm0s41cez4LE?=
 =?us-ascii?Q?AyC41igbXJzQFktIlR0Q767OdM6yszBNq+Kz0F3XhQW45JoNt/RkuVPCQ2nR?=
 =?us-ascii?Q?O36Vlqf3CdDYImnKVVcAiAf15dFAFvHxa1q9rQsqIGRQN03wUgNro8M4h4a2?=
 =?us-ascii?Q?EQJhkTYt9evgrZ5nXXd3/OMVfb1irSfoFyaQ/lFbVIvHkK5fXpvnU1PSVm4d?=
 =?us-ascii?Q?Wx5TeuxGxU8Robbf6rMPAt8cHAYj9cimxltQLq48pXTJCCXRF2tVVDDRiIZn?=
 =?us-ascii?Q?OashjFJnXcPa7gAPE3PTcQRzzSzSPAYBkQeO+StMElp0S++XsDZYNnEoS5SZ?=
 =?us-ascii?Q?P/zM3sAD0M2IpiVV/cKLvMuRKEbULeYtVOMBjeMxy8o6cIbW5LwAfp02SVDP?=
 =?us-ascii?Q?ZO37AKwdGLuKKkrSkyTMVmz3Di49yuHSHu3X/+fA4GDtZ2T+dnn+vgeZtOuR?=
 =?us-ascii?Q?eWZFXvGarJFg8TBBT4RG9hiRQodeyjwZNIW5J5k9kx7IpM3FEWC5bg/Q+esV?=
 =?us-ascii?Q?Lw6W4QQE2U3GzBa0i56xnL2vdQx/4ValPa2O85+SNPQehlcxP9dxbXW9HtsR?=
 =?us-ascii?Q?qzzQCfUnh9fP2FcU6MnT30GuKAGNHBSzj+AOxVCo4+JEFSGWdNhvXojLG78E?=
 =?us-ascii?Q?2pE+aXtdpattjqZix1BZaKyxIxzXXtZcVkZc0IaGnrpJ4+QcIhq5pWMvGoh1?=
 =?us-ascii?Q?mKLHV95b2cshsvxVOxgsyovWBp93zqNj7ISCABj6wfpxjvYQJEh7yc6dDsXj?=
 =?us-ascii?Q?AYbBfs0vC38AgU4xSTpr8z+zgke8qscAmPdgwfWe3qrGSLzjVWKffMxjj1Yd?=
 =?us-ascii?Q?JUEnIj4kTQyA3Sk8h0Z7bg0mTqiowMirVsRj0G7bGf5NFr4bG2bIK/TXzmTe?=
 =?us-ascii?Q?14jesBSv5AqwTYLBxzWh+OsH0wHuqS0FDvCCzLQ1niaVMGIlpEEBeiASKwDp?=
 =?us-ascii?Q?7Bd/rhML8Wui6tpGqLY01l3lpSF1hu4UU9v52fkT7oGaZAWOfk2ulIHFHExW?=
 =?us-ascii?Q?8c1Y+nUX7Puva46Op3LcNvqJ3JxKjPWe6ati+NXpuI4cNpUWMuLfobsJaTXG?=
 =?us-ascii?Q?0ONyxeH74usL3OXzWpSgFNGLJl4edIN+/a0aHnuv4bGRHJ4ZuPZaVR/QuLb8?=
 =?us-ascii?Q?Hi2tnut7s1pWjrSE9KKFPFLkJwLh9BLsuupm9qQ8QEQvEO0ldX/ZvwRT05GW?=
 =?us-ascii?Q?K6LArm1pDOlZzRpeg0L8JdtblHHqbllI+eCldnrll+R3ZxaMnZE6hu6sRNfr?=
 =?us-ascii?Q?9yLTlNsDDIMnTINA1/NP49mxq5EkqGcodAY2e4ydMWtQYXp7t/bt65d1xXpH?=
 =?us-ascii?Q?izt11cTSklUnmlTLaK/D28B1TcgICnbZZW8hxl4nErtHFySrZfZ0S9vUxC+x?=
 =?us-ascii?Q?EKmC5uIYW8avc73LX+C7CfUoUGPEhezY7mp2wqZIEIAabWrUwqfwJdjweRyk?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e35b37bf-2b3a-4454-0bf0-08dd1bb667e9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 20:40:39.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfY3j5aBpUv+Jvo4DLV17LyjZZvJ/IqXIRDpBfROaskGNx0i4lrn4xwg6v5rNAg5hzSoqnm4B/XFnCnaBi2Pag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
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

On Fri, Dec 13, 2024 at 04:41:05PM +0000, Jonathan Cavitt wrote:
> There is yet another warning in dmesg which should be ignored.
> Specifically:
> 
> xe 0000:00:02.0: [drm] ERROR AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

this is a side effect... we should probably investigate a better
way of handling that in the driver I'm afraid...

> 
> Extend the regex further to cover this error.
> 
> Fixes: 21076ee0 ("tests/intel/xe_wedged: Ignore more dmesg warnings")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Zbigniew Kempzynski <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_wedged.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 613d571b44..65d715e845 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -33,7 +33,8 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
>  				    "|GT[0-9A-Fa-f]*: Failed to submit"
>  				    "|Modules linked in:"
> -				    "|__pfx___drm_");
> +				    "|__pfx___drm_"
> +				    "|AUX [A-F]/DDI [A-F]/PHY [A-F]: .*");
>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.43.0
> 
