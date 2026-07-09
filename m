Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C14C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 13:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17AA10E06E;
	Thu,  9 Jul 2026 13:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6yz7KuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A6710E06E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783602456; x=1815138456;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CDDkQ/WnNzdyS7PCO6cYefQeTbY7vrgzSGvVAezDogU=;
 b=S6yz7KuFE8e7YjMXb3J444nCeDHVoZqQkATET+aFy3AFFKIky5zvcPCu
 as6BHZwm2qCLURuhjfuKSvHXQaWXhvBnpZiFQhmU1utnSboFC2aO2l0l7
 4n4hepASPoDGr1DfdudGdGv5W9Ji/aqkShB6HytNtW6grWbGI71KBb47E
 93bL/u7TSg2+FommhEcMB/K7WCseDMGX/EQ5orHMEm3c0HnmPNz6rttH9
 V1sI7026r0LkVA3JjnS9unTgnlQc24MhzKq50Clu4OZ5uVvHhDMBx+VOs
 KKRQ3XsAnrCQ7YuKUY6RD+RcWKT3derrtZdXLupECDXEk85Eri13/bMju w==;
X-CSE-ConnectionGUID: AD/W0mIASmmzCS4g6iyLIQ==
X-CSE-MsgGUID: l3evVokEQqWrX4zz6z+/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94887803"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="94887803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 06:07:35 -0700
X-CSE-ConnectionGUID: pmHp2JhzTO25mKBOZLaUnw==
X-CSE-MsgGUID: Fyn/o/i8SQu2oF5x67oO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="292777513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 06:07:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 06:07:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 06:07:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 06:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxBP6RKmddlWq2O2KrTGinvNuUunoFCQwQw8QgNvfqIsrye6jSob0IWYNiBdS56WUTMKAWF3lPZZWTYUvo78Tf7VNrkOnZyWdw2VWYG5t8pusUQ3opPbm1xsj8lQ30Y5oCMfQidFD2okofwcEt6Vcdp5B2ijEB8VoRee3LcQVdReWLpyskzkSBUQnnF4oq7Kdqitff6Y/2Be+FMjc1V6KSoOUJf3+y4GQmb6orksaSaywJRaNFtkddTLD/JimEgEHpvstDdQMf7hwHEVvF8Zftz/N+tyUHxlWCB0CqlajnndlA0jaGpsevRP8HHgnAR1HRbAQBuIToLfL73ILFgvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHQnpoeVsAyo1uPOBh6EHRzyu0ap4cewgVleeMgfrG8=;
 b=PWb9YY2pY4YSBdTKqVSlajFfXIsjCv/mHoIMRKtQcTGvttQBjy/PjIf/hipCZpz7IFtXDIHcvMVJzmaRAktPR0mANho+XLQGS8pjjw/egNnswsTUYs9NUl+xhLGXfjk9rPo49gAHp6XRqPzl8zReB/6pz+jmZmx9KbMhhP5vT+dTCHQ+I1Cf4ql8jvyaVc342SoSqHvCNzmIU57ETBrZWzq8W40xfOY5zOFjjPJrawxAx4T0ar7ikZhOr9VoI3bL1BHMRFjBouAK87a+zk3yFbO0x1VxhCKHYzIoHpHrWhgvCzI0zCMU4Y1QmKBeQzokm6a2KOIzmRob74iWffmd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 13:07:33 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 13:07:33 +0000
Date: Thu, 9 Jul 2026 13:07:22 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 5/6] docs: Add comprehensive platform filtering
 documentation
Message-ID: <ua36prrbklfzjyth3dwuwmf7tsk4bycohmqbnlxbajnow2wjsd@qqrem7kvgqtz>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
 <20260706235130.157557-5-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706235130.157557-5-vitaly.prosyak@amd.com>
