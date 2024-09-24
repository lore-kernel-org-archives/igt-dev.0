Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9435CCF9C5B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 02:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4667610E343;
	Tue, 24 Sep 2024 02:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch5Ztv5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CD010E343
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727143619; x=1758679619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PYjttBhKW6ozs1i6VMBzplfxELSXph+6Xkhp9FiPbhU=;
 b=ch5Ztv5MVpgLfIudrg+5Utr4y2Zyb3YX2kSeU2yJW5qfnAHpqOgSGIes
 41WD8njcQAoR13wDDZNRQeIemi8is8jchR2u2NcMJwUzE5wee7CyOtbsa
 jv/iwjQ6j8YQt5y/+9dtgIw2GLO+G+4ZZpswYyr5p4u3b+C5XIf68iSmh
 477WpLsdU0c11XGlwmCObeyrq8ooR1hXZApws/+47nn83q77yC02WYziC
 lbe5ZHadVzr/aw8DhRZlOvFrzz13fGzCHs86Wk25uS8BNx6yp1OePmXcW
 /11hWHz9Zoy2gspihr5x21Wp0OEjodV7fEhb3PcvmlMEb0QRQfNe/2nmA A==;
X-CSE-ConnectionGUID: P98typ67TLqsytRukLvb2w==
X-CSE-MsgGUID: kOrLkumWRZ2TnbhjLyAojw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36704569"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="36704569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 19:06:59 -0700
X-CSE-ConnectionGUID: JjLja3V7Qm+VSoIov6yLwg==
X-CSE-MsgGUID: b5esm/9qSnaCNVCTBPHPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="108697761"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 19:06:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 19:06:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 19:06:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 19:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxf48AOPrmaYUoBnfo5XEsQRK1CEO6iM/MDg/PXPJeemy76Eqoa3DF/+wlhS3kbOKq0l8nIgXiLNgI92scERFaHnFvH8PP25V5OXRC4D6Fc6XNAcoswN25faQuPexIhD4u47i8DXMjiamP2nilLO559ZKLqtPxPTnDZ58UH2GzEurJcfsxEx61Q6gHibsL5g4K4AQiuAp9+r1VqW03Ksbi5ffo0vTUxyjAPnKrgKasNmNeoPb8qOtBmDMt3LbHODjDKRvqY+BYqboX6jDd0HkXcJQ4tnX4CBYZ36oUiKaEBc5uy1uDy2VV0jYODwS5M9QVZrn8tzJ8YjO7XiJc6x4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnRGtlBWB/55odxugtl/9StvR3lO5era0QlEOsM4rNo=;
 b=PbNXkr2w9M+JCrmChQOcS4JAF5Q5tlTo5x6Kv5hDjGbjjcw5YKLKS5l8dOdXxMAWc5baG+5sIL9OfNrc5iY93js6CHyzYL6glI12dRhhndrRKezrKzUcsEa8dhCalyxOqxPD7QBaoIrW0OnxgNUruoNjeqilDwPMwb1EiUdM4VxviOdk92OKqPF9HSA7/8XGStKEoqMwqhUaN8T/JXVcN9Cygygei5ewNzPNHIUEm54NNGQZarecAQ5csAe9CERV2iGhl8NJz/8EeVHG/23hGb9P6s73eVapXnp7pFwnCwf7kFMg7+SpVtPEFGWULbsg5q2BxTSL5w7ccHOCAOJJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 02:06:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 02:06:55 +0000
Date: Mon, 23 Sep 2024 21:06:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 3/5] lib/igt_gt: Add
 igt_open_forcewake_handle_for_pcidev()
