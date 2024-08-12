Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03BBC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 13:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C03610E221;
	Mon, 12 Aug 2024 13:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNuB5/dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A02510E221
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723470936; x=1755006936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lT80pd8pa+hedIp0tM3DDqagsX4ZfT9shtojiaJoXfg=;
 b=RNuB5/dnPSMPoZSNlqVAt3ijp+2dkXBe7Ip+1D5p/XNViilbMRnlh0hX
 ZEOdEbqmMZ1p+/fvotznrEr0oIP8pX4vColz13irgyvWGJHF1zPO4gdPL
 xee0ZGLCntCC4xVpQUT+bw7zk5fMobzinmFV/KXb6g/NBjms4QUJrg+gD
 TPHrbvZV15oCDxhOnNg8wqGaRWyWZtXfQyvqe4PtKaoazD4uVcbqS/f7s
 Vjn4E8r5dvpfZEkKb1EkPpG1UYQPtPn2L3Sy7ixc5kOvxBAqpwgXC1gEX
 s6cV9dH4q6stYjwWQCr8rs0FgfhfHyqdmJKD5JeiEKXNm0wNt3J7cQxTa g==;
X-CSE-ConnectionGUID: mWt4jQ6bSiuix0Td6PRC0g==
X-CSE-MsgGUID: OTqGd09pReypiBVR2A3oxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21743683"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21743683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:55:35 -0700
X-CSE-ConnectionGUID: zJPDIsKWQ7Wjsi9qcgEMOw==
X-CSE-MsgGUID: l1QcorfKS+iYby+nwBJd2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="88910973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 06:55:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:55:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 06:55:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 06:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LslaW+R5OwvIAIaWC6lv9gXFOU/YRkbk5j6Ms9mEdh5v6gHPRa2lg+MGmrPZ9aBplcirYjd8791AR6/gspE0nXVYtGBauLML9TM1dTtGFPDILCB6V7SiKjNFfrgoStwJBW+oTdFEAApL+JrYnwhYYHf0XAjgCNNMt/QJ1YBP8Y41PIkapgdqkmpJN/XTKWRG/hAXs0oj/bkgKShWCdOdOR2C05XI1BW54QhHMn0LyFGA/v7PEDwtubqV7ggMWXZEtSv0i2o/6LRWzslF5TGHEnSkdXy33Y9R9Nc+UrOOB6Pvyw1nv+IeuK61nievFZ7+sq1VDx91x6+27yEx2fdswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT80pd8pa+hedIp0tM3DDqagsX4ZfT9shtojiaJoXfg=;
 b=UeF2J8uOCpOb8h4Kr30dzRDqWzKrwTG+M2aoUgpd7bhEzzZPA9gMjAYi8nsDSHlejFuDGv8gZef3+1sJmL6p3uMf5DFCthwhh7XXNj0A5RVVH5rWH+K7xrGQRgoFUXXywuVhjHjawgig6ZyPYM5gYUo5K4OikSJmJZ9hCB60lLh2mRuRT/52zCfgS2NEj/0H7Vjdg0et48zq45g7Zj9M4yG+gE7V6TQHFgIkBa2vvg2qJITca/QTuil7IUycIlGdmBaTogU1ymOXqhVoEH/zXr3nFajWHjlGlBCfhLZ0IbE7Pnq7xZWfgYRTNhCHcpT+BvE7yBtWS0UyGIhxlAYLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7987.namprd11.prod.outlook.com (2603:10b6:510:242::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 12 Aug
 2024 13:55:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 13:55:31 +0000
Date: Mon, 12 Aug 2024 08:55:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 3/6] runner: Add option --hook
Message-ID: <4jmyiohkc6uzv4dxqkrj5suug4aagi3xzg5ox4pblqwnjc7wia@vqqd4ajgbtf7>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
 <20240725142028.51735-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725142028.51735-4-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR04CA0132.namprd04.prod.outlook.com
 (2603:10b6:303:84::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: af302787-755e-442c-a603-08dcbad66e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j9tu75NA5nkxecuEXukEnUcfKrQGr8+5sGxyHxzyMECq5y+Jd+j9ZZxFQgbv?=
 =?us-ascii?Q?hHjylnJmWOp4AbP34QCNhcmmmpl+dki/0AJ/CGwXwVBxHITrSH/2AJuyNWJk?=
 =?us-ascii?Q?jvlSXavk8oHEzEXHOiszQQn/b1k1Ym6B7mwJ0cpZJ0TepXYWiybyhSaCXD0Q?=
 =?us-ascii?Q?udfcPMliWhu9uKEUYyA6p05aoPt+ccvBI0z0EyVR0inm3WaWDdmyjyBv4gRJ?=
 =?us-ascii?Q?LQl3oMTi2uo01FvxXO8AkfgmSQJPQ4/Wfqhq7TPuWOh8M4PR2yBEPnCN8G+I?=
 =?us-ascii?Q?LTb8n/4q4NoTsQ/+UsMKl7TXAgqoA0V3wH+ud3h1VheNl4MRUySyLKXSlqTm?=
 =?us-ascii?Q?fEc9+3k7gyyfmtHQ+LiAOEfUff/pxkcrHBlOxx+WwZbgRiklUD3py4lmsEyV?=
 =?us-ascii?Q?GhHzkNWWc0Zi/dp5cf3PTtYPUY64gYR86VT7jw1V7ZTpXsbSHEFmRWDNP87Q?=
 =?us-ascii?Q?whcjcK9smP15XRawd7bYtWTHsGlcUiYasRbqeALpx1xgm9KwJkCvqQ2uW/aX?=
 =?us-ascii?Q?uDKfANCjfaM6giF1t/BU/LKcQdfvrKyxSi9x5k8fECESJ+nXmSfjuvoo8e/b?=
 =?us-ascii?Q?qcM6bKwgOdy504NW7mv2Q9ksiHRhx/V7llsdQ63tbF2BnyilTc78VmqKBYP4?=
 =?us-ascii?Q?WjtcdgSAPnd6keHXHh5Gf469nKtrn0296zxYS9nTOH1NMj9vpJB6Nvncd03E?=
 =?us-ascii?Q?VsHlCBahmY0woPivR8e9xWU4JEE4vs8RT63/WfH8/GIc0mdjJCUiBDMWQT75?=
 =?us-ascii?Q?44hnqtKLCxZAWkBLXCHBPfWrcqk/9YuB6epYapFdPVNPp64Rgig9yzdlzGCI?=
 =?us-ascii?Q?Lzy5YYPFwzr/K/qUjJQfDTmXx3ItuxfgQFrlH4dyUi8c6vt0OHCZNhJygab2?=
 =?us-ascii?Q?WZjnxDVHXuMSOkAz0pJf3BvBhoGr7ira6ETR/Yp33SwiKRTb7Zoye8nYnva8?=
 =?us-ascii?Q?3q0AxGFgVshrkNujO9/4msCER9QcQ9zAW9JGK5HdM2AGHp1OszKDR7gjKub4?=
 =?us-ascii?Q?/fl8hGHQ5g7bL/DBvwrH3q2/GzteRX3kbl1NT7cIUpavuK47rznKIax9/cRQ?=
 =?us-ascii?Q?p36wU+CcxTSJv73wW61S/NSCnCFv0Pl7n7XlqV/0Y9Y1iydW+5C4DsY//RUx?=
 =?us-ascii?Q?yuEGtpGJtOKDZTMmtqOoW+3M1OC4UVt3Gc2ih2GKY4CJk9KafqGn0/m2NdQb?=
 =?us-ascii?Q?4nSysQEcloJG0tVHH8wPMcR+fOS5AD9DJwysYHm57X9E4swWvXCh/SbUlD7s?=
 =?us-ascii?Q?h/myk79qQS1oUBDY4zp1LOpeKYIIwpaoHC3YKzdCeicOWzw37N+LVMdP6OEn?=
 =?us-ascii?Q?yiDLp9c+Sy8Ax5HQ5ZFId+KE1Pjfpjbhhw7h0huNtol3NA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Vuq5nvjYNyJUhkb4/LxqN4vXIGGPUaJJu+Su+3665qsOPXhTGAlOW7HNfpI?=
 =?us-ascii?Q?JNYy73yJzSZ1qVLuvZcXiakBD+4tvSoH5MnUJnJ43ztB/YkD2AwNzlVhPTFI?=
 =?us-ascii?Q?4WURfWUwdz8HdkN8xCIu+MnNFPUHDQkbmQRzWgo9BWzqvtYzq5heb8u8Pzbz?=
 =?us-ascii?Q?9VhUhsxYE/52EJeu/23CHr7ndJBhXuhw7h75dVnm4GuspEGgSK6TE0RPYBMZ?=
 =?us-ascii?Q?G5Cs/luHfOJGZ6ni8RMzcjPy2fQ5ZDioPgoFqv41u487wIZIUgeQ8JkrFb4W?=
 =?us-ascii?Q?9SKp5GXp3N/lzh3rIOqmCAb8xdmV5BFOEb8aPyYL2n+RB15ZH/vOo5IzkU1K?=
 =?us-ascii?Q?YSWsQt08Q1Z6WdY7MllVHNaU73VyjmtMy8nX6QMitInIVJ5QkR83+Jt6JbSK?=
 =?us-ascii?Q?qu6NeMLG3psUbqWXy1GRAfm8md5iM/swl2x+xb+3QMXi+t6W48enPnaHj7ZK?=
 =?us-ascii?Q?KlN6WD5d8KdtPQn8DjgOnbSDwtywj8SuFKXAFma1q2SctKD7n9irx8Wz0QL+?=
 =?us-ascii?Q?xweYl/ra0h2hUSaHyJy81GPawZDBxTihQd2s5VCGKi0JSaWuAoYj7m7exGIt?=
 =?us-ascii?Q?UfrQA/rUFYLKXFoRN5jERuOARc2OkJxSQGijowwW5V2ZxnKVL5Z7xR4z2H51?=
 =?us-ascii?Q?Uv9sVd+Kf5DpTRBhQ+q5jY+xIouvqKiDocYuO2wVsavge6XTgbH68GGWb/wV?=
 =?us-ascii?Q?lAxeJIj+lFTvp1KtEieqAjZIAEe7tAM/I4ByIpmXg2ZZU5gFHrHt+B9JNdSj?=
 =?us-ascii?Q?wBj2kailY8DSk/3gVPghs+7fmmbRISwXYLQyAhe9YL6CzH1UeVmJKSt0Fe5Z?=
 =?us-ascii?Q?adPSfte27HHf8Q/Nhxon+Duk+SFC0SDxj4Ww6MgsWRV4wHckgrfa4OvK37dF?=
 =?us-ascii?Q?NK6XShimiMYqW0CjKSVw1iuhjzUqtzN2XzmNsXBQSp6XYPCGMDL3vTKoWv0w?=
 =?us-ascii?Q?JryOQYimOEI/EiWYqznEVjZCtjzIk9O71r8kHQeFCecb6QTr9xc23qhn3MLk?=
 =?us-ascii?Q?o1mtg+P0pGoCp68gvIovnNSuzfoWw6rpAzLKOHJlKpUxLkuM2Cnrme9LWMln?=
 =?us-ascii?Q?9vxuOQ4w9BZnkqaTT9pkROHgPGW5EQHa6R91jTY52ix8kXM+qh1npAonMsX3?=
 =?us-ascii?Q?xYwwN+tTBRX4QCP/QPor2/bwnVaiyloc6fTp1C1jUgoO/ll41G7TNAiqHLf0?=
 =?us-ascii?Q?Opy/MdG4yQi+0RhHP3x5baKA52jZ04/m5wOQmwyHXHbnxAkLktxpHhTkc60X?=
 =?us-ascii?Q?nPNaBh3iXOd4i8Eew9mka8wAXt9WXmfZQlXNQeG49yljHcDqr8aghhYmcZ5M?=
 =?us-ascii?Q?C9ZCQCCMG6fLYdsZGj/7tn7GY2tgZrY5/2mUojwOgFe+9kjmsH0PD8CJCoV4?=
 =?us-ascii?Q?+gPDO4V4/4Z9II83WL3PBzTjQQKplEEHwRY9vC03EXDvbxS7HSO1c1UbIh7X?=
 =?us-ascii?Q?4Jdqb1+VifIVYrRavCQhcPqzjg80TIkgJO8wVhtFb45vUSEqja5yhpRdyEGz?=
 =?us-ascii?Q?DvtkPTPKs1jPOIoFQ+L8ldc16GFwQBDVzEBMIkZHWyo1Gyvj3g2FipYWjpEW?=
 =?us-ascii?Q?Ev/ayPOu8444vcWaNC3EoZbRJgokoHU4cafyRn76Wo3AczYpxRStfHojaWwM?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af302787-755e-442c-a603-08dcbad66e44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 13:55:31.6423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxPT0utC+wQ8NHRs4s/FQn6Xc2skCXVzETMJjA1fE5l+w5ydt1Rcy9FUAyrz2x1f+eN8mhG2xjU5OeWYGwu9F+tARhsq9NxgYMRt3r8Tw+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
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

On Thu, Jul 25, 2024 at 11:19:36AM GMT, Gustavo Sousa wrote:
>Now that we have support for setting a hook script for test cases, let's
>also add the option --hook to igt_runner, which forwards it to test
>executables.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
