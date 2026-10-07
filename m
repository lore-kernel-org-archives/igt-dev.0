Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B039BCA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33A10E483;
	Wed,  7 Oct 2026 14:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJyful5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072B510F64D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791383686; x=1822919686;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=F5aeLOLOwvLB38ZmullxMZx9S0K3xl/NMes6IGRUGrI=;
 b=iJyful5tDOtZOQyoJHfdx6F/GgU0qVdlF0kpXSurIE/yPCuuv9IoeruR
 1bB7sF6nxM+T/KT4aPMa3vHDj5fAJNu1NmY03GF6rUPs7rQnhxrhREhaE
 JIsKXJcgKVgRQWmnxB2u4dJm21agZmOpmSoTCc8R7xDxgWlxP7pfxz8QN
 ZnuaCGrPPuI6IrVOAOgyy3FMng3v9TCQdo1NpAgpXy9Xo9g77LWcLfzfr
 DntGmH0fESn97baNbquPRnk+3qYgKQA7kW3AivyG67TT+vz+c9G/2SpeJ
 Mdjynex0QFwa9GXNIEdAD5Vgd9UvK6qFmVII9qmMRtYZfk8aijiBqW0oM A==;
X-CSE-ConnectionGUID: mmhVb4obRnyqhmHiBaeQIg==
X-CSE-MsgGUID: kiFdhmziQpekudigTPjhWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="154782"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="154782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:34:46 -0700
X-CSE-ConnectionGUID: IqnFJ0rbTvaiBIlG0JGiKw==
X-CSE-MsgGUID: W8b0E12DQtirIMp71AEU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="306933619"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:34:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 07:34:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 07:34:44 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 07:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Om7kzzaTvjOOlRACrgf8vLtSfe5iXhCw3RI29BNcwaUFAGfsknYw9LmXSY0ormH+BepRRQs4ayrydLrTO/QGFw9UjA6iGrljUkOxDt5q1l/XZOqOC7RwrMo7ukPxWvAYDR8aOcv4TMTX4KRVP8mPcwEep6QBAKjZIiilCFVg+gcLKeWCd5VenrU+9jxnwo43Xlf5DMmYK0b3pnFudA8R/E5Bq4sZoBVtuPxgvJHJo2VYjPlwjogi7Ioqe38Ysg1elaQfO2zfyUEhDFPkbBiwSH1iLx9Qvl2Aa20+u80z4l/iqPO50X0EJstUd/YRK34kjxDMtFXxb/DbcIKz6yKAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drwpAPM/owthmUdSAExUnlK9zo5k40gFy1nIbztqa+Y=;
 b=gPWAtDy6gZSg5CwMo2Hpcd9HZtKcq/SZAIY/PQowLEenVPT6v4h0D1zxds6UxAerFJHT4QTEn8jIbcGG6XhaSLSJgGZLZ6QqfgUtExDd6SOnarqk3m+YJv7nBc7NnxHV+0N57jHrMBfdfXik+ojSVtAwcyOsbTHj26TjASS7Sl3ncSM2QAdjPexg90X0CGBcCYG8JmxM3uwr7ZAA7JAFmo76oGS/47jOo6XNJigIicXVphTajZol0kVIkxkFkQPEu4jtzyc7e9sOKXLhuIWOu+QwPs7mO0JRGmv8aCUB1/TNkPeeTvh4OArEWIbHrwsjw+RuKIKQT2KUGhPgEnx26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS8SPR01MB75130.namprd11.prod.outlook.com (2603:10b6:8:447::6)
 by DS6PR11MB425752.namprd11.prod.outlook.com (2603:10b6:8:528::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:34:43 +0000
Received: from DS8SPR01MB75130.namprd11.prod.outlook.com
 ([fe80::20cf:2704:5868:5a54]) by DS8SPR01MB75130.namprd11.prod.outlook.com
 ([fe80::20cf:2704:5868:5a54%4]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 14:34:43 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 0/2] Fix igt_runner hang and resource leak
 associated with pw-reserve
In-Reply-To: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
References: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
Date: Wed, 7 Oct 2026 11:34:38 -0300
Message-ID: <87fqyha8ap.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To DS8SPR01MB75130.namprd11.prod.outlook.com
 (2603:10b6:8:447::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8SPR01MB75130:EE_|DS6PR11MB425752:EE_
X-MS-Office365-Filtering-Correlation-Id: ea92b37d-7475-4f8d-4eb5-08df24802090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: NoIL3WzxuXrge9a765EAlAtglQVL9vKolR9gzsZf4sfA5GNJIaETsgSMfekGs43+RCg0eDun5XRYin//xvbfE48EMM0ihwX5j+Tl/xfOEJPYZ2ZcFq15zvYBaymMJ2ZrJ6SfrHHCLNHUGuT0ZHI5SeThuOc8+HzFQ4tGv36EJRD5L/f5k2S9x0TX73GU7vvs7gJ3poqq8YaK2yUUewu00Z+yHzCN4QGT3ZKxlL3XJyK87oWGaYeTXV5kLUjY2La44d2yu2G5iqNqAYciyXgyw/WxWQB2E7E5x77nM4bcbWJVA07/ZbVZDfRgL2ITjaV/elcppXxRa/BWMqBaU/GjefshKBI5WzwQ13ME61CHaUFm8d/gstl0ev4EA0OYkgcpHpw9ms2sh7I3GbYyDj07XSVyeioUwusu2hGbkFy3LzeYngiCD8aB75UJXWVxlDzJHsAdrzVgqcq3E7VKpRwCNSfBuHSxXMz+vBhV84sV9KnEBGNy+wj1mcIG6LPOV6KeVTwch4vSnOrfpSgBUhF7Ge7hJKWJVoZi4uv8/2WeXh8fu8FlP+JMyxviZtcA6USMBYKmb1bSQXwktIFXEcOaCtgZ63l7X4ZwrKTOMlA/f6zBepG/4/dzQvVOR6PBe0golm2wI5G/q7D/KNDKk7gqGPY/mOBJXNVq70JgVTZ8Cfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS8SPR01MB75130.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LMYQk1N+dUsrA1pTHcSKMK7NANyVIN/bcw/LHBt8v3fZ9yHC2dsGQUmzax1e?=
 =?us-ascii?Q?wgLNAepTzm3ivhSIpWXVwuP/JGSDbSvsry5Izw34R+FDzpWT4SeAdS2ELoQv?=
 =?us-ascii?Q?qC5cqA4uE76hfhHZe0zWE7jkjEfLloVtFlEiK8I8WRcGMnYO3KVdInQMS8p+?=
 =?us-ascii?Q?5ja6st4khg3sIxlIOXDCuXe6FjJ/s8JeP+RsVzKVjH6mP9FqJ3HJareZzC/W?=
 =?us-ascii?Q?OKbJWL2GfEorO4rwAo2r8+eMoL7HHeftfW/tinM/ZjtMxsw1IVo/zIZbXuIn?=
 =?us-ascii?Q?DgUXq8RKYR0T0No/7tP8SVdBlJOynxC79H9gAOe6TypP8LRdOAdaTPf3gIBd?=
 =?us-ascii?Q?TLEK+QTI5L2irDZK9a7hBi9F4yuFnzZJr8eFxclPDC2x4lPMcmhymDeRCGQN?=
 =?us-ascii?Q?PGu+BnCPGtEi6C7v5o3eDfTs4butbZUbpsFyGdcGkBTG3+Gc8dzPIJ4o6wWd?=
 =?us-ascii?Q?DF0vAr4hC1s6NubUP1jyo8ZLnIfHQD5YGLHXZB7fhA+blJz1dLMhap040vmH?=
 =?us-ascii?Q?ffCe15Yd2JJYS+8D90Sp9goynlLIYzBvH++SkXNLmgJCLnC3yQ7nREWLfR0/?=
 =?us-ascii?Q?jEgG7d4h0mDHzBEVtNXUmT77t/y7GCgCD6gNpj+huI0cKb6Sd+SGT2HFXKKP?=
 =?us-ascii?Q?tlMwRqMQBUDCQe4ELzT5RGFKAl1JbP7ld+zI0+9KPengjMg9zQywSJQB5N/X?=
 =?us-ascii?Q?GW7nIPXiOSUKoKqXDDcmTUwJnrXummzyU+u/2QU3HGyJV1DmWSdr8M/M/gUr?=
 =?us-ascii?Q?ptunE/wNC5iiYomWHcvrSfGD4uvnj9s2qJMrl4oNHSTBu/VdQxeOlgxD379s?=
 =?us-ascii?Q?vS1fDTvpCCR92XbekbLax9iP0Gg5CmMjSDJXdiYHFo4mr3ptQ/hzjkvZG18K?=
 =?us-ascii?Q?ZGjuY3Wqzdn5X6vB+fuM7lm3a1AROYd4BlWug6Er5vRfC2zNe/lGW62Zmqu7?=
 =?us-ascii?Q?c15i+gQdkR8bRXwHVO6cD6XRcupfK3XIWZNemvZRrjIj4VyDUrgDPMB6baD8?=
 =?us-ascii?Q?mLf8eDgXwUm/GMjdmha/syMgrSGnng+RUhSMU2qqbmd68pFd3lW/w0WjZ7Ym?=
 =?us-ascii?Q?G+gO+ePEGRiofe+xcmHkZRyB+o0JWR4ZORZEkV+mHEPA/kCtO0oK46/nCslj?=
 =?us-ascii?Q?GXUW+b9AKeTMygbsCMd7YaYVeu3u1o5+0NkD5/bjhe76SEdx15v11ioB65u1?=
 =?us-ascii?Q?WhOpg9DA7VouUMYkwG+4cdmQwIj32H+e63hwVQLcPS8u8DP76+AfMGhAa7Da?=
 =?us-ascii?Q?sULiOxA2SZugyJzIIu7pJRttWT0P44zd0fSOcpQsDKcILmW8Mh9PEgotTNEA?=
 =?us-ascii?Q?jMzlUQCKTAHTT5QMvdApFnCYyKEiNpx3gStfrwnwfQyUtIMj5tmNFpKUBD4/?=
 =?us-ascii?Q?rQugOMs2izprFkBbkBm0UXzFpUiqF30kgB9kQ5TyFixySCXZO8ri4W1B39eT?=
 =?us-ascii?Q?IC65bCVF0rfcH1f4xBNJs1MMyObYZL9dGbJiJLeoKqDnelBt4GadfTveSHxT?=
 =?us-ascii?Q?8LUhM97ZPf/XXUFmdDJw6tgbEWLWvsj7t2+FVAPd00GDkZxhl380eLHlnrkV?=
 =?us-ascii?Q?EBnQaew0agFkEU3PFoMXU1M1j8QvgergFvFL5zRI+nEnuQpz+afTJxn+dwjZ?=
 =?us-ascii?Q?32iKZ1S5sIQTc+4jtILuYmZlmT1cCetHQRDKE1iMSA4SdTWeJs4x6aad9f3o?=
 =?us-ascii?Q?dJvId7wZdQMBkBxPHltjbLavtyKQ+ZMg1sLu4HeZ7mT9cBUfsah7zUbmT2pm?=
 =?us-ascii?Q?xNw83AC7dA=3D=3D?=
X-Exchange-RoutingPolicyChecked: XYli8FvETWGL5H+nAtdRlX/3nKGQNHlzqWBgspvc6FBTLiXWVJUjD8CGfQzBxhrxUS0EsB1h6JGsUD751m6irFPWff4yyes7WyFpSIB/FmvASiLL/CdY6Vt53UDPh3/vr/Q4U11XcSMBtTI21TUG+qbTN5bXZPGLbWagXxzFRUQ74J+8qFIXS+gRCQd8GlvB9zsP/xMbY540RQE2t+46r6P6LcO4R60s486olj0bYU1xITi0/y2UtR3+M9IJdf6LgshL6TVv44PLUq+/WAlI/ElSo5h9JTr7Ws/ScqLdpw6/2LTzdMtZkLVpc6PsTQEJ1LzqTP9+qFFKi87wpbYohg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea92b37d-7475-4f8d-4eb5-08df24802090
X-MS-Exchange-CrossTenant-AuthSource: DS8SPR01MB75130.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:34:43.1219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQe15pEp/09bPkpE9wls6xd07n5BkmTX6cgYQGiCr/CnqDipzt/lWNPGSz9+IckpWl+MdYp9Ic45hD55AiyC5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB425752
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> When running igt_runner on an interactive SSH session we realized that
> the runner would hang when testlists contained test cases that would
> unbind/rebind (or unload/reload) the driver multiple times.
>
> Some debugging revealed that the hangs were caused by pw-reserve
> processes created by IGT not being properly terminated.  Let's fix
> that.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>

Please disregard the patch text below.  This should have been only a
cover letter.  Something clearly went wrong when I was editing the cover
letter. Sorry about that.

That said, I think the real patches (patch #1 and #2) are still
reviewable, so I'll wait for feedback on them instead of sending another
version only with the text below removed.

Hopefully this doesn't confuse CI!

--
Gustavo Sousa

> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index dbb90756babc..18053db8ff46 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1898,13 +1898,10 @@ static void pipewire_reserve_wait(void)
>  		setenv("HOME", homedir, 1);
>  		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
>  
> -		/*
> -		 * pw-reserve will run in background. It will only exit when
> -		 * igt_kill_children() is called later on. So, it shouldn't
> -		 * call igt_waitchildren(). Instead, just exit with the return
> -		 * code from pw-reserve.
> -		 */
> -		exit(system("pw-reserve -n Audio0 -r"));
> +		if (execlp("pw-reserve", "pw-reserve", "-n", "Audio0", "-r", NULL)) {
> +			igt_warn("Failed to start pw-reserve: %s\n", strerror(errno));
> +			exit(1);
> +		}
>  	}
>  }
>  
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> Gustavo Sousa (2):
>       lib/igt_core: Check if helper proc was alive before kill()
>       lib/igt_aux: Call pw-reserve with execlp()
>
>  lib/igt_aux.c  | 11 ++++-------
>  lib/igt_core.c | 20 +++++++++-----------
>  2 files changed, 13 insertions(+), 18 deletions(-)
> ---
> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
> change-id: 20261006-stop-pw-reserve-ae63047af2d4
>
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