Message-ID: <fcbo5n6cmuj5jq6a66n5aodshmabsj6egszis7qqzr2scdm63y@zk5n4uv2pwtw>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
 <20240923221146.125848-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240923221146.125848-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:303:b9::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 2778209d-5dc0-40d5-d4eb-08dcdc3d90a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VRB9WnuaxWi7gLITzpqqG/1ghENYlYsO/MUF/MzqlD4Qx8xJPZfYEvaKxYVw?=
 =?us-ascii?Q?mDXFx8l0V+Z8MDYGsthKogw2WPuZ3cMfd+C6so+3tOU2JOoNtpAyzjok+coB?=
 =?us-ascii?Q?qKcIq5+IZqG2RMqIdpaDhCggVCNBq6yemWcGSG12HzogdUOi1RU2Lt4bpKkj?=
 =?us-ascii?Q?LWBhCmz5mMxG7IvMPle69fnwjNUyQcuul4UrQsLHlpmYfJ7dDF7NqSbySW9a?=
 =?us-ascii?Q?c3+iaA2C/NjQKIcFzwPbTM0HOWeN4kKUmj9cc11vSRMNrn0aCnSX9BVP1JlB?=
 =?us-ascii?Q?hqUuFX6D5GLrVwOQgLHAWOAY8az8bZ3U3+6jp1nzGkhyxzR1vQmwPz810Ccv?=
 =?us-ascii?Q?Z5QEkIVB9Go3laxRthuonxGr9C+y2Jl4VO2NM4BaBKyFvrPBebj7pybu9Z+i?=
 =?us-ascii?Q?6smZ/VKMPM5Xm0wp8aBW+xROaut2juaDZ8ehSKhVN6Fe3OYcFI9pWgfmr9tL?=
 =?us-ascii?Q?kOZoxpB90kimgzPRPp334ImEb2SFJmYKCDOFTTF2iffYq8QuVeiQ+bJ8wtUX?=
 =?us-ascii?Q?gMqMN3xlKmlAAqTyXyFCrV1ta9VMSavYym4PUuDEbii5QN8gKbo9b0KRBOYT?=
 =?us-ascii?Q?iXxnuyuUpFJH++rrUB/kQchPMcifxcUN+PgBnHH40QUP9qpF0Zr6NQWkjXli?=
 =?us-ascii?Q?KM62o4LjSdZUOlKTWGJaLMAl8k1xYs63M0Q0MK8B5rFDMB+bnhvXHVj6XIcN?=
 =?us-ascii?Q?fWUn9GEc0tfqyy3oZUjQoiqMOY+2D2ul8+28o00F2kf4g7/tZrxfmTTCErfA?=
 =?us-ascii?Q?jJTPhSdNXPEAwJf8WhawKqF6ey7JlMflE1UMqxvRs5G1yejTmYnfQsANX8a/?=
 =?us-ascii?Q?c/+3os7WNQmgl1wQ69ooCbF+aBqCPw8wtPEtgXbmhQGdtuRklMofANIRvUHN?=
 =?us-ascii?Q?ESu0ZMEG09zu2eh9wHK1ZZCmPbV048161oz4px2UcG6RhSLKg2RofrXGAD9O?=
 =?us-ascii?Q?oZO5+jtzXRoOCvN5144HuOgws4z2tVPfOppuc3OqPUsX8bQXDuu0eRubkPlm?=
 =?us-ascii?Q?AhllvnqsVdTB4ePAE7vLZGUx7QjgUEgPnXlGf5EozZeWj1JvNISFx8jNfPx4?=
 =?us-ascii?Q?Sxgv0lA3hHig5eLL4WnS+zwCSYY0U+U0PgTHCQesjMkpcXqrVljW/Fw75ww7?=
 =?us-ascii?Q?/wN89ThL/62ipVzRkLRTYNgO4J6Qmo3MYNriBp1RzJp60Vq14S9y6tMwOfDn?=
 =?us-ascii?Q?V2ezRoty44LJBAneSE/XIt/6vyZKfyK8lCPfjXAtnh8PPlvbIVKR1dzDhy8M?=
 =?us-ascii?Q?zLpXdicpJMzDUUieKYQdfm9VTxGx9On8y73LAzCQJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6lVE85bu8sgGQFLltsI0nP4KcpA7C/NoXn+54/jGafQk0z+VfW88lqWwjnT1?=
 =?us-ascii?Q?iKjIXAeO99z6X1VIGS7GEqmy/cf4mj8YAj2pwhFWVntdmA47gOcK/jO+98ZC?=
 =?us-ascii?Q?0co/zbz7ZvqLRCjmgFx4u9AGEvg99vZ1olTRqV8y3ydkn61AoK9xub+SuLbv?=
 =?us-ascii?Q?qBHZ5z9Tt5paEC0RBA5wF7/ToimSIhnQBT92mSfLTQoF5vLqFL0XhpHcgC9f?=
 =?us-ascii?Q?bk4oQwPddWFiW143EMPIchqdQ4H9LSMzTozuevt9Rs6bAIL6ORJDrHaZpbhw?=
 =?us-ascii?Q?v2zFIzW6Wjr9fnlQ0lHMHSrGpAIxxw8iNXFZR0sYnut01XVYimM+bNEYPIlO?=
 =?us-ascii?Q?QR7w5/nqOpU+KrTKSQZtKqxNrikUdDhVL02aCaUjhDZO81E8hDBf5AE8DrOb?=
 =?us-ascii?Q?mTCiVrYDWogy58uXWGRTx7jDUfqO3hBlxsl/Gq7L0WewiO9GSfy2+51RygDY?=
 =?us-ascii?Q?bHCzZK7+0paWzMci6GlKQdJ8TOgHx9Xzz5cbU4hxKh7G/EOkCmWWK8q/87hU?=
 =?us-ascii?Q?2iBQZMRaptxALLRCv0mvM1Z6yNXowQ8cIi3k6bg1v4w9YyVWlU9EsKqlgJ5c?=
 =?us-ascii?Q?YKHKpOQDvIsUQY+KIoCWwTh06OfwRSz8rriSbF6tCzMZSVl4l6pKimWJx/V6?=
 =?us-ascii?Q?cEP06mZqWFVr8VImvYpzXTcMjKff+JHxRp/ZkF84JyWXEw8w3dPPlz/Z+yTI?=
 =?us-ascii?Q?/abgOpTP0MSCqHD3Xk+KqX7PvkWH/57ZOy71rWIjml85czUmF+Bw5z8PtIPW?=
 =?us-ascii?Q?tTeGggWeZTfwlXPzWy0qExfPw/nUnTDYIIaQPCe67T9xajG3hB7loJs3O2TP?=
 =?us-ascii?Q?GRcnQigeTOeNTcZeuH/O+GNChP325kMmy4XqxA/GBoEBcQp39QLowe9kCtxz?=
 =?us-ascii?Q?8G5kOKLTIleVUbPTQgymr1/df8oB4n3VVsK//ijOa/451C6TfveyoePym1ca?=
 =?us-ascii?Q?LuvJOLbUsvmXy+h1DLJUxzapJrgecmAQnfCaCuHjMQ17RTd16fsmIWXIpeeX?=
 =?us-ascii?Q?ReBL0Yk6vb11TXfYppYnGCcRqDclq51qjbUFXlf/itI4agiERau4QWtse1jG?=
 =?us-ascii?Q?nW9Z3OVRbJi4bN3aun/7cgGOqCQBd8pCNDYvuGgEgVCNT5p4EZlc3IoXd+DR?=
 =?us-ascii?Q?vfq/bV8IsNUiwIiFuur+5wbiUwkqsAgmdWC+pXX6n7JJ+ILpHg5ydH5gcLZy?=
 =?us-ascii?Q?KoRUUvX5Dbc+m/lXPXeGWAS1TIFPWV9A4pnjPVB/AjikBcL7CBMTX3o2aZuC?=
 =?us-ascii?Q?Xkky+6wRKX4zrm51xEyyJtM95yMppsUeY//nJxe1kZiaZ+gVGYGLhcOSwjkU?=
 =?us-ascii?Q?d8abXPP3HEfl0Cv70ce6p3pf46VqIsN9HeMayDodIakrzCHZBv0AVR7vGZ0G?=
 =?us-ascii?Q?LIwxQug50/vOiqWxWOH/NE30FA9ukocLcEw2V2DY7FmkOeGLITuDtooBO5Tg?=
 =?us-ascii?Q?Hbqq1LuFT8Pf2NvGKFNXDpzjH1i12DeLH76kiE6BrmK4wT4lfGDTXFOw60AI?=
 =?us-ascii?Q?eQKHMmTXP04HVyGkycqWKdVxLbFQxL4b60dkqY9RQIeaW08F1TPAe+JoLz74?=
 =?us-ascii?Q?f0s74q8PqNiNSnqpz413qAyb34UECm7wdwns2B7LDjFNExWzoy41tTqDtDQb?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2778209d-5dc0-40d5-d4eb-08dcdc3d90a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 02:06:55.8680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43knJWicuazF5/p3fMEx9w8IJ6Fvf6AS/LXREAZgpCcNSLoQb8Wub2CBhvzEyQq+fOHWrFaqNELmVAP0qoV0FDfCJcTJmaS5o8WyuM4P1qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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

On Mon, Sep 23, 2024 at 05:11:44PM GMT, Lucas De Marchi wrote:
>+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
>+{
>+	static const char *FORCEWAKE_FILES[] = {
>+		"forcewake_all", "i915_forcewake_user",
>+		NULL
>+	};
>+	const char *debugfs_root = igt_debugfs_mount(), **fn;
>+	char path[PATH_MAX];
>+	int dirlen, ret;
>+
>+	if (!debugfs_root)
>+		return -ENOENT;
>+
>+	ret = snprintf(path, sizeof(path), "%s/dri/%04u:%02u:%02u.%u",

oops, these were supposed to be x, not u.

Lucas De Marchi
