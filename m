Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D22C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DBB10E51D;
	Tue, 25 Mar 2025 09:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnjg+y8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8C110E51D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893361; x=1774429361;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wLbrt8+QNxFPORBWoL3DpcQbEWexJWVzlGlCTbP9wS8=;
 b=jnjg+y8jMT/2PtwNtLsOOzrGkkXXvvpZ0o55wKZxv89ID6bNTPlKfReX
 wRVEcnMvGm1TTE1Xhxhg8lLZTFwK+ejSH1Ra0lN22MkBvCmbfQR0iYyvC
 2LjpGI6esfWNXUFV8TvmnQ0Cw1lMtdBfyA8JRKChhSf9cMiC4G+LSFZXS
 3ML/+5UcPqHLq3hJg7XLhPq2Fvgou2hZ9BuU2f0AwWH+VjLeEQEn9z+VY
 +KPWyKBrWB9rY+xwJJ+4ALG5c1clKKT9oZVY3RNru0R9VxDpl6nZnSjFC
 Gv3ANHAA8aKXYP6UMLMQsYJqP0VH4pm9wbRMjk76WgxEfNyP1CwZ7KdyX Q==;
X-CSE-ConnectionGUID: ZFEu1l07T9KmgUFX8QUdUg==
X-CSE-MsgGUID: AUU9S0AuTOa0LOrtaUvAlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44050399"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44050399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:02:40 -0700
X-CSE-ConnectionGUID: FwZFuv7KTPOI8FnWpCLMOw==
X-CSE-MsgGUID: TsjgnK84TVK/RTBvV3bInw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124284929"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 02:02:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 02:02:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 02:02:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4UjJoU3hFcUZMTUQZKOvNKuHffiefW+wCjPJzfTcczrV2MSNwgDDpHHbGgXlzwKA9sBAoaniVhS+Yr4TyGIHYRllb95i4bNExjtNZlat0JSpnwlv2Zd3L7m1ccU9MKs5SQhothjiQoK/KXG4/pemQ4HKm2KV7UrVJoDgk52+vLNIfMaUHqGAQeo9Fu99Vsicw6ufe79eZlpxXrLHQZbi6pO87mas0AVxMQL3lm99vGn/5oyzSRVk7RJtgvg4ewNK1a8cPbL7jFGS3RaZLASnZfuK+LuPgOFVU/ZvhfoEWFIO+SuvQnmn/I+d81YHwE/fNiB3Cs9c1J7mX3KKv/bzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3pE/2WB2NQeohLUtrn3vFC9/VpcljrT36dDYVR1+5k=;
 b=Qm1Ke298PGAg7rz8ROghY76uqyYyVjM10dQnp7Bq/oU1QjAqH86pS0b3/NJbTr9Q0F7ss/s98sCM5c6o0HYmla7OL0PL8QOBX4gJ0p5zeuOj6fN8Z3Hibza2BbreMQXDoM9RDx+/Cr4YlILJFqbn924nJatGtYsE2A9nTytMGaF1oQgYTIhfdf7KEOc8q/ZVW6I/kZG6u1PWBdk4YAoPSWLpHBOuaOeYcHzCamPzS3qs6WkhjUeus6k/GG7vzboEI0lyZfNuhAyuYz0zLvTq2trXpgBuvasm0OvR6xQhffkwhcvwfLJtrCMNtF5NNAnZyhRVfMRHvXDp75VMglvcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:02:10 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:02:09 +0000
