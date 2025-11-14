Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD00CE8D4F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 16:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95AD10E24D;
	Fri, 14 Nov 2025 16:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3bvJru8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6988110E24D
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763138447; x=1794674447;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j2YVAxMvb0qfGNMDm28CJu1JaJKQ8EZzSeaQTwgZuCI=;
 b=J3bvJru8pDuQl8CtA5Mf7WZaHZyMmVrza+of98328tK+XdpiKxEna4oo
 D4DVEqsdCV1BrahB70gnhTzZPGvgUEp5f49rDZl2W67miRG3b9EKQqDxx
 N1FbWZe1I/+hc65cHric49Kk+yCWrsKb+KAUMYMVap4dBJMSxFVxSXQ0M
 3IPTzIhFEmuqwUzIy4jA2Tj1Kzznoby2gxiK6Grp448VXH2oMyjCuX/t1
 Sjd4J5fy1ao7iJxkxFDgrXN10IQQvLps1ObnEj9Ki7Co+D+UOintUDFw9
 v3QQUm1QZAOob6VZ2jcWu8qKRoTYRxzBllzXVNBGRHDU8IQurzm5jNa7T g==;
X-CSE-ConnectionGUID: LJRGE9ADTLKVnYtN+AcBqw==
X-CSE-MsgGUID: P66t+bgSSp6iEIrJGihovw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="52803443"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="52803443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:40:47 -0800
X-CSE-ConnectionGUID: vY4M+R6xS6Wv1nfTMRYrCQ==
X-CSE-MsgGUID: I7nKd++bSKqcG3H8/UNixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190603469"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:40:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 08:40:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 08:40:46 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 08:40:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5DBHbTQfQkoz5ILWWTcqNp7ue8eQdiUdDCfpUMQpXs51gInGrTvYWahyuD9xQN/mW37pIOjaCElIqnq+KzksZiAGBs9FK6TEZB875lQlZQhGLn8/yh+8BetdWv84AIfRndr91p7EYxbaAdyXHyUdPdgBUYMOotjqivyWCHXJB3D6VdbVqfe6COQb9E/epToJOYGvbxsNviP8rOHAOm09iwVz/CuFEovAYN9smeT3LLrff22K7dMtuvRbvYz24Mu3elweqHt6Pzx6TfvVeb8JVJ6GTPcIXC16X9koE7y5x9M2zbr00CG+hEJXCVcGasLP/wNDoCOc2zrZFhUs80l2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLZegniDUkVQiSSiQaEVfQoPAQPJ4g5DnZZzDrnNnkk=;
 b=mQ4cAfJO8fuEZyr55vfM0tpquIvoJYJC2mj5GZGIKK8JbjXKZtqVMK5gGu2BXvBbQIw5neP+bb4aQTCYUfm8hn3xQt9UIrODlTn2sJgd1KM5+eOHwSbl21ZQ523o/Gp4GHjGpO7oF0oCI3uRgCsUCw5I3TxCnARQNYCwV+so/y7NQabTSSEtiCu8Zy070QM8NSc5Li/FkXF6wQ/hvCfNEg9KPH2+BsQsmC+NXhhYS4m1cFKUPj8tUXqTbKFmCV0xt0B45BmBW7QN/Gh1bip3mowiPtq0O/zIN6fS9J63CoqmQdIm/nfe8ZZDK4Nj4blfUFefOCPbMLIyNR5SaCT+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:40:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 16:40:43 +0000
Date: Fri, 14 Nov 2025 11:40:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tauro Riana <riana.tauro@intel.com>,
 Iddamsetty Aravind <aravind.iddamsetty@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2] tools/drm_ras: tool to communicate with DRM Netlink
 Subsystem