X-ClientProxiedBy: DU7P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::32) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2b2f0e-5daf-44e3-d754-08deddbb09ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|5023799004|22082099003|56012099006|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: h6RwQp1uciTdBLx24MDB08ogL0z6tnAUBjUrtw9oMx4N86BQSS4G6L5CvnDxEAJWH9t4U9R2PYZsGwgazBDKe0vMOuePHBuX1OOQRa3kK3p9q1GJTrC4aQB3ZgdcVB33J/wJr7qUuOtep+tqdMWHMLfDyxz81p/UTwKgtQwBjN6xWVcjn51IMrYw8Uuu9i2wTfPI8mQjoPpJKpyeHs9p7vDlEfpBcxX7+IKnfHbnIRjwQU+XY8WfDsEX45SUU0eGXebSPB6C9H10rDFcKI3Sq+1XSsK6x/7jhDume9liPkHs1ZasiA+f2NjgF6dfq7RnsPL01CcWKBo+1yWKv5yTacy0+I0VMO/1rb2+eiyVbb6OvjfDz6klqmgaGvtHpB0CNn0RkNOGjktSuv+pZYKlDc1X3Q+HXwlIjKjkqq0Q/GnjM4ZiishggP7I5H5c2jtMO50kr7bwZrhC1fyjA/C+/RKZMavu/0YP9YPx7600zdsYph8QNLDELkM5kaC48vRhOvwLUByHmvaFw5gDE6VLVH6QqkHY/dpj5oonMEJi1WlZu02IsMX+sfpxg75ii7tXz/whwFx8JknxicEfxs+pbvc60A0XgSCOb7+do8ZpgLUJ+j/iyZsFNkbFNkNah66h0Qh6q4F//ifiQwBEoydoKXfZIhDcaWAsnzs6Z4yWLk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(5023799004)(22082099003)(56012099006)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHdwc2lwcUs5aHFzZVY4TlV0WG9FL0hURWZtbWtJY29GSVFHZlRDMUZPYkNp?=
 =?utf-8?B?SVFHYWhTT2prclVwYWx5RVFDcFJhUXgzS1pqQ2MrZm00SlpxR3YwMlpkZ29r?=
 =?utf-8?B?eVNnOHdFY0tsZFZ6SS9TY2tUY0Z5aXg2MVcyTDh6TDk0V3hnM2VjWS9WWjNN?=
 =?utf-8?B?UkQvQ2xVMzk0cEZlb0gyVGF6UVpoZUVxdENVN09TODZ0dGlxdjNJeXJreER4?=
 =?utf-8?B?OUl0L2ZYWDNmeXZqeTN3UnMzeHhjemVtcTdBRGNUR0xRNmprWThmOHdFNlBU?=
 =?utf-8?B?TXI5bTNhcDBRWFBjczNFeFdHUGJiS3VKMXF2dzZCVTRGQ2xKRm1QV2JPT3Vs?=
 =?utf-8?B?SWNnWlFCM1dKUmg3ZGVBbkYvYmUrUnVsWE91SXB2c0FJaERlMzBXc21QWDFr?=
 =?utf-8?B?Nlhhd1lzMGErdjB2NkJvTXh0ZGlvaUUrMDFiL1lub2NIU1dKM0J5OEM3M1FD?=
 =?utf-8?B?am1CL2NiSUtrQ3FoaTNoN3Baak10a1hIYmQwSHVDRGxZbU5qVnBBRFJuZ2NS?=
 =?utf-8?B?TFJiZ2Z0MzFLZTRSamc5ZkxtK21BZmJQY0VBMHRmZ3pKN2I0M3liK2djZC8r?=
 =?utf-8?B?TjVEMmxzeTBvbVFXVnExcTlCaUhTazNwdDV4STFOcGFxYWh5eFJ6UXpidmhR?=
 =?utf-8?B?V1A4NUxsdGE1UTBlVGhUbUk5QTE0S2lnUkw0NHlERERIVEdPVmN3S3pZa3Vy?=
 =?utf-8?B?eGtpSE5icGdYazJ5TjNQVWpacTFMcWZzbHd4bmo2aXo2LzhObER1enI1SG1T?=
 =?utf-8?B?RkxnVkl5S2dqQVY1bzFRZjZtS2QrZUl6UDdiSWlpMlR4aEdDMVNaS29qMVNq?=
 =?utf-8?B?M0V0Sk1aQ1dHQ1ducnNxTVpsOEttZFYwYnBpcjRlUmVyWVFlaEtFaXp5RHQw?=
 =?utf-8?B?dmJFU1h4ZWF0dHh0TEZ3SEpQQW40c2N6ei82UFp6ZGtVQjRGWnFSU0w3ZUJD?=
 =?utf-8?B?VEdUTTZsbnZJaU1ESmVmN1BmRzlHSUhLZFlZUEM3eUt5VTYxa2xoWDRsSUhV?=
 =?utf-8?B?VStHY1pURi9BR1ZNWjQvclozdE4xY0dydHVMaVpiTlJncnc0NVkzMmR0YnFY?=
 =?utf-8?B?a3A4bXJ5ZnhiUFFsb2taaFl3cW5pSXZ0VFdrUmFCaEtjYVkzSmdxbFdLNjVp?=
 =?utf-8?B?VWJwWFlDOWJ1RXo1THZkYXdTd0RXQ25IU0IyVkw1K096a3pvYlRNcHdLQ3lT?=
 =?utf-8?B?U0duYUFOc0toRDlnUENPaERFMWJmdHpWYjQrNVBHU0QzaXpHNmlYOUpnWUda?=
 =?utf-8?B?V2lzNUV5RzhyeHhXUlE2ZFVaVG52U3JscVhMNXI0Rlg3QTVMWWYrb2Y0YW9s?=
 =?utf-8?B?cllDc3lxU3pCSno1Q0VkcTVBYWxHRHFJdUREM3RiSi92MlVCQVpZWmVHMlZq?=
 =?utf-8?B?U2tySlFKaXdqeFdWU0hoaXZFNExLS0VRTG5LajZjWW44UU9sUHRqNFRzd2Jy?=
 =?utf-8?B?d0RHUVZDSGlHOVhiNmpwRjR2aUhESGtnSEEzWVhNb21tTjNYUUZBNktmYS9w?=
 =?utf-8?B?SlRtZDUrVkJWekh2dFhVajAwUjNiOVNlSk5vb3hLdEN0dlVzTVk1MklKRVRp?=
 =?utf-8?B?Rm9heTdEWkRNa2tBVmZkUmpzdFlKbmxxeUVQSjZQV2R4MHU1cXp4bUs2RjVM?=
 =?utf-8?B?VmttMGdvWUpDMVJuWC9haTIwaE02ZHd5bkYyeUw3OFJzdVZmcml2enZwOVJP?=
 =?utf-8?B?ZU55dXE3M3ZTNVNPeTE3SUZ2YUgzOG45bXlDem5QNWNYT2QwSUZNUVFVRGhu?=
 =?utf-8?B?ZERoRy9GS05SK0lhWTFSd1R0TFk2cjd1WnJOc0V4d28zb1ZwMUt0czNERGVO?=
 =?utf-8?B?a2FKaEhLYUIvUmM5M1JHOHQwZFFLOTJZc3FXeXlyc2x2TlBoYlVCb0JRYjNQ?=
 =?utf-8?B?VEFFUEllVFEySTVtQUlObHF2dGlrWVVFUG1ENWFtL05rZFhFSVdEM2lucWYz?=
 =?utf-8?B?MG1kMi9rMjNNNDNqbXJyM0dzbnArWlU0T3F3Ui9KTEtiUWwwVFFXaG9XQkM1?=
 =?utf-8?B?SFo2UTVSS3JlQmVwNGNTdjJFcHI2YmFuZnNlOTRQMjNoNFJveDJiSTl5Z2NM?=
 =?utf-8?B?RHFsUTQ4OHcva1NNUllqR3QraCs5VDhwYWkzNmJPMTV5N2UwQitya2d6M0Mv?=
 =?utf-8?B?d0MwR2JTbittTE05dm82cGQzZk9MY1RYcWRvUCt2a3VWQjNoYUtvQzVMWE5S?=
 =?utf-8?B?YXd4UUhZdkx3bjIrOXR6c3ZuUWVwanVnWHdOK3hHTm9mYzgva1VLV0hWNTVi?=
 =?utf-8?B?Q3hScXIray8rNUF2NjRobHdZVDNrOE8rMmU3b0s3RFZwUytaa29ic3RtKzlM?=
 =?utf-8?B?ZnBBT0lqZGIwZlR2WFZsVlgwNkN3bDZ1KzVCOEVkUzJZNXNqTSsxVmFQc1Fh?=
 =?utf-8?Q?pVxrZAie7qiuxxLA=3D?=