Message-ID: <424d20b6-b8b8-4e1c-9967-35f065e67c1b@intel.com>
Date: Tue, 25 Mar 2025 14:32:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_plane: Add test to validate odd panning
To: Nemesa Garg <nemesa.garg@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250305151708.874294-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250305151708.874294-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: 203d5042-74ee-48fe-d567-08dd6b7bb99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3ZFQTlMTXVoWVJHL0h1bUdNNDAvWXZSVjQxTmNWenFIOU1LUXpqSG1tNEFp?=
 =?utf-8?B?TjF0UVFZMGlyUUp6SVp5b05ESWlDY0dJalNwOE90OVBaNEhUWVpxc1dhcmVY?=
 =?utf-8?B?ZWl3SENlQnozVnN6UXpvOHdHY3gxZ05EVllBd3Njd0E3K1FWZ2ZGTVRyR1dE?=
 =?utf-8?B?SldaQUVQSlNpcnRldHZkc2hMeWlOZmJKV2hsNEFPbkgvSmRuZDBjQmdPT2NE?=
 =?utf-8?B?dS9sM0xlUlk4OHBEcTM4c3VQdEFrNnpNeUNqZjhNN2tILytBS21UTk5rZDM4?=
 =?utf-8?B?WS9JU2lINWNLTURSbmc3ZFR3UklJV0RhRXhUZUZ5RHBMOUV3Q3VWS2h0REF2?=
 =?utf-8?B?THVtSHl5cnQ1M3gxRGpnbFhoSThmS3EvR3UrOWdUVHVHQnRwMU5ZVU5OaGJW?=
 =?utf-8?B?UjAzRXFhT01zZ0tQQS9mMENEdE85UXl0L1gwZ1ROUXJERHBGb2ZNVlQ4dzF0?=
 =?utf-8?B?OFd1T3pkWlYzb2EzdUErQ2pyS0tTN0FSVzM5R0xqWVJwL2VFbnZtRFlyREhH?=
 =?utf-8?B?TTJ0OC9EeWVva240dFZEc2k4S3N1TGNsNy95MDYrc2c3azBZRFVjQ25CVmQ0?=
 =?utf-8?B?cmJodDRHTS94OVBOckYyVjlQR0hkU1daQWxsL1ZZRDRNc2dYM0FjTWlTMVkv?=
 =?utf-8?B?dUsrNHc3dERxanpHMnRoL2MyQXZPMDZqNkVJeGJyaFg3TzBNZlNOVHMrM0Nq?=
 =?utf-8?B?ZE4zNWl3eG10SmxKSERPaUxRZEhtZVhPNGprREptbUtiUndqQXZ4ZVJoRFVV?=
 =?utf-8?B?RmJubzVQRGRlZlZwZEs2dWNabUhBRTVZNUZzSXN6MjFjbUVxTS9kM3FNc0Qw?=
 =?utf-8?B?dzdwYUpQOHhKVTlnVkJJUi9VTXlXSHAwSjZ6TkxYU3hFSlU4S25DMUFvOHd1?=
 =?utf-8?B?QytET0Z6NmpxajFsc05VNHhkTFp3M2ZLSlJKUUsrQmE1N2NwaVpSQWJHL3Fm?=
 =?utf-8?B?QkpHSC92SmpJemluUHJaSHpwZVZGZEV4ZVAzR1MvUS9pbDRQL0U4K054aXJK?=
 =?utf-8?B?WHprMjVLOTlTQlliSFJCSlp6cTEyOTJBVU5jSEpPc1MvbGFzVFRBNEp6dFow?=
 =?utf-8?B?cHBsRlFZRTFJejZHK0greE44RitiVGtHcWV0RmttV0lOWjk2aWpabllleFpv?=
 =?utf-8?B?NS9Kam9qRytablNUNVRYUDJFaGhQR2lZODFlQW5mV3VOV3ZaU2FEempOem5s?=
 =?utf-8?B?YlNMNGg2Rms2RGxRTGJweSsvSHNWRUdxUE1vRmwyL0U5cXMveUI1bjZPRS83?=
 =?utf-8?B?TUY0dFRuSUFxMHpYelZPT29VYjBSd1NOM0tIa3ovU2cxWW9pc1hIWkxhaWdP?=
 =?utf-8?B?Vm5URGVvSHVxTzliRStmZ3RZMFBqVGYwaFd0QjVNZXBXc2NEeUlQU3ZXOUVB?=
 =?utf-8?B?WVhCTllzQ2FsNUF4QlNtcHNWeFY3cDJycDFGTVJkVnlWM0pqU1VhUmwvaUFz?=
 =?utf-8?B?NGpxRXhmQ1ZneVpabkRySHhIanJlbmt0cngwUE5CRTBCemJ0NE45T1dGaHZr?=
 =?utf-8?B?VHV2clpwSWF2T3dVeXNFSVFCa2NjMnVmK2U0ekorZzRaT0RFM3dZR211bXZK?=
 =?utf-8?B?QXlKZEhiSXZPSG1yakVPT2h0bnorbXpnQXovNHloeUpCMTR4SU1xYkJGc1Vi?=
 =?utf-8?B?SWtpd2VyMmMxNUN6anRCYWs1QUZTdUdycTBJbGpRcU91ZVR2L1c4QlhQZmlY?=
 =?utf-8?B?T1RDQzhBQnE0anczdzlVd1BzQkRSakliSlkyWFBkRWVxNk5CLzc1VE0wRjY4?=
 =?utf-8?B?WVhQYXJmc3A1ZVhISUFUU1VRNGNJUUtJRXBaZjZHVDhwWnplR3lydmJlbndq?=
 =?utf-8?B?VEFkT3FGZGhRQUF0VVpkZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtvQTh1dC9YUXpMdDhWT0NDT2h2RXF0WlRyUDl3NW9RU0g0UlhjWEdUODRH?=
 =?utf-8?B?RGNXcURnSW1iZVhqVWJJZHovQW44QlBYSlZCQ2Z4cHFHZWVsMkFEenhaT05r?=
 =?utf-8?B?U28vOUNkaDAvTFdBTjhwNjVQVVVWSytIa25pK25nM3d5d1k2b2lxbERQbVV6?=
 =?utf-8?B?ODdZNGszZ25aRXVDL0FVc2R2U1lxdDhlWnc0NGJsbDFjZTVyR3pUblo1VkNt?=
 =?utf-8?B?ZTRIaHZhYUg4dU9nT3JOai9XL3FTTFpjOVd3MDJ0d2dya1cxYnZ4eXRZcERv?=
 =?utf-8?B?Z0RVWlRRZDd1VStuQWdhcnpZTXBxbTA2TkNGYks4RWVDNTNOVTdneGdJdlFY?=
 =?utf-8?B?NnV0QkVIODR4S08zMURqUGlDL29QbE5sazhYSlp6REd5NkhuczltZ2ZTNVFG?=
 =?utf-8?B?ZUk2Y0xQZ0pZK1M1eFhFS1phc3E0NUVpTDhZTkJIcDNCOHdPbFowWVJFQVpy?=
 =?utf-8?B?QXFxa0tYL2IwOGsvREo4aUtoSkVYSkZ5SWRLTzI2dDBhczU1VGdtZzRSRmIx?=
 =?utf-8?B?QlI3UTZvT2xpb1dPNkZpTmMvVlljbitFbjl0OVg5UE5tZDI2SnlIWFRMdzNz?=
 =?utf-8?B?aEgyZkpuT0hJVVJZOTMyZVErS3FFeWVZaEN2YWRyQzlZS253TGJmSE1YQzlp?=
 =?utf-8?B?ZXlUb1BVMjJOZ0hFSnN3UTFHdDRGU2hjSGd0YnBGM0tBT2MydnhHRFQzYUNt?=
 =?utf-8?B?dnJhTjVuUC8rVUhIQmZQNXZ0d3BESjBnV2dIeHo2cWhTS2Z5UUE0dVM2Z0V2?=
 =?utf-8?B?Q1RWUUU4WDN4aThYWWJGd0Zna0o5SXJTMm5XNXFrWUlHTU1zbXVWd1Rpb1hq?=
 =?utf-8?B?S2wzSnljd0Jaa0llMlkxK0xuNE9lbEc3NDZrNXU5LzdwZjB1d3RzaXdKZHRS?=
 =?utf-8?B?ZXFXZGk1OE5YdUhEcE1rL1p1aDVyNkE1a2hoNnFGM01FVGQrMVJZQjF4OGR0?=
 =?utf-8?B?eTczdGpScmN0Qm1haTg4UzVFcitVS0lYdTRoOHl6ZThJR3FPRUFNaXpaMk1U?=
 =?utf-8?B?UHBTckdmSGR6RXdDbGJwVlNraXZmZklBVjBGd0k1aXNkM0NUelNwc2RRMU9h?=
 =?utf-8?B?d3BheGE1Ykt5SytrcVA5RGErN2hpYU96ak5LOFRVWUlwK2IwYjlJYTRKSUJq?=
 =?utf-8?B?dGR2SXJ3Tkw2UjA3VDJjbWZ6TXFMTlYzc01RNUViVUp5aEVnRzBjWDMwVXU4?=
 =?utf-8?B?cDk2ejd1YWx1QkFhdXc1WU94dE15enNTUmdxV2NJTEM2bUlZR2wzc2dPa3ZV?=
 =?utf-8?B?UFhMOGJ1ako2K1hVNW9EZUpNUDFBMXA0aXc1MUMvRUkrRmdoakUvTnVoV1dv?=
 =?utf-8?B?aEI3eFlnOElNVUk4TUd3MzN2bXB3dVBrL2tOSWZmRFlmcnZjZHlqN3BmVlpU?=
 =?utf-8?B?Q0NZU3F6QWRReTdQS2N1Y2NzZ1pLTnI5aUNhMnBNTlpLZEU1aGJVMFNqYXZX?=
 =?utf-8?B?UmJKR2hmNUZFVXlCUUo4RVZnNHMxWjdEZ0s2OVd3c3MwaGhua2NLK3AwNGFn?=
 =?utf-8?B?elBjQWN6bU1LZ0pqVnRGdm95by80R3JGSXF4eE55bkZ6Z1U4WXU2aGVKTlc2?=
 =?utf-8?B?N3V4TjJIWmlldUt3c1BxZjh5bG9DaU8vOU5obmx0SDY0eFRvcW1zeWhQS0tJ?=
 =?utf-8?B?cDlQT1BNME1xRnZHbHhCZWhaaGtBenpVa0pUc3U3NGxob05CRFlwZUNPclFC?=
 =?utf-8?B?bUdhcURpenZVVkl0dFVnODN0UUlTcU1zNkpmcVpmNUVaWUpUVHkwbWZLNHJQ?=
 =?utf-8?B?RUxERkI4UzkwQ0tONGNIblpqUnJGQVY5VFJwbmJlRlhsblZKdXdGQUlYYWxv?=
 =?utf-8?B?bzA0aFRpNkNvbllIMW5udld4eXVJaDJ0cXRQd2p6SUs2YzRpbUxWc3VYb3Uw?=
 =?utf-8?B?UFhuSUZWeWViQkVmSlRwNnZmaUZwVk1hNjcvYk9DSTFQb0cwbE03cW5pTnI0?=
 =?utf-8?B?cXpoTHYrU1hkVnRzNmw4aGN2V21WbThRZWh5ZFE2ODdkd1NzREhaUld4T002?=
 =?utf-8?B?alVhWmNtajJDMi85aEVtZzV4VGFZbjV2bVZ3Q0VpNGRiendOUGJ1ZldYS0ZN?=
 =?utf-8?B?VTFVM2ZuSVEwS0NHYXpwaFRtUXFHdUJiNzRzY3Z0bzJWODlSQjVBb2dRQndx?=
 =?utf-8?B?bDZMYVd6ckVUWGVDQ1RaZkx6RGREanlzVU1mbTIybnhKRzRyNzZNb0NhS05J?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 203d5042-74ee-48fe-d567-08dd6b7bb99a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 09:02:09.9023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBsvvsLQLMKp/5XlSMaWGxljUr6OXaPnQ3WyTTCH9eML9V8dcHNqpvAmdUhShv7c8x2Wm+DM3+tB6881ZsXLfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