Message-ID: <aRdbhmqXkJoR6iCN@intel.com>
References: <20251114100729.102365-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114100729.102365-1-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7fa51f-b8d3-4705-de42-08de239c8d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dHVgWkQCIxmOxmkfhrClHJb27rvwjDp8h4LIhZWj7NwSTPclJXvRPvXm8p?=
 =?iso-8859-1?Q?45NbzOByoTaYM4nh31L7olGXCkX2xfi8hDxetb1AzS4WEugR4CaFoLbVfs?=
 =?iso-8859-1?Q?FztcNYHdkXgv4fJX1CA0V5ce6InVEUnp4JB6pA2qpsHaTCnglnikMir22s?=
 =?iso-8859-1?Q?CMHRC1MMAx8yuRp4b0Dl5gT0k5G1huJJC8Y2Rf0Fck5YZnzSv0BnUs/dBM?=
 =?iso-8859-1?Q?watbjS5vMa0Z+36bLQsG0++HjrxBzVjs0Seuk9NjaDYcyilWei/3y67eih?=
 =?iso-8859-1?Q?eSJEwJkegPLTvXhBSCeJhJnYPktbAvDGPQDxdJdvItBD1nWoY7rbOSDYpK?=
 =?iso-8859-1?Q?nDeke8O7dldyg8X5Pyn9TGYMFG6Xr2JNTDINPy+gsjm6irTrP5+raOJSF6?=
 =?iso-8859-1?Q?v6Z5/N+rwdjUFRONdZoKjsb3WmhvYuE6//kJJqFi7y9RUamRJisbCC1/08?=
 =?iso-8859-1?Q?B8PAGnYzurPldXMjJ/k+qOwKqlyXMJgEMdkvyaAMtkGTHMLgT+rdNFYR4C?=
 =?iso-8859-1?Q?AdSoIKxtXipPyREqKo57dUq+LN/FocaObWSfgDFjBTEjqmUwfQLCLRnLBJ?=
 =?iso-8859-1?Q?JZfqJ9RdOzadhDOwR2RXyTLO8PUFKOHTMfB2LIdZls3JAM0nux7fvGT1VM?=
 =?iso-8859-1?Q?jvulS2GLHkYZo83J1duQMDKXCccQPARGRHXxLIf1F6mcydFWKvWqL6RKaf?=
 =?iso-8859-1?Q?7RD3uFy1UxGlMXBOT8407eo1aCNDWnERr3MvKeP0ibVPvXpBIyazXoApwY?=
 =?iso-8859-1?Q?7CDhQFXPMolkgoz5OtH0R5fTEQHXtW4SmTb5pq4ONwUZMmbkTn8R16bjTI?=
 =?iso-8859-1?Q?QS7cvDGjuQhq7eGv5uKMHiAr3P4h51pW5fVb4fQSkQFIlSMtOMJCPVWnRt?=
 =?iso-8859-1?Q?X4vV80xZGUJqx+46DhoAaIiUp/h3du5jprRAZ6qO2lV1BDNI4HURo9+SoV?=
 =?iso-8859-1?Q?Bld16xtsmjCv+FMfpS6BxCramqgwWQgQsYkx0mlInsC5nxrM2vvqxjLr96?=
 =?iso-8859-1?Q?0QZR2N0bxDsyKeyu1AMWzbBguivSg36wXpgHWRtLghoDQlcuUm0H/ejOj5?=
 =?iso-8859-1?Q?Pzl9gP7IWNb4oXtiNSGJUJWJfSxgEZhV0y5s/6gZCpvGVnFcdvoVHGHQU8?=
 =?iso-8859-1?Q?HooN6rW+KE4XhXv1ORU0AUf0upSm6SxoguQhDsdX/OM1I9xpy2V9i3Rubo?=
 =?iso-8859-1?Q?UWM1zOm/GfvvS/Rx583DEZiFYm308BxWgPdeIo4aSC7DHU5+e2sAgpU/SX?=
 =?iso-8859-1?Q?w7jlxJBEVb9CwU6nryoRqMh5LLjn2DHObT/sGJGtk9JerzLLEocSPTs8v1?=
 =?iso-8859-1?Q?nrCe4Yn6ML6yF8amIEQvaO9ibk66LRZg81Jn8tV/JxUWPr9seECPYtnBaW?=
 =?iso-8859-1?Q?qKUDxWGRuQg5DZx7cIoUaxtRVb2QW5nBcLTEpC+sl33Bs0O8ayo7R2G2TM?=
 =?iso-8859-1?Q?VbO40gFQaGczsLDyoiGLwfNPcEYiyWQrrVkVQhxtaCzebxClrnfi54bFTE?=
 =?iso-8859-1?Q?8npmyoECkq1ufetRyftheK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pFLnkunyb4iB1wtAh1mhlBLM9w8p1d0B29FuyTvfGTkEEao+VY5bMs1zZA?=
 =?iso-8859-1?Q?qR67T0d6aAaz01qCNmT4kUGuTVWy2SDzgm3ogjqttRQVvUfzSxnaY3oOxD?=
 =?iso-8859-1?Q?iySQqhvbJTB/SHNhym+XJssHu9JcsAjSfld/SBzNDjqCE5VKFXdBSMR7aD?=
 =?iso-8859-1?Q?iZw+TGdaXgghMeYFDtEfVYZpBWSHFEA9UNyO8EOWxS28jkTkm0Ou4ax4lG?=
 =?iso-8859-1?Q?Z+ZpXIfKepQZvq+6ozJcwn8GF5UrF4J32FVM9/Udf2h+iAM0LKHVna8IV8?=
 =?iso-8859-1?Q?HIij+IMZX/gU4jFNP26AFsKCTD1iCdR3nN/NpsA7YAUSHMlfzPpfJ6pTjL?=
 =?iso-8859-1?Q?jYwkpwe/K3batJtrzSLW7BI8Z/BXRdfeWgK63zP1ma0HdnGcabl2f1mySP?=
 =?iso-8859-1?Q?H9sMFn5e19loMFXnAKr0gZJhiI/NLqSEnSIDAlZG5EmoXPZobGg/Zr7HdQ?=
 =?iso-8859-1?Q?K2GK4NLBLl9xO/SvTuO7qI9k6yza5XZiO9qHqyBWmG2VWLEAqjbBEv36Q/?=
 =?iso-8859-1?Q?YfQjtNxqxx2xeujq563UpKJ1cZMlQ2oY4JunrxKg45Ti23r8lIlD0WgUjo?=
 =?iso-8859-1?Q?blsG6qY45b1ULq8VmpD8bGbbYaZPhd6VzVegYq46aovJd79lmRRSd742hm?=
 =?iso-8859-1?Q?SukYzU+pu8yzYvNs+ZC5hVmWvZ30tDs2CgLM14IyA/SJp6ZEfc8icOUs83?=
 =?iso-8859-1?Q?nJbimTD+X8bVoDXMnadj8VNLFA2uoe0U5Lpy0ZMl2GfhOAoGN+0SeYs2wf?=
 =?iso-8859-1?Q?SpQILgjED+ji9f8H48f0iFvcxDJ/Ur7Qn0suKvP0v0Ofg/XatINSJ9JzU1?=
 =?iso-8859-1?Q?c2dRAq5p/zpjgoVCbBWZ/UrWTOh7pIPCB+QelWLftfFtWKFg0JNZZANWtR?=
 =?iso-8859-1?Q?XUYWyQj2urdGIhyYLCBnAc/NiOHc5qBHb4+1jqfy1zXbWC6bxPXnzWMo7V?=
 =?iso-8859-1?Q?7gV5ip8kItU00zm1SXeV/R48DTqYKoJ1FBxiOXMJYCL2RCaSr7R/WyClep?=
 =?iso-8859-1?Q?MG5hXfXsnR0NhYb0vNQ0KS6X3w+H5b5TTdv2Kl7Hr5Pem5VanXQUAXkPVq?=
 =?iso-8859-1?Q?ylXER2jlRahViARxDDTJ1MtfIX6ns+4AmA8Gxw6QyCmKkRHcGFzZI/Y5mp?=
 =?iso-8859-1?Q?suDkNEhqoNKlohYiTc7Kt3UfBuMV9fRMpKOxEkvnACxH35xiMbYnxIh0nA?=
 =?iso-8859-1?Q?Lsf3nxdIygpWA3jyXbQEqvdFhTCyOgL4HX8R0kl4C+X+Jp3lg538+Ihmkx?=
 =?iso-8859-1?Q?ANLB+6TYR3q5dT8tUle6PTbVSqSp6XfPm+rISbhDUa6dErhsKFHwd5VN7g?=
 =?iso-8859-1?Q?VghEJ55gYwCp9kmS6BswBeQELoNntO58MhoCy247Qejt3eijRrXuAxg5vg?=
 =?iso-8859-1?Q?qn049b7gCeQYFY4f0HJLxez+DNxATSVSj39AKKsggvhRfZvLFNDJzjsWEt?=
 =?iso-8859-1?Q?pCPjIq1RUR9z442K9Qvrvc8xr2+RIUxS1d9PTq4AB5pjjthc5YpwvMxXox?=
 =?iso-8859-1?Q?PBwhnyLPsHCr+eJvoss3vDRKvNaqLP3Iyi0stAoMW9b2bDy0wqcQftMAKy?=
 =?iso-8859-1?Q?iOuumfZn65cZiM4svXyOcCFVA0ZZmuDrStWeP+EoQ4vOs/etZkHIW0T/zW?=
 =?iso-8859-1?Q?B9JacLXeC92MpjOwkZ5GAexXV0mnRsH2WC+gU0/OYdd+fMtksKJztHng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7fa51f-b8d3-4705-de42-08de239c8d6f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:40:43.0268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9ZZviVZZYCNQbBScNhXrJIynDxX1reBIKZzIMf2WvO6kreFGstva4EdAfKA9tpMtoo2rDBhZUEYVlG1Y0H3QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