X-Exchange-RoutingPolicyChecked: W0IrlbOOkbw4sx4atvbQN4JaTouf5j4klhV6RoT02u9IWdYTZXvqNooXM0SSEVmsfCyB0BTER28z8t/zSqc6boYm4vpvSlqT+g8vpn2SRi2gQVf8Ltcrh+8qwkklzcGnxS5oQjwTX/AMzdymz8pkdW46w3EPznwA5nXYI9qC2Q1S7KJ8QFRdgajwQvn5H8+kONOr0+vyCc+hvgyMu8+FjLepHZNxRCebnYxKPw4KqDwJ388XX6yMX8InfrXL6pgn9o+7i5kTqZndg3Wq2atJneUctFLwXV5lLfjK1wgB7wA0pyM+XLrXvXrgbuPz09fqJ2NALGku5pouRmIpNdlMLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2b2f0e-5daf-44e3-d754-08deddbb09ee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:07:33.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vm1YuaxI3Z1ox6dLDAd/XXJh8xUTeTGNKTAOVeUIYAfiWRn8Mm9yThSIkLQkB6GVSgxh2lvDUuSqM27fT1obLgqfnF8nPR734O+crAYc3G8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

Hi Vitaly,

On 2026-07-06 at 19:50:17 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Provide complete documentation for the platform filtering framework
> including:
> 
> - Overview and design rationale
> - Configuration file format (RECOMMENDED method)
> - Environment variable usage
> - Wildcard patterns and syntax
> - Real-world examples for AMD platforms
> - How to add support for new vendors
> 
> The config file approach is recommended over environment variables for
> managing large numbers of skip rules, as requested by Kamil Konieczny.
> 
> Example config file:
>   # ~/.config/igt/platform_filter.conf
>   [navi48]
>   skip = amd_basic:*-UMQ:unstable hardware
>   skip = amd_color:hdr-*:known ASIC limitation
> 
> v3 changes:
>  - This is now patch 5/6 (was 6/7 in v2) due to squashing of patches 1+2
>    per Kamil Konieczny's review feedback
>  - No code changes from v2
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I3b4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t2u
> ---
it seems that you might have missed my comments on v2, so I'll
post them again below.