Hi Nemesa

Test seems to be failing on LNL 
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12780/shards-all.html?testfilter=odd-panning
Please check.

On 05-03-2025 08:47 pm, Nemesa Garg wrote:
> This feature creates a NV12 plane having two framebuffers
> and moving it to odd position and then do continous flip
> along with the change in the width of framebuffer.
> This is to check whether panning at odd position is
> supported or not.
>
> v2: Add test in kms_plane.[Swati]
> v3: Remove extra parameters[Pranay]
> v4: Add a break condition in loop
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   tests/kms_plane.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index b9bf025bd..e4555e932 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -88,6 +88,15 @@
>    * @format-source-clamping:          with source clamping
>    */
>   
> +/**
> + * SUBTEST: odd-panning
> + * Description: Verify that odd panning in horizontal direction for planar format
> + * Driver requirement: i915, xe
> + * Functionality: plane, panning
> + * Mega feature: General Display Features
We have dropped Test category and Functionality. Please remove them from 
documentation.
> + * Test category: functionality test
> + */
> +
>   /*
>    * Throw away enough lsbs in pixel formats tests
>    * to get a match despite some differences between
> @@ -100,6 +109,9 @@
>   #define CRTC_RESTRICT_CNT	2
>   #define SIM_CRTC_RESTRICT_CNT	1
>   
> +#define PLANE_WIDTH 810
> +#define PLANE_HEIGHT 590
> +
>   typedef struct {
>   	float red;
>   	float green;
> @@ -1330,6 +1342,89 @@ static bool is_pipe_limit_reached(int count)
>   		return count >= CRTC_RESTRICT_CNT && !all_pipes;
>   }
>   
> +static void
> +prepare_planes_panning(igt_display_t *display, const enum pipe pipe_id,
> +	       igt_output_t *output)
> +{
> +	igt_plane_t *primary;
> +	struct igt_fb primary_fb_1, primary_fb_2;
> +	unsigned int fb_id_1, fb_id_2;
> +	int j = 0, ret;
> +
> +	igt_output_set_pipe(output, pipe_id);
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	fb_id_1 = igt_create_pattern_fb(display->drm_fd,
> +					800, 590,
> +					DRM_FORMAT_NV12,
> +					DRM_FORMAT_MOD_LINEAR,
> +					&primary_fb_1);
> +
> +	fb_id_2 = igt_create_pattern_fb(display->drm_fd,
> +					800, 590,
> +					DRM_FORMAT_NV12,
> +					DRM_FORMAT_MOD_LINEAR,
> +					&primary_fb_2);
> +
> +	igt_assert(fb_id_1);
> +	igt_assert(fb_id_2);
> +
> +	igt_plane_set_fb(primary, &primary_fb_1);
> +
> +	igt_plane_set_size(primary, PLANE_WIDTH, PLANE_HEIGHT);
> +	igt_plane_set_position(primary, -501, 200);
> +
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	do {
> +		if (j % 2 == 0) {
> +			igt_plane_set_fb(primary, &primary_fb_1);
> +			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
> +			ret = igt_display_try_commit_atomic(display, 0, NULL);
> +			if (ret == -22)
> +				break;
> +		} else {
> +			igt_plane_set_fb(primary, &primary_fb_2);
> +			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
> +			ret = igt_display_try_commit_atomic(display, 0, NULL);
> +			if (ret == -22)
> +				break;
> +		}
> +		j++;
> +	} while (j < 20);
> +
> +	igt_assert_eq(ret, -22);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(display->drm_fd, &primary_fb_1);
> +	igt_remove_fb(display->drm_fd, &primary_fb_2);
> +}
> +
> +static void run_test_odd_pan(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +			prepare_planes_panning(display, pipe, output);
> +
> +		if (pipe == 0)
> +			break;
> +	}
> +}
> +
>   static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   {
>   	enum pipe pipe;
> @@ -1408,6 +1503,10 @@ run_tests_for_pipe_plane(data_t *data)
>   		run_test(data, dynamic_test_handler);
>   	}
>   
> +	igt_describe("verify whether odd panning is supported or not");
> +	igt_subtest_with_dynamic("odd-panning")
> +		run_test_odd_pan(data);
> +
>   	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
>   	igt_subtest_f("planar-pixel-format-settings")
>   		test_planar_settings(data);

