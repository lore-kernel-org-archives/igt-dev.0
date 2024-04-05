Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD95C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 17:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342BC10EC71;
	Fri,  5 Apr 2024 17:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nkha+FDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55F110ECDC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712337375; x=1743873375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6aTQJ0ilS8DNJbfeKsV5lH7FOTwsZ1i3V0b1BpG+93Y=;
 b=Nkha+FDHQ1hLpnZAXcs+Tc2nnlzGi4B4H6QLs07kIIKGRdgfQpjmmY+U
 /DAbqnN1a9ee/OyvLep6op5rQQmMw+dSOF2kMq2w+KgMrWYS8BsIaS3yG
 TBnzwfVVEnFw7Z/rc3GjexYzVWwnzHj5oXjzNQBBxPR5ZiWFZLzD3lYaM
 GZsNfAFwKA/F42Y5KcFpQeHgyIvdxk21z0imscVlalVQYkGIZ8GXGTRUg
 HRi2wd/uTCk6T2v+3XfXOi6gyPIjnL9HTqrZuvueoZl1gXS8I8JMGS+XK
 aJG2oKOqOkaIPriBRTT53bvxodBANi/JIRgT6bWLuxKhN611KyOzNlsfY w==;
X-CSE-ConnectionGUID: DXzfJmsHRB6QQQEjJyVv6A==
X-CSE-MsgGUID: x49Jv6QCQPi5cT/cOoUofQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11469291"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11469291"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 10:16:12 -0700
X-CSE-ConnectionGUID: HGpTLRAJQFimfpxp5nAATg==
X-CSE-MsgGUID: V6WBDsQIRfCNqMx5/rnt1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="42402000"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 10:16:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 10:16:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 10:16:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 10:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuGzVikv7hdPdXyuoGLx4yBjbfu3y7qOWF1YccJkmuYIWcFGUGyJCYk1Uge8MCdCLhPPia2AqzMP0NNiulKA2ygxwWqxGy4P/RDIIRX/hjd39vy5HyVyhblF8y8m3x3sa3Up0IPFgb4hBtZDY9JanQq6F35gm6oLBBOVqROexoMBLbqzm0R43UWh+gBMyeS5qUAhtWtcif9tTGDhIBukRf15af8dMZNoBQDl8yc5KWmgr+zD1T6c4vTug48YKiTtUh+CZtrCKI7o0p6Lyd8otz1sQQMi1LkvJT5eDClJrBUCdAwHnCnwiXzJh6CXa94NCVoyeuihj7XqD5klPbr6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aTQJ0ilS8DNJbfeKsV5lH7FOTwsZ1i3V0b1BpG+93Y=;
 b=erE9nj2zlHpgolaUyERHb3xQmOlzskZHeB8/da8RDvzNmvOj43eJTxGtKJyL9+INZD5TljpySP+Vu+8uVVWbrBYsJPnpYVPHJBYPvPz14RlPf1PDyuHinNU+f34LtX/u+eZM9bYQ9wLJV6KcmF5L9Fkq4RTBUYZYP+Uoi5AYwzxlPV97bzUsMmWzW1MjBSE6Ow9emttfNNc2VVcFRPS/uk1GbUXFbggDeZMCuBx9qh2mlXoM8vAgyNLF6q98Rnbfi52ZKjItZDpo/FgCugCpt5ZOg0wcS/0gKcF8DKeVehh85B/GfPhN3hX0OkN2W/Xgh1jJ40BEyMP54l0/0NhgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Fri, 5 Apr
 2024 17:16:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 17:16:00 +0000
Date: Fri, 5 Apr 2024 12:15:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_compute_preempt: Run it on only CCS
 engine
