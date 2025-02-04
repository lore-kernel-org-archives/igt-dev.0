Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B6DC0218F
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 09:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E1210E299;
	Tue,  4 Feb 2025 09:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoEEJNMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C8810E299
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738659716; x=1770195716;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZB9Y1zc9SVcoPP/56egFknzZJm2Kj+GjhZ5CEd+oU2k=;
 b=LoEEJNMfTB6/5BciTO4/h1FGu41QX1QgF77bNGUBAT5k7zDwc2+50jYl
 dQOyPy4IqQe87LmJuWe9z7fp8kaciDCUX+c0Ls21qZzT6OF+lmJnTouZr
 BsGjmSE5+KDGZrggUcbI8tgLcelQzQ0E40JVwH/0SgDjWS+z2W5WkCWBX
 XLaDRHjR+ACDpYwZvEwmw3m8PSNYMnKcbqrsNLXBzIN7nMyPA6CcqOWL8
 gQS5V0u585zIINZyGvX32uSytdivLxM3n585eq2Cwd+/3pf4xbfS8AUSm
 rtVyZ6Zt6LlWF+MCKxDu0g5nnkmuQ0YxNVmTEzVRpGM1khmrQNi3Y+4mh A==;
X-CSE-ConnectionGUID: uBXb3YHzR3Wazn90CS+pYQ==
X-CSE-MsgGUID: QPvP9ZrHQTCNdPRJh1Z3iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49826560"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="49826560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 01:01:56 -0800
X-CSE-ConnectionGUID: mt/3uUarSm2NoXrmaDm8MA==
X-CSE-MsgGUID: O7lHf4bcQPa426gkngx/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114582329"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 01:01:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 01:01:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 01:01:55 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 01:01:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZpfbhzoHnZd8r4CM5fyclb17XctMJfwjlc7c7nyf+1PMhPdtBLDLn3+1SkSK7CR45IgUTPzVyl/aTofrCaVo/0Uw6zS1Ps6lsu00jW3HsWQ+MMWpGTF5tnr28VYzafWxx854RqGTWlnDVAt93WFfOikPAbJSZ/aO00LqeQX5crLXngaEWsYYpMC2jmGkFhjZZFqmbM/3/46/En9O0uZvOh7YxWYuiPG6CAp68i10WndHs4alzZkGfB2XK+F3v3c/ne1LB1swgyUcZjebDnn+zut1Fsoc4ShM2NW2M3v0V99xRp+ApmScNMrSlwHNVg1vUVQOP2B3EYtStV7r0uGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ldJpULPGEFFf6mv6GmHMYTiJtrU6oAf+JfwIV6r+bI=;
 b=H1wsTCcN6/dG3ZJfodUWwzwB+n4LMuA0nMGhhIaP+nZiLAPKAncr/VwKQoT2xMUxZNfuAFiX5OEeNeiaO6Ooa1i5nkQS3kTIV72SPLyUuGMz5YKtb+zxBcIuDTfxc/s6TvkjYZOcSHH9SlqCJMxbps01xmokn09L0zKfpzyNgdc3an2JFEA96aBFUyZ7xwkZAMDa5f4cY/tgCgXAav8LWUVPHNkWnJPUPMvEyJxy3p+V3hsNfSMYdPDhAt83d7WuXmL+JadcmJYAFj44jmUS4LxbokMPnEZybVZVXaN0/uuWIE8ldiFp41prONXL2T5r4skBQFIbzRrA0QeemCjtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 09:01:38 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 09:01:37 +0000
Date: Tue, 4 Feb 2025 10:01:33 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] lib/intel_compute: Use LR mode for compute
 when using Xe