On Fri, Nov 14, 2025 at 03:37:29PM +0530, Ravi Kishore Koppuravuri wrote:
> User space tool for querying GPU health monitoring RAS events via
> Generic Netlink Socket interface from Kernel's DRM Netlink Subsystem.
> Available Commands are
> 	- List Nodes
> 	- Get Error Counters
> 	- Query Error Counter
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> Cc: Tauro Riana <riana.tauro@intel.com>
> Cc: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
> 
> ---
> V1 -> V2:
> 	- Removed device_id from the input parameters
> 	- Updated help() function
> 	- Incorporated error handling logic
> ---
> ---
>  include/drm-uapi/drm_netlink.h |  79 +++++++
>  meson.build                    |   5 +-
>  tools/drm_ras.c                | 421 +++++++++++++++++++++++++++++++++
>  tools/meson.build              |   5 +
>  4 files changed, 509 insertions(+), 1 deletion(-)
>  create mode 100644 include/drm-uapi/drm_netlink.h
>  create mode 100644 tools/drm_ras.c
> 
> diff --git a/include/drm-uapi/drm_netlink.h b/include/drm-uapi/drm_netlink.h
> new file mode 100644
> index 000000000..af893aa36
> --- /dev/null
> +++ b/include/drm-uapi/drm_netlink.h