Message-ID: <e5ltd7rwzw5neui3ckzld63uvfebh62ipxcbxoi7hri4yizukv@4jf6622nptr4>
X-Patchwork-Hint: comment
References: <20240404102901.18803-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240404102901.18803-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4916:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBygxL5W6fb/D4ZogfNeWJoAvqV6LHMuq+VJMThaqnv3+W91uEq8lzLm54gLFygCnCLkJpHoQ9fgs7TJe3h8NAjDUpGkodzVpwshwNDdz/pG+rXVeXWI54TQRoW0T0KM8nggkIxajuy/sEp1ZUN/aNkFYLHcBBHDysrz59Bzmmkg4dsePXjhekkE0bI4zK7fDgXCvsgiLQnyuu64j5RWYw3CyhtilGbNnUh9OqHLWCwFxQOxf41RP1Y43LObHluRij+jf8axKI1vfjTNO8QPvG1l3yAp4IS4vuUfpmEQTSS5wqSSJPsYhHOxCfixIwPxR+EoxzEIJHC7nL/DfSYEtzAxkzt4ShGC+b919lSsPiTGXnDKSghCVJdf0Skx5pS5P0LiJ/PEawLW/8ApcUjIyDgw9RIdnrbUizlCnehJrNBTk/jsMlgEEnWnibB19bMWk+uPAnu2TWdlQi7qsGlGTM6Fe5XOVlc0a5t30Qt5HXDF1OaGIV2nkMTEHKmPopxnWl52oqTFktZVU0PCt08UUY4nvrNkscsIJ1pvuGKYbv7Tso3IK8WeZ/qvBLngjA1ON5dPUOhgFuE4CAERAPh8JRLa8d1dCgAPwKd8IVBpzuSegQpP3Z4jsUoxu49r4u6CaHWXEYM1b1R5T5tMYUjUaKfsTvpM/PhmuKLwtYh6qUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fWDwP80UUQjStEsqSKLUAExuMGJjvIYUrZFs75pSTRf1q1wBrF/Peswtk3UP?=
 =?us-ascii?Q?UTXtWdpkFrX+sc9ZbPvux/Os2TJaonlYYs6SSCVGdvVblVgO0gr2Ul8z/IMq?=
 =?us-ascii?Q?bccWRflfoUkpMcpUrp0eqbbGeH/lzsTFgo8vVqYrHwO0phgZrz7Zsb5yf0oL?=
 =?us-ascii?Q?FO7kvxf06xfPJ1AeekHfpbwRjbnYOkoV/73JHVmwcP891f1HDS5DupcYqPUJ?=
 =?us-ascii?Q?4mxbkdrdMWjWAd5PUjrxN5bN01/Fyc0kxoc3Ek193pYl+Y1T1l9TFVWKC084?=
 =?us-ascii?Q?cSURjHZDa598O1xWS/uaKmYrrn4X0a2Onv2qaDrOb6Sa7mXL4q0Nqu5g5fTH?=
 =?us-ascii?Q?oOtTjekGaYXNfbsEXbCuf3kZH9kiT1mmfN5I6YDaKcOUNAbJQEyMN/Wq8so+?=
 =?us-ascii?Q?LEUH5l+ICtmgX6HMFB3o6PaYbEhcyjjJ1GTmR9nw3Qj7vXQ0Pcytcnk0cY1O?=
 =?us-ascii?Q?yG28FlMMjI8ndwCplGItCB6DE4PUBMekPV5CcaydqXEjNa1WuaS4nRbR3zPr?=
 =?us-ascii?Q?2UbOQ0BE4Z5Ts/2beCOxjnBUxYK/o74r1iuBCVuBRY7iH8vRfAWkNLXXKHfF?=
 =?us-ascii?Q?Em4/AYHYu+1C5gFcSiC8NIdCWt6kyvLJV1wr7ouxv8dknfoxM4ra4Zr4S+dt?=
 =?us-ascii?Q?kf/q7Azkfvej2HK2PM9ZAYfVXYaxwCvQUnApVcVeeru1odxLMSGf+K0XImX2?=
 =?us-ascii?Q?v9DmFMWOIcvU5VcP0uYB3XarSvO0hD/soEer11+4o2pvxo0QeYv1Rs/PC/jK?=
 =?us-ascii?Q?ZjcUrqche3bsa1isXRLilr5Pp6B56Oc4paBYLFkDVFXSf9JD7+tyhjEUcbWx?=
 =?us-ascii?Q?M1C26nN3Uj4KcOYrnE0K2o0sWzWzhecip00iN8yMUfbNRAVjqCIGHA2keeZZ?=
 =?us-ascii?Q?g2LNYqfpqz1am08UN1FM3MnXCon7oUOauC7CBiuCYNcbZjZev6lsPUJtN+PZ?=
 =?us-ascii?Q?yXqXG8zFAJLYOwl7/B8cUZiUf/fd5uk1z56E6z6bPyW/haqopVdyflMr83KY?=
 =?us-ascii?Q?f10NtgyhDDioo2+u+aZdBEcb9DhN8Db/hu4XtaJCpi/JMxQYu8EGQ7VtR0Wk?=
 =?us-ascii?Q?urrui/nJ8btGQuUn6MeiZJMDnZ7+zSLx9Yt5/STgFfzEpEceXATB5nZ0RBQI?=
 =?us-ascii?Q?NiNF6R4dn1VNhPM1HhlRQUZHItCflucWr4j7yEq0MY+bYK3+6SDmQ3MPDsGk?=
 =?us-ascii?Q?JpRv1/sLcu0hwL4NoSz9xnn6o0VePJ9zoQUQntd6l39AGkUny0kmvLpVqOCG?=
 =?us-ascii?Q?lMW7NEMjK1OZUSddZ1iEEmzJSkWC+NSKccb1aJ8e0eXmQcYpG9qZEPF+hl3W?=
 =?us-ascii?Q?sJTfnJbHKmOTZF8/LSd17ycEyFUnzyrpzVQRcSwL99MXzzoLQpUGCv/2cKPT?=
 =?us-ascii?Q?kIyKlEGl0xoA6fbEkCnkh8U5WIr64jSOST8G0G06+nWKsWJwDauBSEmXh+oY?=
 =?us-ascii?Q?2L+gKnlLCSVqoYKwWno+mMen1aQnUwQkJg8ftnpUljK94yYfsS3caBMvoAlg?=
 =?us-ascii?Q?c2iOS11eAphFQ9W1gFT53NWvqvxIiU9MYei7pXzeXS7vWKcrfeB5kcWKadY9?=
 =?us-ascii?Q?/Jba+JOwD4hox6T62lWz5YGkZua8/BEyHOb2NOS6aodO0vyjsxmYgcTNPS9L?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5e4578-d620-4fb8-80cb-08dc55941086
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 17:16:00.2927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOSgh9TO2fMCTTJmh1E4PT0XE030486dZasYFTD/bpCvoasCLPbj8ogadMHtMlRJ0bRVGlMDyymMehcGo/7+AvXCiwnp/VgI5i1ydRUYiew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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

On Thu, Apr 04, 2024 at 12:29:01PM +0200, Nirmoy Das wrote:
>Expectation is that mid thread preemption works on CCS and
>RCS is optional. In future we should check with engine capability
>when that such uAPI is supported by the KMD.
>
>Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