Message-ID: <Z6HXbdMnxAK2aEAE@fdugast-desk>
References: <20250203133916.843931-1-francois.dugast@intel.com>
 <20250203133916.843931-4-francois.dugast@intel.com>
 <20250204064917.kixaxem3kijmn2kp@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204064917.kixaxem3kijmn2kp@zkempczy-mobl2>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bdfe9c-37b3-4162-c3e7-08dd44fa8865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtUeEFoTjZnNkV0YnZLYi9WdEo4NHpjVTM5RjJaVU5JMVdPWlJuVjNJYzBk?=
 =?utf-8?B?b2NUV2xad3BTVEhkWUJlcmhaWGZ4VXZWVVBrUEc4akM0OUVZUEJhMGxhUENW?=
 =?utf-8?B?NENhZHplYW5EOHhmK0VLTVFrVnRweGc2eTE5Q3pZQWxWOStVRHNiaVUxb0V4?=
 =?utf-8?B?Rk96NzIrY0lFekk0dHVNSytYTElaQzltdXN5d3FTSmRZN21ibk1NL2g2ZVNB?=
 =?utf-8?B?QW5OaGJQZHJpNHk3V2ROcHRnWTVEWWpKSGhZSUNJb3NXWDc4OGllcGJVNUJE?=
 =?utf-8?B?R2QxWENYamNJU1RvaTNPMDRQR2Zjb0JYMzUwazF4WTNza0wzUnJ6SlZDazZQ?=
 =?utf-8?B?enNLVjdUZXQ3RE9EYXY4UFlSMG56Wm5CeWJGcU1KZUZQR1IxYzd5WkdSSk5j?=
 =?utf-8?B?U0J2cFhnMGtKRVdETW80L0hybXdDeVFaNndlL2o4cHdSU1Jucm5GZzJubHlL?=
 =?utf-8?B?ZnZkUVZTa1VCdWZPN2Z2TTNRRGM5cDg3Q1gvT2hJUmVZQ1Zzd2d2bzFUbEJI?=
 =?utf-8?B?TmZJbDlKd1ptczh4SkNmN2FQNC9rU1RXS2QvUWF1WXJUOWV0ZjRmK2pkdmUy?=
 =?utf-8?B?TVA0dTNteGoyajA2MldSWFFpYzZKUzNxSVhBN0V6Q0lWeGkwWks4QUsrWnpF?=
 =?utf-8?B?OGpmMXR6RENLdDB3M01ocDV0L2g0bVVvOE9JQ3R2bUg3eTRIRUpFUm53L0R1?=
 =?utf-8?B?bkh4Y1d3bFRraytSUUNTVlg0a0ticjNVSGJ1SHRDZ1VlcHdvVkJUanR6REZ0?=
 =?utf-8?B?b0U1UkJBc1VoT09kQUtVZUh4RVROZjc5SWdjMGRuUDMvSGpVWVh6SDI0eVBm?=
 =?utf-8?B?WGk4a21SQkhUSWdWQWdFVVZxQWl0UEprc1hWdUJiVzQzbVhXZjd4R0MyaW1a?=
 =?utf-8?B?VUVlZUcxRmhlNHVQQ3RjcVdES0FyT1dYL28rVUNIUjZuRk5uTXZhdnJraWx1?=
 =?utf-8?B?RzBhdExTWWZ0d1ViVUdHTW8vUDV0Vld4dFBiTHV2RmFvcW5jM3A2ZGUxeEYz?=
 =?utf-8?B?UkQ2c2E2eFl1YzN3R3dGZW0zdmQwZk1GTFluc1NLbGVXVFBUbnZwN25HVW1F?=
 =?utf-8?B?QnBjUkt0T0dDWDRaSjNYZjN4OW8vY2lvN05vYjhmclNHeEoxVUttTm5ZSXVI?=
 =?utf-8?B?UW1nNU5XR1NmSSsrUWtJZGJqclNRZTJaU2ZWcS9mUWdZdHBEOElJRDlsejlS?=
 =?utf-8?B?NDNGVEREeFpSNzdRdUJEbS9vWENxVGFJNHEvVlRxSXRpaFFYaGRRajZxQS9N?=
 =?utf-8?B?ek9UYXJNYUU1Q3I3ZVRVei80blhhdS9Od2Yxb2FjTGh3enN5Z1RFaTVmTlJq?=
 =?utf-8?B?QWgwMFNLUnZyNE5TaU1kVXRncjd0VGFRWlJnUTcxbXdxNmZscmxkUDA1V0R3?=
 =?utf-8?B?OW9pbzhpL1YyY3NIK2daeFJNZlZuWmRCTTV3QVRKM0pNUm13Ri8yUFl3eWpY?=
 =?utf-8?B?U1NOWFFJNDZ5aDd5YnZvdGNRSzcyY1VnZDdXOXY1MWdLbmxmd3JuTkRMRTND?=
 =?utf-8?B?dXRTWTVKamZtOHpHc2o4NGMzMElKOVVHN1dlMmdqMjR6Q2FYQW1zVUVBRzZv?=
 =?utf-8?B?Ujl5WkcreVpIRDRiWFp0RjdDc0pBeTl6RTZVcWhFY29oSUVmdCtvam51bU5R?=
 =?utf-8?B?VjIxT0ZaVGltRFRvQlRNUTA4TTFYWU42RURYbHdRK0lnZTYybzZ6c1hCSVpJ?=
 =?utf-8?B?RTV2UU80L1RHdlozMUMyTVNDdmQ1aG03WFBiLzhwVytoV3M0R3YrYzVadzRF?=
 =?utf-8?B?d3crMEYzVllRUXRqQzBzNFJmSkFxeHNPbXBqVWorUkRmUmZaTlFoWHpMem5l?=
 =?utf-8?B?dlNaT3JxcW5iUlNVSHBJVG9XYy83TWZaNmtEZHdKU0h4bTRqSFBkZ29NV3J5?=
 =?utf-8?Q?koJLI1w76tf/3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHArQVBrbDhFc3g1VXBqU1lkVFRMZFFSTmRHNE9pVlEzSjBCTFFuakFzbERm?=
 =?utf-8?B?UG9WSlpPS09QaDlKYVREZm1OYmViclo4TzNtdFdEc0IrTmZzemUzbmZHT1My?=
 =?utf-8?B?amRnRWpJLy9xMmNiS0d3M2MrRW5YZlNkTWI5d21vdzZXdTVrU3RQbllCeGNn?=
 =?utf-8?B?Ulp6a3NrZ09TRVUvdWJHYmtCY1E4SXJjNDBBWHAxUXRhY2pCQ0tER2hDbGpX?=
 =?utf-8?B?b3V2Y2JnMXg1QzJ1RE81ZWNROHpjK0tJM0dJR3JHR0lrWXllR3dvR0tCaTg5?=
 =?utf-8?B?aVRXdTkrRXdUUGJjcmxwWmxNRlhNWS9hcWlsU2RZUmtRTmYwaTA1TDhnVjNV?=
 =?utf-8?B?QUUzalJTUUY1SGF5TnU0SUE4WGZvbHhrZUdndUtxZS9qbUpGTkFuc0NuSEkw?=
 =?utf-8?B?R29FelBNaWU3QUsyM1VpT3d4L2ZMUkk1RlhCYWplOVpjWFh5M0xCWkYxam5M?=
 =?utf-8?B?RE9aQVFUZDFxd2JyOVBWY2s3VVZYRmZrQUgreGFTOWlxbWFLaTVPZ3JYNW5Y?=
 =?utf-8?B?M0JvdWdOVGZ0YzZld0JpcC96MS9tMW91VGxPZWhQMnFmKy80Mk5nQzNTYmYx?=
 =?utf-8?B?R0psMEJGb1FkbGhWSGJmbE9vdFhSZThKdlo4OGVvVTRFZ05zaWV6dElyN05y?=
 =?utf-8?B?cVpmWDJBaEgyQjlndTZlcHdVc0YvNnBUUlFsYk5iZWpJUmN1N2NCSTlsL3dX?=
 =?utf-8?B?ZTBTMFVQUHlKb2R1Mk5jcHpRNkhtRzFjK3JxVXJlZysxNEc0YytBRER2a3Fr?=
 =?utf-8?B?alN6NDlzYjNEUDlqOWN5aWZ4TWM0RHd1bGhNNTdZYlJQVWliUXNUVzVrQXpC?=
 =?utf-8?B?eWkzTXJwQ3RmeWhTRkF0VUhQNWdHem1SKzNXUU5xd1Y2RlRKWlJxR216cnll?=
 =?utf-8?B?QWpNT1AzOCtHbUt3cStzaSt3WGp5RHNVOUxQc2xxam5WODQzeUZLU2RQa1ZK?=
 =?utf-8?B?SW1lUVpRbkxxZyt6SFZjSjlaL2Vaa1lXOVdBbThJWUhoZVJqMHpBVFhpaVNa?=
 =?utf-8?B?a2E2REYvc05SSjR6NFFUOTEzaFRod29ZQng1ME0yRmRBWFk1a3htaTZOamdW?=
 =?utf-8?B?cGk2NjV6Y2NzM0JUWFdabzJZT3ZUYlBoTGNUY05rZGxHY0JISGNtWDRPVHox?=
 =?utf-8?B?NjhZZ2tIMUtmMGxCTEtNOHJzcTgzOEVham9MTnNXQkRsMUdXNTE5a0xPL3Vm?=
 =?utf-8?B?R2cyQUEvZ2xTWnRvQnFvQndBakJMUEM1VWZ4TDFGTDFoUVkzMWxuclFWcmZy?=
 =?utf-8?B?NzJpVytOa1pRNEdqOE1SdTRFNW1ycHJXOEllUk13QmM5d0w0aXUyMXpvQ05N?=
 =?utf-8?B?SVRoUysxdjhFVFNqMUdJTC82U09CV016U1oweE5yUkRHdDRDWXBRODF1enhh?=
 =?utf-8?B?Nk1iazJ0NUZmbDZESlVIZldJVVBKQUR4TlhFS0V6dHhMYlFrQ3o1ZGVJWTQw?=
 =?utf-8?B?aHBiK3JUdFZPOFAxT1V5UjRPWFV6NHd4aTkvRHVwU1NVQ1psN2JlYWtzNnls?=
 =?utf-8?B?a0V0QisrTXI3NXY1bGNRdk92eWZsQlR5RVhsbTk2dURCY2I2enphNmluSjR3?=
 =?utf-8?B?UkpGL04vTW5XQ1k4VDBOcDNSS3RsSnAxL3RESGJvMXdDS1pMUk9VN2M3VUh1?=
 =?utf-8?B?NEdoMXZzS1I2eG5rQS9zS1M4Sll3R0R3bUFQeStQaEdPTHpzRlNCVy92TWpp?=
 =?utf-8?B?RllzS080cUt3V1hBYzRnQUxrVk1VZXNyeEFNSUZOL2ZxRytzaFU0OUVRVE9Z?=
 =?utf-8?B?RDM4RkpvQ3ZkMTVUYStOenJlZlEwNnBxQ0lxSFlLS0lsWGdBRzVxd2hHaWRs?=
 =?utf-8?B?ay91Mk9mVFJFTXFoQWNMTUlodVJwY0NidFFUbUQvaXFDYTA2RUxlOENGYXVx?=
 =?utf-8?B?TEZFL1NRY05LZmRVZmVZcTYyaTFKR2NPSWRyV1JCWWdvY2RpZUprWVZLdWZs?=
 =?utf-8?B?V1VWNlR4b0VMMTBsbHA1V1NuMm0zNzhQeUc0Y2RudlZoZ1BST3h3TXhwZHNv?=
 =?utf-8?B?LzNNV092Qm0vanVzSW15M1JET0FSUkpzd21rZEZxSzNZeDNRT01XZjBzYUFs?=
 =?utf-8?B?V3ZoNVRiSGZabmJLRnFrOWt0WDFFdFpYeVV4V3U5Qk5VNllwTkNBNUNtK0ZR?=
 =?utf-8?B?N3BWQmpqVE1TVEFzRlRCb2tsVmhDa2t1dHljVTg1MFVicEUwTkpkOUtOR29S?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bdfe9c-37b3-4162-c3e7-08dd44fa8865
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 09:01:37.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t7KUz7K7dvew4DQZe0mZf0sgeFEonA+GfyhvznjCBRhC2DYW5hDcvF5gnQyLZt17eyTiJlhjy199O5jF/mfKvNE+5Lax3ZzWX6TxQxxmPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
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