This confused me. Please don't change the filename.
It needs to be a straight copy from the kernel name.
in this case drm_ras.h

This is likely what also confused me in the v1 where I thought
your code was based on the old implementation of the netlink.

> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +
> +#ifndef _LINUX_DRM_RAS_H
> +#define _LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_GENL_NAME "drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	/* Unique identifier for the node*/
> +	DRM_RAS_NODE_ATTR_NODE_ID = 1,
> +
> +	/* Device name chosen by the driver at the time of registration */
> +	DRM_RAS_NODE_ATTR_DEVICE_NAME,
> +
> +	/* Node name chosen by the driver at registration to identify RAS node inside the device */
> +	DRM_RAS_NODE_ATTR_NODE_NAME,
> +
> +	/* Type of the node, identifying its function */
> +	DRM_RAS_NODE_ATTR_NODE_TYPE,
> +
> +	__DRM_RAS_NODE_ATTR_MAX,
> +	DRM_RAS_NODE_ATTR_MAX = (__DRM_RAS_NODE_ATTR_MAX - 1)
> +};
> +
> +enum {
> +	/* Node ID targeted by this error counter operation */
> +	DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID = 1,
> +
> +	/* Unique identifier for a specific error counter within an node */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID,
> +
> +	/* Name of the requested error counter */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME,
> +
> +	/* Current value of the requested error counter */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE,
> +
> +	__DRM_RAS_ERROR_COUNTER_ATTR_MAX,
> +	DRM_RAS_ERROR_COUNTER_ATTR_MAX = (__DRM_RAS_ERROR_COUNTER_ATTR_MAX - 1)
> +};
> +
> +enum drm_genl_error_cmds {
> +	/**
> +	 * @DRM_RAS_CMD_LIST_NODES: Command to Retrieve the full list of currently registered
> +	 * DRM RAS nodes.Each node includes its dynamically assigned ID, name, and type.
> +	 * Obtain the Node IDs by calling this command and use it in the subsequent operations
> +	 * on the nodes.
> +	 */
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +
> +	/**
> +	 * @DRM_RAS_CMD_GET_ERROR_COUNTERS: Retrieve the full list of error counters for a given
> +	 * node. The response include id, name, and current value of each counter.
> +	 */
> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +
> +	/**
> +	 * @DRM_RAS_CMD_QUERY_ERROR_COUNTER: Query the information of a specific error counter
> +	 * for a given node. Response contains id, name, and current value of the counter.
> +	 */
> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _LINUX_DRM_RAS_H */
> diff --git a/meson.build b/meson.build
> index db6e09a94..f7807660e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -165,10 +165,13 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
>  libudev = dependency('libudev', required : true)
>  glib = dependency('glib-2.0', required : true)
>  
> +libnl = dependency('libnl-3.0', required: false)
> +libnl_genl = dependency('libnl-genl-3.0', required: false)
> +libnl_cli = dependency('libnl-cli-3.0', required:false)
> +
>  xmlrpc = dependency('xmlrpc', required : false)
>  xmlrpc_util = dependency('xmlrpc_util', required : false)
>  xmlrpc_client = dependency('xmlrpc_client', required : false)
> -
>  xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
>  if not xmlrpc.found() and xmlrpc_cmd.found()
>  	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
> new file mode 100644
> index 000000000..bb7d0dfa0
> --- /dev/null
> +++ b/tools/drm_ras.c
> @@ -0,0 +1,421 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <ctype.h>
> +#include <getopt.h>
> +#include <linux/genetlink.h>
> +#include <netlink/netlink.h>
> +#include <netlink/cache.h>
> +#include <netlink/genl/genl.h>
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/cli/utils.h>
> +#include <netlink/cli/link.h>
> +#include "../include/drm-uapi/drm_netlink.h"
> +#include "igt_device_scan.h"
> +
> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> +
> +struct nl_sock *mcsock;
> +
> +enum opt_val {
> +	OPT_UNKNOWN = '?',
> +	OPT_END = -1,
> +	OPT_NODEID,
> +	OPT_ERRORID,
> +	OPT_HELP,
> +};
> +
> +enum cmd_ids {
> +	INVALID_CMD = -1,
> +	LIST_NODES = 0,
> +	GET_ERROR_COUNTERS,
> +	QUERY_ERROR_COUNTER,
> +
> +	__MAX_CMDS,
> +};
> +
> +static const char * const cmd_names[] = {
> +	"list_nodes",
> +	"get_error_counters",
> +	"query_error_counter",
> +};
> +
> +struct app_context {
> +	enum drm_genl_error_cmds command;
> +	struct nl_sock *sock;
> +	struct nl_cb *cb;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	int error_id_set;
> +	int node_id_set;
> +	int error;
> +	int family_id;
> +};
> +
> +static void help(char **argv)
> +{
> +	int i;
> +
> +	printf("Usage: %s command [<command options>]\n", argv[0]);
> +	printf("commands:\n");
> +
> +	for (i = 0; i < __MAX_CMDS; i++) {
> +		switch (i) {
> +		case LIST_NODES:
> +			printf("%s %s\n",
> +			       argv[0],
> +			       cmd_names[i]);
> +			break;
> +		case GET_ERROR_COUNTERS:
> +			printf("%s %s "
> +				"--node-id=<node-id>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			break;
> +		case QUERY_ERROR_COUNTER:
> +			printf("%s %s "
> +				"--node-id=<node-id> "
> +				"--error-id=<error-id>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			break;
> +		default:
> +			printf("%s is Unknown Command\n",
> +			       (i < __MAX_CMDS && cmd_names[i]) ? cmd_names[i] : "Unknown");
> +		}
> +	}
> +}
> +
> +static int list_nodes_handler(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *nla;
> +	int len, remain;
> +
> +	len = GENL_HDRLEN;
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		/* Validate whether the attribute is with in the range or not*/

I will randomly chose this point here to do an overall complain about all these
comments in the entire patch here.

Way too much redundant comments. A developer can read the code.

Also, most of them are in different formats and with missed spaces on the begin
or at the end.

Please only use comments when the do tell something else that the code itself
is not already telling and use the standard formats all across.

> +		if (nla_type(nla) > DRM_RAS_NODE_ATTR_MAX) {
> +			printf("Unknown Node attribute type: %d\n", nla_type(nla));
> +			return NL_SKIP;
> +		}
> +
> +		switch (nla_type(nla)) {
> +		case DRM_RAS_NODE_ATTR_NODE_ID:
> +			printf("%-18u\t", nla_get_u32(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_DEVICE_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_NODE_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_NODE_TYPE:
> +			printf("%-18u\n", nla_get_u32(nla));
> +			break;
> +		default:
> +			printf("Unknown attribute type: %d\n", nla_type(nla));
> +			break;
> +		}
> +	}
> +	return NL_OK;
> +}
> +
> +static int query_error_counter(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *attrs[256];
> +	int ret;
> +
> +	/* Parse the attributes */
> +	ret = genlmsg_parse(nlh, 0, attrs, 256, NULL);
> +	if (ret < 0) {
> +		fprintf(stderr, "Failed to parse attributes: %s\n", nl_geterror(ret));
> +		return NL_SKIP;
> +	}
> +
> +	if (!attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]) {
> +		nl_cli_fatal(NLE_FAILURE, "DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE attribute is missing");
> +		return NL_SKIP;
> +	}
> +
> +	printf("counter value %u\n", nla_get_u32(attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]));
> +
> +	return NL_OK;
> +}
> +
> +static int get_error_counters(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *nla;
> +	int len, remain;
> +
> +	len = GENL_HDRLEN;
> +
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		/* Validate whether the attribute is with in the range or not*/
> +		if (nla_type(nla) > DRM_RAS_ERROR_COUNTER_ATTR_MAX) {
> +			printf("Unknown error counter attribute type: %d\n", nla_type(nla));
> +			return NL_SKIP;
> +		}
> +
> +		switch (nla_type(nla)) {
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID:
> +			printf("%-18u\t", nla_get_u32(nla));
> +			break;
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE:
> +			printf("%-18u\n", nla_get_u32(nla));
> +			break;
> +		default:
> +			printf("Unknown attribute type: %d\n", nla_type(nla));
> +			break;
> +		}
> +	}
> +	return NL_OK;
> +}
> +
> +static int drm_genl_handle_msg(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct genlmsghdr *gnlh = genlmsg_hdr(nlh);
> +
> +	/* Verify aginst the expected command response */
> +	if (gnlh->cmd != ctx->command) {
> +		fprintf(stderr,
> +			"Unexpected command response: got %d, expected %d\n",
> +			gnlh->cmd,
> +			ctx->command);
> +		return NL_SKIP;
> +	}
> +
> +	/* Route to respective Command handling function */
> +	switch (ctx->command) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		return list_nodes_handler(msg, arg);
> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
> +		return get_error_counters(msg, arg);
> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
> +		return query_error_counter(msg, arg);
> +	default:
> +		fprintf(stderr, "Unknown command: %d\n", ctx->command);
> +		ctx->error = -EOPNOTSUPP;
> +		return NL_SKIP;
> +	}
> +}
> +
> +static void send_cmd(int cmd, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
> +				       cmd, 1);
> +		if (!msg_head)
> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +		printf("%-18s\t%-30s\t%-30s\t%-18s\n",
> +		       "node-id", "device-name", "node-name", "node-type");
> +		break;
> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
> +		if (!ctx->node_id_set) {
> +			fprintf(stderr, "Error: --node-id is required for %s command\n",
> +				cmd_names[ctx->command - 1]);
> +			exit(EXIT_FAILURE);
> +		}
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
> +				       cmd, 1);
> +
> +		if (!msg_head)
> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
> +		printf("%-18s\t%-30s\t%-18s\n",
> +		       "error-id", "error-name", "error-value");
> +		break;
> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
> +		if (!ctx->node_id_set || !ctx->error_id_set) {
> +			fprintf(stderr,
> +				"Error: --node-id and --error-id are required "
> +				"for %s command\n",
> +				cmd_names[ctx->command - 1]);
> +			exit(EXIT_FAILURE);
> +		}
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK,
> +				       cmd, 1);
> +
> +		if (!msg_head)
> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID, ctx->error_id);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
> +
> +	ret = nl_recvmsgs_default(ctx->sock);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
> +
> +	nlmsg_free(msg);
> +}
> +
> +static int get_cmd(char *cmd_name)
> +{
> +	int i;
> +
> +	if (!cmd_name)
> +		return -1;
> +
> +	for (i = 0; i < __DRM_RAS_CMD_MAX; i++) {
> +		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
> +			return i + 1;
> +	}
> +	return -1;
> +}
> +
> +static int check_for_help(int argc, char **argv)
> +{
> +	for (int i = 1; i < argc; i++) {
> +		if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	char *endptr;
> +	enum opt_val val;
> +	int  ret, opt, option_index = 0;
> +	struct app_context ctx = {0};
> +
> +	// Check for help option before command parsing
> +	if (check_for_help(argc, argv)) {
> +		help(argv);
> +		exit(EXIT_SUCCESS);
> +	}
> +
> +	//Parse the input command
> +	ctx.command = get_cmd(argv[1]);
> +	if (ctx.command < 0) {
> +		fprintf(stderr, "invalid command\n");
> +		help(argv);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	static struct option options[] = {
> +		{"error-id", optional_argument, NULL, OPT_ERRORID},
> +		{"node-id",  optional_argument, NULL, OPT_NODEID},
> +		{"help",     no_argument,       NULL, OPT_HELP},
> +		{0, 0, 0, 0}
> +	};
> +
> +	optind = 2;
> +	while ((opt = getopt_long(argc, argv, "h", options, &option_index)) != -1) {
> +		switch (opt) {
> +		case OPT_ERRORID:
> +			if (optarg) {
> +				printf("Error ID: %s\n", optarg);
> +				//Assuming input is in Decimal Representation
> +				ctx.error_id = strtoul(optarg, &endptr, 10);
> +				if (*endptr != '\0') {
> +					fprintf(stderr, "invalid error id %s\n", optarg);
> +					exit(EXIT_FAILURE);
> +				}
> +				ctx.error_id_set = 1;
> +			} else {
> +				printf("Error ID not specified\n");
> +				ctx.error_id_set = 0;
> +			}
> +			break;
> +		case OPT_NODEID:
> +			if (optarg) {
> +				printf("Node ID: %s\n", optarg);

no need to echo back

> +				//Assuming input is in Decimal Representation

besides the comment comment I made above,

we don't assume, we check...

> +				ctx.node_id = strtoul(optarg, &endptr, 10);
> +				if (*endptr != '\0') {

...but we check before the conversion, not after.

> +					fprintf(stderr, "invalid node id %s\n", optarg);
> +					exit(EXIT_FAILURE);
> +				}
> +				ctx.node_id_set = 1;
> +			} else {
> +				printf("Node ID not specified\n");

stderr print and exit?
or if it is not an error flow you don't need to be that verbose...

> +				ctx.node_id_set = 0;

init the node_id to -1 and you can avoid this extra variable.

> +			}
> +			break;
> +		case OPT_HELP:
> +		case 'h':
> +			help(argv);
> +			exit(EXIT_SUCCESS);
> +			break;
> +		case '?':
> +			fprintf(stderr, "Unknown option\n");
> +			exit(EXIT_FAILURE);
> +			break;
> +		default:
> +			fprintf(stderr, "Unexpected option: %c\n", opt);
> +			exit(EXIT_FAILURE);
> +			break;
> +		}
> +	}
> +
> +	/* Create a Netlink Socket object*/
> +	ctx.sock = nl_cli_alloc_socket();
> +	if (!ctx.sock)
> +		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");

why do we use cli_fatal? and when using it, why don't we exit?

> +
> +	/* Connect the allocated socket to NETLINK_GENERIC protocol*/
> +	ret = nl_cli_connect(ctx.sock, NETLINK_GENERIC);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Cannot connect handle");
> +
> +	/**
> +	 * Resolves the Generic Netlink family name to the corresponding
> +	 * numeric family identifier. This function queries the kernel directly
> +	 */
> +	ctx.family_id = genl_ctrl_resolve(ctx.sock, DRM_RAS_GENL_NAME);
> +	if (ctx.family_id < 0)
> +		nl_cli_fatal(NLE_INVAL, "Resolving of \"%s\" failed", DRM_RAS_GENL_NAME);
> +
> +	/* Modify the callback handler associated with the socket */
> +	ret = nl_socket_modify_cb(ctx.sock, NL_CB_VALID, NL_CB_CUSTOM, drm_genl_handle_msg, &ctx);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to modify valid message callback");
> +
> +	send_cmd(ctx.command, &ctx);
> +
> +	nl_close(ctx.sock);
> +	nl_socket_free(ctx.sock);
> +
> +	return 0;
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..74ff97713 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -70,6 +70,11 @@ if libudev.found()
>  		   install : true)
>  endif
>  
> +executable('drm_ras', 'drm_ras.c',
> +			dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
> +			install_rpath : bindir_rpathdir,
> +			install : true)
> +
>  executable('gputop', 'gputop.c',
>             install : true,
>             install_rpath : bindir_rpathdir,
> -- 
> 2.34.1
> 