[...]

> +### 2. Configure Filtering Rules
> +
> +Use one of three methods (checked in priority order):
> +
> +1. **Built-in rules** (highest priority) - Compiled into test
> +2. **Config file** (recommended) - `/etc/igt/platform_skip.conf`
> +3. **Environment variable** (lowest priority) - `IGT_PLATFORM_SKIP_CONFIG`
> +
> +---
> +
> +## Method 1: Config File (RECOMMENDED)
Since built-in holds the highest priority, you could put is
first on this list.

[...]

> +### Run Tests
> +
> +```bash
> +# Config file is loaded automatically - no environment variable needed
> +./build/tests/amdgpu/amd_basic
> +
> +# Output shows:
> +# Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
> +# Platform filtering (config): SWDEV-12345
> +```
> +
> +### Advantages
> +
> +✅ Persistent across sessions
> +✅ Easy to manage many rules (add/remove/edit)
> +✅ Team-wide configuration
> +✅ CI/CD friendly
> +✅ No rebuild required
> +✅ No environment variables to remember
I think listing Advantages/Disadvantages is misleading. Each of
these methods has its intended use case, so you could just put a
note about that and let users decide which option is best for
them.

> +
> +---
> +
> +## Method 2: Environment Variable
> +
> +**Best for**: Quick testing, temporary overrides, single test skip
> +
> +**Variable**: `IGT_PLATFORM_SKIP_CONFIG`
> +
> +**Format**: Same as config file, semicolon-separated
> +
> +### Example - Skip Single Test
> +
> +```bash
> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:Testing"
> +./build/tests/amdgpu/amd_basic
> +```
> +
> +### Example - Skip Multiple Tests
> +
> +```bash
> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:*-UMQ:Testing;navi31:amd_basic:cs-gfx-*:Known issue"
> +./build/tests/amdgpu/amd_basic
> +```
> +
> +### Disadvantages
> +
> +❌ Not persistent (lost when session ends)
> +❌ Inconvenient for large test lists
> +❌ Easy to forget it's set
> +❌ Hard to manage multiple rules
Currently, there are no advantages at all listed here, so one
may wonder why was this implemented in the first place.

As you mentioned at the beginning of this document env variable
is supposed to be used for small test lists and quick test runs.

[...]

> +## Platform Names
> +
> +Platform names are vendor-specific. For AMD:
> +
> +- `vega10`, `vega20` - Vega family
> +- `navi10`, `navi14`, `navi21`, `navi22`, `navi23`, `navi24` - RDNA1/2
> +- `navi31`, `navi32`, `navi33` - RDNA3
> +- `navi48`, `navi44` - RDNA4
> +- `strix_halo`, `phoenix` - APUs
> +- `arcturus` - MI100
> +- `aldebaran` - MI210/MI250
This list is sure to change in the future, either by addition
of new platforms or decision to remove unsupported ones, so I
wonder if there is much sense in listing all of them for AMD,
Intel or any other vendor.

[...]

> +## Summary
> +
> +| Method | Use Case | Persistent | Rebuild Required |
> +|--------|----------|------------|------------------|
> +| **Config file** ✅ | Team/CI exclusions | Yes | No |
This ✅ is redundant, since you re-iterate that the file is the
recommendation.

> +| **Environment** | Quick testing | No | No |
> +| **Built-in** | Production rules | Yes | Yes |
> +
> +**Recommendation**: Use **config file** for managing test exclusions at scale.
> +
> +---
> +
> +## See Also
> +
> +- `lib/igt_platform_filter.h` - API documentation
> +- `lib/igt_platform_filter.c` - Framework implementation
> +- `lib/amdgpu/amd_platform.c` - AMD backend reference
> diff --git a/mkdocs.yml b/mkdocs.yml
> index 0abb76704..6f427b20f 100644
> --- a/mkdocs.yml
> +++ b/mkdocs.yml
> @@ -29,6 +29,7 @@ nav:
>      - How to document tests: 'test_documentation.md'
>      - How to categorize tests: 'test_categories.md'
>      - How to blocklist tests: 'blocklists.md'
> +    - Platform filtering: 'platform_filtering.md'
You could change the title to match other's in "how to" style:
"How to filter platforms" or "How to filter tests per platform".

>      - How to get code coverage: 'code_coverage.md'
>      - How to port new IGT driver: 'new_driver.md'
>      - How to plan a new test: 'test_plan.md'
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