On Tue, Feb 04, 2025 at 07:49:17AM +0100, Zbigniew Kempczyński wrote:
> On Mon, Feb 03, 2025 at 02:38:48PM +0100, Francois Dugast wrote:
> > When Xe is used, create the VM in LR mode as this is what the
> > compute UMD does to run compute kernels. This makes those tests
> > more representative of real world scenarios. A side effect is
> > that user fences must be used.
> > 
> > v2: Minimize changes, stick to xe_vm_bind_userptr_async()
> > 
> > v3: Also use user fences in preempt exec
> > 
> > v4: Do not rely on user pointers due to atomics use in sip,
> >     rebase after 64K alignment, fix waiting times and order
> >     in preempt exec (Zbigniew)
> > 
> > CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c | 164 +++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 133 insertions(+), 31 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 0e1179b62..6f6b4006d 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -27,6 +27,8 @@
> >  #define SIZE_BATCH			0x10000
> >  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> >  #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> > +#define ADDR_SYNC			0x010000ULL
> > +#define ADDR_SYNC2			0x020000ULL
> >  #define ADDR_BATCH			0x100000ULL
> >  #define ADDR_INPUT			0x200000ULL
> >  #define ADDR_OUTPUT			0x300000ULL
> > @@ -43,6 +45,8 @@
> >  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
> >  #define OFFSET_STATE_SIP			0xFFFF0000
> >  
> > +#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> > +
> >  /*
> >   * TGP  - ThreadGroup Preemption
> >   * WMTP - Walker Mid Thread Preemption
> > @@ -58,6 +62,10 @@ struct bo_dict_entry {
> >  	uint32_t handle;
> >  };
> >  
> > +struct bo_sync {
> > +	uint64_t sync;
> > +};
> > +
> >  struct bo_execenv {
> >  	int fd;
> >  	enum intel_driver driver;
> > @@ -81,7 +89,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
> >  	execenv->driver = get_intel_driver(fd);
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		execenv->vm = xe_vm_create(fd, 0, 0);
> > +		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> >  
> >  		if (eci) {
> >  			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
> > @@ -107,8 +115,8 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
> >  	igt_assert(execenv);
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		xe_vm_destroy(execenv->fd, execenv->vm);
> >  		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
> > +		xe_vm_destroy(execenv->fd, execenv->vm);
> >  	}
> >  }
> >  
> > @@ -119,18 +127,32 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> >  		uint32_t vm = execenv->vm;
> > -		uint64_t alignment = xe_get_default_alignment(fd);
> > -		struct drm_xe_sync sync = { 0 };
> > -
> > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > -		sync.handle = syncobj_create(fd, 0);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> >  
> >  		for (int i = 0; i < entries; i++) {
> > -			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
> > -			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
> > -						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> > +			bo_sync->sync = 0;
> > +			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
> > +							 vram_if_possible(fd, 0),
> > +							 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
> > +			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
> > +					 bo_dict[i].size, &sync, 1);
> > +			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
> > +				       INT64_MAX);
> 
> This binding/unbinding pattern occurs couple of time in the code,
> maybe it is worth to add some helpers to avoid code duplication.

More lib/compute improvements are pending, I will look into this.

> 
> Code looks good to me, if there will be no regression on CI:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

CI looks good. Thanks for the review.

Francois

> 
> --
> Zbigniew
> 
> >  			memset(bo_dict[i].data, 0, bo_dict[i].size);
> >  
> >  			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
> > @@ -139,7 +161,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
> >  				  (long long)bo_dict[i].size);
> >  		}
> >  
> > -		syncobj_destroy(fd, sync.handle);
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> >  		struct drm_i915_gem_exec_object2 *obj;
> > @@ -177,19 +200,33 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> >  		uint32_t vm = execenv->vm;
> > -		struct drm_xe_sync sync = { 0 };
> > -
> > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > -		sync.handle = syncobj_create(fd, 0);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> >  
> >  		for (int i = 0; i < entries; i++) {
> > +			bo_sync->sync = 0;
> >  			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> > -			free(bo_dict[i].data);
> > +			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
> > +				       INT64_MAX);
> > +			munmap(bo_dict[i].data, bo_dict[i].size);
> > +			gem_close(fd, bo_dict[i].handle);
> >  		}
> >  
> > -		syncobj_destroy(fd, sync.handle);
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		for (int i = 0; i < entries; i++) {
> >  			gem_close(fd, bo_dict[i].handle);
> > @@ -204,7 +241,32 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
> >  	int fd = execenv->fd;
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		xe_exec_wait(fd, execenv->exec_queue, start_addr);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > +		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC, bo_size, &sync, 1);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
> > +
> > +		sync.addr = ADDR_SYNC;
> > +		bo_sync->sync = 0;
> > +
> > +		xe_exec_sync(fd, exec_queue, start_addr, &sync, 1);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
> > +
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> >  		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
> > @@ -1803,15 +1865,22 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  	float *dinput;
> >  	unsigned int long_kernel_loop_count;
> >  	struct drm_xe_sync sync_long = {
> > -		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> >  		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > -		.handle = syncobj_create(fd, 0),
> > +		.timeline_value = USER_FENCE_VALUE,
> >  	};
> > +	struct bo_sync *bo_sync_long;
> > +	size_t bo_size_long = sizeof(*bo_sync_long);
> > +	uint32_t bo_long = 0;
> >  	struct drm_xe_sync sync_short = {
> > -		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> >  		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > -		.handle = syncobj_create(fd, 0),
> > +		.timeline_value = USER_FENCE_VALUE,
> >  	};
> > +	struct bo_sync *bo_sync_short;
> > +	size_t bo_size_short = sizeof(*bo_sync_short);
> > +	uint32_t bo_short = 0;
> > +	int64_t timeout_short = 1;
> >  
> >  	if (threadgroup_preemption)
> >  		long_kernel_loop_count = TGP_long_kernel_loop_count;
> > @@ -1824,6 +1893,32 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  	bo_execenv_create(fd, &execenv_short, eci);
> >  	bo_execenv_create(fd, &execenv_long, eci);
> >  
> > +	/* Prepare sync object for long */
> > +	bo_size_long = xe_bb_size(fd, bo_size_long);
> > +	bo_long = xe_bo_create(fd, execenv_long.vm, bo_size_long, vram_if_possible(fd, 0),
> > +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	bo_sync_long = xe_bo_map(fd, bo_long, bo_size_long);
> > +	sync_long.addr = to_user_pointer(&bo_sync_long->sync);
> > +	xe_vm_bind_async(fd, execenv_long.vm, 0, bo_long, 0, ADDR_SYNC, bo_size_long,
> > +			 &sync_long, 1);
> > +	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
> > +		       INT64_MAX);
> > +	bo_sync_long->sync = 0;
> > +	sync_long.addr = ADDR_SYNC;
> > +
> > +	/* Prepare sync object for short */
> > +	bo_size_short = xe_bb_size(fd, bo_size_short);
> > +	bo_short = xe_bo_create(fd, execenv_short.vm, bo_size_short, vram_if_possible(fd, 0),
> > +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	bo_sync_short = xe_bo_map(fd, bo_short, bo_size_short);
> > +	sync_short.addr = to_user_pointer(&bo_sync_short->sync);
> > +	xe_vm_bind_async(fd, execenv_short.vm, 0, bo_short, 0, ADDR_SYNC2, bo_size_short,
> > +			 &sync_short, 1);
> > +	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
> > +		       INT64_MAX);
> > +	bo_sync_short->sync = 0;
> > +	sync_short.addr = ADDR_SYNC2;
> > +
> >  	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
> >  	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
> >  
> > @@ -1872,14 +1967,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
> >  
> >  	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
> > -
> >  	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
> >  
> > -	igt_assert(syncobj_wait(fd, &sync_short.handle, 1, INT64_MAX, 0, NULL));
> > -	syncobj_destroy(fd, sync_short.handle);
> > +	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
> > +		       INT64_MAX);
> > +	/* Check that the long kernel has not completed yet */
> > +	igt_assert_neq(0, __xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE,
> > +					   execenv_long.exec_queue, &timeout_short));
> > +	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
> > +		       INT64_MAX);
> > +
> > +	munmap(bo_sync_long, bo_size_long);
> > +	gem_close(fd, bo_long);
> >  
> > -	igt_assert(syncobj_wait(fd, &sync_long.handle, 1, INT64_MAX, 0, NULL));
> > -	syncobj_destroy(fd, sync_long.handle);
> > +	munmap(bo_sync_short, bo_size_short);
> > +	gem_close(fd, bo_short);
> >  
> >  	for (int i = 0; i < SIZE_DATA; i++) {
> >  		float f1, f2;
> > -- 
> > 2.43.0
> > 
