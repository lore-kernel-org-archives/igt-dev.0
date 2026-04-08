Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92B5FD5F94
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 07:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC6C10E2A3;
	Wed,  8 Apr 2026 07:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvkDLOGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B13510E2A3
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775634629; x=1807170629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GGbUgpJTlXmJyBWXFJp803xFpvxHPp4QqQBYFcrMUVo=;
 b=NvkDLOGPIPfH2MEB/rI1I1yCLHQFr75cUybttxFoqkw1uqDqoypXhWo4
 YnQFzGRdbQbIynU4ytEu/sFgdxqa8qsjuN0UMkTNBqMNQj2/2nc2oNz79
 Am3CL72sAUpHwKczj6+VIjjurVVMjL5RxzeVmNCBrLdhavT/YZnMB2JVY
 eG09X1t8Km+U77XRiBE7ki7hz9jFxZP1IKsHMAUXpOgzkpp/kcjLFX0JK
 mYTAT/+JcEG82Z52ZUTZApugz4LUnwWKk/hhYat0QhvEgAGJ9UGzVqt4I
 PntgOgpNZ5HvlNxBgO0FYnN+NaqejqLICX2ZCOY3TRgSnTXeFW7qyEqlB g==;
X-CSE-ConnectionGUID: oR4JjFbARECdi4fVy0x5OQ==
X-CSE-MsgGUID: NcqmR7FvTkeYzjXX87GNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87308716"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="87308716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 00:50:27 -0700
X-CSE-ConnectionGUID: kQXn0Z2/T+ibyqUqiIFG0Q==
X-CSE-MsgGUID: sGUXvt9XSHegFoTEUN5FtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="223636922"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 00:50:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 00:50:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 00:50:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 00:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJadJOa2QphSHCNn0Sd+m9MuiGHFz1sXhqzh9k1MPzXcxpJXwZWxipk+tBG1VDJ7d73W1FBBuQBMYpny6SEfKjzTElpYwL5SBN15NfXgvw22p725z6yRlt2/95qC9NMXZ/ZEHBOHlrlOpRTuGjetVCFj/hYmBmKKxyyKYlBDvBn+tH6rlWZomeWHze/RJwZBjsjpMp134F7mlZuPfIpo/ttknZZwNaLpWVa8bAjju1Bg7oNPVrF/RTKZW4LJk4gXbgkQYMa4wI7t8i3fX8E94Q5/VFsZbT/pQlIJpTTRvYp65jYuUG7V+kqvkLq1VOsnNsE/bybgLD3aIWupvl0bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OepJp77ClXsCNdpTMPTlCJxZTNgRrll7cBQO58bNYYs=;
 b=WuEbC67kuLa0NVQ7ROzY+/KmvkX3dm3EvVhrEFi8JfSak8sX0bWRe6tOZcBIq7g4kLRSMFpM4780Y2xNFlv748llUyJKlklARGdZXp+aE12RWWfuhJ8R/YnS/ryAm0f1sDaNmxOqnsqoccm3kOpSmlnRHNfFvDiTp6K8eqzLpJ6Nckroy0MHn16DHxoYOkh94M/1fM2IoiRpNpU3u7wQBnw/7WbzmH4tEdrSnjfjUJX47gaGQ7+7v6+eeuRuWurrEhiRQ0yDxV4Q4Rof7eGqg0OjI9OW1LZ/DkwuBCC+pO5Ku90Ydu/c/fIKfwct7VQSFIHO2/lI+e6HPynZUoTGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 07:50:14 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 07:50:14 +0000
Message-ID: <ba0b9f73-db89-4845-aecc-8c8fdf037ba4@intel.com>
Date: Wed, 8 Apr 2026 13:20:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 4/5] tools/gputop.src/gputop: Add support for
 per-engine busyness monitoring
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <tursulin@ursulin.net>,
 <lucas.de.marchi@gmail.com>
References: <20260406060428.2734117-1-soham.purkait@intel.com>
 <20260406060428.2734117-5-soham.purkait@intel.com>
 <e9d47e1d-138e-4742-9ea2-abe21a071c8c@igalia.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <e9d47e1d-138e-4742-9ea2-abe21a071c8c@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 99654f7c-2d5e-4cfd-84db-08de9543780e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: YNwy/iaDarUW7OP+obouxGGBYw9flbH8CVA9NYsqzqASYZZ62JHTU9hbVX/V4g+uv6eGYHJKBlw/hlfBaeh891J1Dhze2cHHWeHe292Dyd3xi83xyxHKL9Mu9pQTAEZyhErCHHf8Jci4qGwqJDeFrTs63DzFKcLzDQGK+YM9/wsqYrglWdecag3Zhq56MOePdzR4fPdBC0YdvWjxnNFBY6wI4PBc/gpz/uZSlMwS92WnQ7HmVnUGkRnKd8wN8ZERmwKxO4Co/6V2/3ERCZ/Hamrftvli9PU0oBrOisbIpozwAgU/tODkbvebNHi/z0N9lhkOSGPOUetIX8GZovHhpKDIee/Bl583Nru90PmksRPCdfx3ZsEn8Wa4BfI2C1sjDT5+liot/aai1jKzXFJ5mjJ7zlZyERkhDNSFONAfeA2g9/phcqnSfX175yhenc2hp3/2K2PGalKC1LKZEic8FyzLuU8f6nT/E+Fb7581+2UwTgYsQOsBCLPWPUpsVScEaav5Enw939Dd4Kz/0ZdK44CLMxXQNvugfwhuWidC7enXfpSG9WykuXpRg6rFlGtFyA94A62w1cudHZ3o1tJXFWa89SaAY1P4Tat8dvvJ9QwN+F2U5Xc8D5dDxKK7ekKENmGTD8DL37pLAP4brX8UfgDq6qlZeYmiCM5eRXFR0rNNcYaLLCSC1/cMiy6K/kZdSdOLa3zjSp6DERCB8/UlL2oeOwecxzv55r1iO1HQZ5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3cvS1Z4bnF6TG84VjNyU0xneHp2NWtRSzAvZDYxc1lhaGVWbmRCVzZ2QVdl?=
 =?utf-8?B?RlhiT3U0bnpnMVp3M1d2MmZrSnBWNE8wOVk2VXdBQXlpbnhBd1Z3YVhrb1E1?=
 =?utf-8?B?ZTByMXJZVEFPbHFhMVlkLzd6eGlkMHVRNGgwTEI0bS9LaXB1dXdQVE9oSXEv?=
 =?utf-8?B?VTlpeVA0Q2RMM1Y0VzRJR3hYOFZDbE9BTDRyUUorZ1NPaUVxWUUvVnNTOExU?=
 =?utf-8?B?azFuekNxMnFxbWhQYk8zN2Y4bVNpdWxVZXh4VlUxWjNGRnU4MmMxbUh4RGc2?=
 =?utf-8?B?ZWpmT2lxVWtBZzYzbkxFSFNIQ3VVbS9YYWd3cUJpektOVndrVUZtOGRWRm9q?=
 =?utf-8?B?Tk9PMFB4MVRJVngwRWl2dXdtSVltTGZSZFp3dXlEVkhGL1VEbzhjVHZmRlNE?=
 =?utf-8?B?bW9MZWJWb3JIYlJRc0Nsc3QzRk1QVXBwNDBBaXBtS0tQWnI5eTlLaDMzaXRk?=
 =?utf-8?B?SWNSSmR2RHVXTjR3dHhjcjJPWUpWcjZBeExWeWN1Mi9XK0xRT1FyMjF2MDhl?=
 =?utf-8?B?OGtrTHFjT0JHeStVOThUK1Z4UkRhcDlRY0dwenBHOW5wREJPMVhUNGRBdEN3?=
 =?utf-8?B?eHJlU1NvSy9nSVk5NzlhVktPZFQ0dVR2SzRocXlOU3JuWU0yVFBuLzkvbnVo?=
 =?utf-8?B?d2w5SDhQd1Ntcis1eXQ1cVhPbklCWDBzTUFnN2pBdDdRTTh1ZXhTRXo4N2Zh?=
 =?utf-8?B?aS9LdkdaRk55WC9HZUpId1pvOEl4STVjZkhLRnd0VWdzRnNZYkJGaTRoTGZm?=
 =?utf-8?B?czZGWmI5TEVsWVZidTBrK0VUdUQyZytjcjRYWXhjaTdmcDRteWZEcnBseFhz?=
 =?utf-8?B?aXMyeXB1R1BxVElySHVSc1BNaVM4VXE2b0xMOGRBMWt6U05GRU1sWXNCUGpU?=
 =?utf-8?B?bkhLNjhaanFiWlQ2OWdVREpYTTZjdGZKM014aU9ZMzl4Z1pEbjV2VGY1N3kv?=
 =?utf-8?B?MDF6anRHZkh1UHBkcWxJaFdzL0o2dkNYMElIVmlBdkpZNUV5TjczWldwN0Qy?=
 =?utf-8?B?ZDFuRzJFSXFMUDdDSU9GbUpFZ3dQZlR6SkVyc1RUamt6MVJYT0FnaTNEWnZZ?=
 =?utf-8?B?cTFLZm93WGQzdm41VVg0NWVjbWU5YVNpWFBwS2hOQ0ZtcjJ4ckYrbWJRNkZS?=
 =?utf-8?B?azM0U1Y0V3dUK3Z3N1lIaWNPZWE3VnE3VU9jR21BUlRUVDZLUXdIdERWZDkr?=
 =?utf-8?B?TnZPT3ZiQnF6aXhaNXlSUk1na3hubm9CYmlIbGJKMXN1VjRxRk9ZQityWnI3?=
 =?utf-8?B?NkFId3djUGNQL2s2d29rWmlRYU5CbmVXTHJtMjlJaDRmMWVlN3BZQUJ3WTJu?=
 =?utf-8?B?NnFjSTRLTFFwb2x5Ym9QdmRpK1N5TnFMb2dUNi9lbDFKQUFLQmZiMml2Q3p6?=
 =?utf-8?B?ell4WjUxZEtxQkIxYnR2VEdOYlNQQ3owMGhQS3gyenlScmJ4ZWVBaUhvMGF0?=
 =?utf-8?B?WlBLdUkyL1hQT0grcExRRFI0MFcybVlPalM0ZWxtS0FubzV1bGNzbjZKbWti?=
 =?utf-8?B?RzJGWnVpL2lSZUdzU3Zwb3ZORVdYTFo0Vyt6dHJqa3VnelNzUkhYbzlSZkRH?=
 =?utf-8?B?QkNSanJDWkNsaktLQU9TWUxEem5WZC9SOVdqUFptRmN1WkhBL3lmdktnQ04y?=
 =?utf-8?B?SHhrRFJMc1BIMTVmWVZ3TUdCeFpzVHY5U0JheWQ5UHJtakx3Vk9hVzRZRDZZ?=
 =?utf-8?B?SXFUZE5DcWJTWGRwYnFjYWJrdEJ3L21zbzhYeFcyVWtwTGlaS21WaUJ0RjNW?=
 =?utf-8?B?TmU1RmdDTExmblZMaXc1VUdDbjFnb1RWZ3JQZGF1L21oY2pOYWxVUjArdGta?=
 =?utf-8?B?UElrSGhRY01zcWZhQVNvaG1lRzZJQ3RiYjYxVU5malVpWnJsaVgrb3I3bkN2?=
 =?utf-8?B?SnFFZHI5NDVxb2pLcVFJUGRDblRNaFF4TXc5Y2hVa3NqMk5BS3lwcnFhVHdF?=
 =?utf-8?B?bXBFTkhsdFVMdXZoSi9IcUw0TjhTZzVNMC9RbThRYXFhN3haRUM3LysrQTNG?=
 =?utf-8?B?WTV6azlNUGkycHRoRm14bFl3anE0cWNlZmFkeTlobDJjWkF1TTlMaGdTbkJ3?=
 =?utf-8?B?bUEwY2VJd21kTkZIQzBSYnR6UjNvTzNOWmVBanFrNEp4ZWoyU29EUmU2d3dK?=
 =?utf-8?B?N2Z5WHVWN0tJZWIvRGlUaWRuT2E2SFNxVUhPQUx3YnpOQmlUQXIyK3NKTzA3?=
 =?utf-8?B?ZmJRV1pHUnJldGZVakltVURWMCtBSnlpZ3gzL1Jkc1pOOVJrenZ4OEV4cEYz?=
 =?utf-8?B?ZHR5Vms4OEhReTkvemxxQnN3WWt2MVBENm5uR20xTVdURjRHZUlRU09VclZU?=
 =?utf-8?B?anpZZWtPa0lmM1VaN1JZdkhTenVwNGIvT0NEWjIwS0kxVVlVTkxkb0JBVmtl?=
 =?utf-8?Q?EEqExUfv8rd4tA0k=3D?=
X-Exchange-RoutingPolicyChecked: QmUqIIYQs1CqElE6McFyrHWSOE4EG3Ints9cnUoF+OS57KGStYObTcIY/OgNpvah5oMRI6Bqp/IJsMd+XG/CiMvrzrSe0x7LH+D16XzTHJHDZNGtJMLeVvMEYlcy/CXYDYai3dZeC/OFLYSaD98X2JcfnMP/pwfzJt7Zt8ugViu28RJk98NtZbR53qIwYaDfEAwcvOcN2bxyJsHPlTajJxmzGR0VGngYgnFOguGk7L2CaxHS8vH/AOq0byiAKivcjaw4smTNMGxhODpi4BGFToNAmzh+i4S3Zon/0vplTTA+XA/LEv19LDiqpHLfFptlgfYDPnHoDTp1SguXpcruWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99654f7c-2d5e-4cfd-84db-08de9543780e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 07:50:14.4364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5lS7AOWOKeTzktimoObBHc7yzmXh0uXiG8xa8IH5Ztk6RDM38D/oGCoxmAiwQfcxP7xpr4DlmaAwWpGe7iTrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

Hi Tvrtko,

On 06-04-2026 14:34, Tvrtko Ursulin wrote:
>
> On 06/04/2026 07:04, Soham Purkait wrote:
>> This introduce support for monitoring per-engine busyness in gputop,
>> extending existing per-client monitoring to handle multiple GPUs, when
>> present, including support for multi-engine instances, enabling
>> finer-grained engine busyness reporting.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v3:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>>   - Remove unused dependencies and headers. (Kamil)
>> v5:
>>   - Replace hardcoded values with Enum for driver number. (Vinay)
>>   - Rename driver_no to driver_num for better readability. (Vinay)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop.src/gputop.c    | 305 ++++++++++++++++++++++++++++++-----
>>   tools/gputop.src/meson.build |   2 +-
>>   tools/meson.build            |   3 +-
>>   3 files changed, 268 insertions(+), 42 deletions(-)
>>
>> diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
>> index 9b2e8cb6f..479897f40 100644
>> --- a/tools/gputop.src/gputop.c
>> +++ b/tools/gputop.src/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2026 Intel Corporation
>>    */
>>     #include <assert.h>
>> @@ -14,22 +14,71 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>     #include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>>   #include "igt_profiling.h"
>> +#include "xe_gputop.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support 
>> for the
>> + * new driver:
>> + * @drivers: Update drivers[] with new driver string and so the enum 
>> drivers
>> + * with the new driver entry.
>> + * @sizeof_gputop_obj: Update this function as per new driver 
>> support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type 
>> "struct gputop_driver" with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +    "xe",
>> +    /* Keep the last one as NULL */
>> +    NULL
>> +};
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence 
>> as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +    {
>> +        xe_gputop_init,
>> +        xe_populate_engines,
>> +        xe_pmu_init,
>> +        xe_pmu_sample,
>> +        xe_print_engines,
>> +        xe_clean_up
>> +    }
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which 
>> keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
>> +    {false, 0, NULL}
>> +};
>>     enum utilization_type {
>>       UTILIZATION_TYPE_ENGINE_TIME,
>> @@ -37,50 +86,84 @@ enum utilization_type {
>>   };
>>     enum intel_driver_type {
>> -    INTEL_DRIVER_I915,
>>       INTEL_DRIVER_XE,
>> +    INTEL_DRIVER_I915,
>>       INTEL_DRIVER_UNKNOWN,
>>   };
>>     #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>>   -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", 
>> "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static size_t sizeof_gputop_obj(int driver_num)
>>   {
>> -    unsigned int i;
>> -
>> -    for (i = 0; i < n; i++)
>> -        putchar(' ');
>> +    switch (driver_num) {
>> +    case INTEL_DRIVER_XE:
>> +        return sizeof(struct xe_gputop);
>> +    default:
>> +        fprintf(stderr,
>> +            "Driver object size does not exist.\n");
>> +        exit(EXIT_FAILURE);
>> +    }
>>   }
>>   -static void print_percentage_bar(double percent, int max_len)
>> +static void gputop_clean_up(void)
>>   {
>> -    int bar_len, i, len = max_len - 1;
>> -    const int w = 8;
>> -
>> -    len -= printf("|%5.1f%% ", percent);
>> -
>> -    /* no space left for bars, do what we can */
>> -    if (len < 0)
>> -        len = 0;
>> +    for (int i = 0; drivers[i]; i++) {
>> +        ops[i].clean_up(per_driver_contexts[i].instances, 
>> per_driver_contexts[i].len);
>> +        free(per_driver_contexts[i].instances);
>> +        per_driver_contexts[i].device_present = false;
>> +        per_driver_contexts[i].len = 0;
>> +    }
>> +}
>>   -    bar_len = ceil(w * percent * len / 100.0);
>> -    if (bar_len > w * len)
>> -        bar_len = w * len;
>> +static int find_driver(struct igt_device_card *card)
>> +{
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (strcmp(drivers[i], card->driver) == 0)
>> +            return i;
>> +    }
>> +    return -1;
>> +}
>>   -    for (i = bar_len; i >= w; i -= w)
>> -        printf("%s", bars[w]);
>> -    if (i)
>> -        printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +    struct igt_device_card *cards = NULL;
>> +    struct igt_device_card *card_inplace = NULL;
>> +    struct gputop_driver *driver_entry =  NULL;
>> +    int driver_num;
>> +    int count, final_count = 0;
>> +
>> +    count = igt_device_card_match_all(filter, &cards);
>> +    for (int j = 0; j < count; j++) {
>> +        if (strcmp(cards[j].subsystem, "pci") != 0)
>> +            continue;
>>   -    len -= (bar_len + (w - 1)) / w;
>> -    n_spaces(len);
>> +        driver_num = find_driver(&cards[j]);
>> +        if (driver_num < 0)
>> +            continue;
>>   -    putchar('|');
>> +        driver_entry = &per_driver_contexts[driver_num];
>> +        if (!driver_entry->device_present)
>> +            driver_entry->device_present = true;
>> +        driver_entry->len++;
>> +        driver_entry->instances = realloc(driver_entry->instances,
>> +                          driver_entry->len
>> +                          * sizeof_gputop_obj(driver_num));
>> +        if (!driver_entry->instances) {
>> +            fprintf(stderr,
>> +                "Device instance realloc failed (%s)\n",
>> +                strerror(errno));
>> +            exit(EXIT_FAILURE);
>> +        }
>> +        card_inplace = (struct igt_device_card *)
>> +                calloc(1, sizeof(struct igt_device_card));
>> +        memcpy(card_inplace, &cards[j], sizeof(struct 
>> igt_device_card));
>> +        ops[driver_num].gputop_init(driver_entry->instances, 
>> (driver_entry->len - 1),
>> +            card_inplace);
>> +        final_count++;
>> +    }
>> +    if (count)
>> +        free(cards);
>> +    return final_count;
>>   }
>>     /* Get the correct sysfs prefix based on DRM minor number */
>> @@ -526,8 +609,31 @@ static void clrscr(void)
>>   struct gputop_args {
>>       long n_iter;
>>       unsigned long delay_usec;
>> +    bool verbose;
>>   };
>>   +static void countdown(const char *msg, const int start_sec)
>> +{
>> +    struct pollfd pfd;
>> +    int i, ret;
>> +    char ch;
>> +
>> +    for (i = start_sec; i > 0; i--) {
>> +        printf("\r%s%d... second(s)", msg, i);
>> +        fflush(stdout);
>> +
>> +        pfd.fd = STDIN_FILENO;
>> +        pfd.events = POLLIN;
>> +
>> +        ret = poll(&pfd, 1, 1000);
>> +        if (ret > 0 && (pfd.revents & POLLIN)) {
>> +            while ((ch = getchar()) != '\n' && ch != EOF)
>> +                continue;
>> +            return;
>> +        }
>> +    }
>> +}
>> +
>>   static void help(char *full_path)
>>   {
>>       const char *short_program_name = strrchr(full_path, '/');
>> @@ -541,18 +647,47 @@ static void help(char *full_path)
>>              "\t%s [options]\n\n"
>>              "Options:\n"
>>              "\t-h, --help                show this help\n"
>> +           "\t-v, --verbose             wait 5 seconds before 
>> starting client-only busyness in"
>> +           " non-root mode if neither CAP_PERFMON is set nor 
>> perf_event_paranoid is"
>> +           " permissive.\n"
>>              "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS 
>> [.TENTHS]\n"
>> -           "\t-n, --iterations =NUMBER  number of executions\n"
>> +           "\t-n, --iterations =NUMBER  number of executions\n\n"
>> +           "Running without root:\n"
>> +           "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid 
>> is required to\n"
>> +           "\taccess engine busyness\n"
>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>> CAP_PERFMON):"
>> +        ANSI_RESET "\n"
>> +           "\tcd /path/to/igt-gpu-tools/\n"
>> +           "\tsudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop\n"
>> +           "\tsudo sh -c \"echo $(pwd)/build/lib > 
>> /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +           "\tsudo ldconfig\n"
>> +           "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET 
>> "\n"
>> +           "\tsudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop\n"
>> +           "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +           "\tsudo ldconfig\n"
>> +           "\n"
>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>> perf_event_paranoid):"
>> +           ANSI_RESET "\n"
>> +           "\t\033[32m# Save current perf_event_paranoid 
>> value\033[0m\n"
>> +           "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +           "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET 
>> "\n"
>> +           "\t\033[32m# Restore original value\033[0m\n"
>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=$orig_val\n\n"
>> +           "\tFor details, see 'Perf events and tool security':\n"
>> +           "\thttps://www.kernel.org/doc/html/"
>> +           "latest/admin-guide/perf-security.html\n\n"
>>              , short_program_name);
>>   }
>>     static int parse_args(int argc, char * const argv[], struct 
>> gputop_args *args)
>>   {
>> -    static const char cmdopts_s[] = "hn:d:";
>> +    static const char cmdopts_s[] = "hvn:d:";
>>       static const struct option cmdopts[] = {
>>              {"help", no_argument, 0, 'h'},
>>              {"delay", required_argument, 0, 'd'},
>>              {"iterations", required_argument, 0, 'n'},
>> +           {"verbose", no_argument, 0, 'v'},
>>              { }
>>       };
>>   @@ -560,6 +695,7 @@ static int parse_args(int argc, char * const 
>> argv[], struct gputop_args *args)
>>       memset(args, 0, sizeof(*args));
>>       args->n_iter = -1;
>>       args->delay_usec = 2 * USEC_PER_SEC;
>> +    args->verbose = false;
>>         for (;;) {
>>           int c, idx = 0;
>> @@ -573,6 +709,9 @@ static int parse_args(int argc, char * const 
>> argv[], struct gputop_args *args)
>>           case 'n':
>>               args->n_iter = strtol(optarg, NULL, 10);
>>               break;
>> +        case 'v':
>> +            args->verbose = true;
>> +            break;
>>           case 'd':
>>               args->delay_usec = strtoul(optarg, &end_ptr, 10) * 
>> USEC_PER_SEC;
>>               if (*end_ptr == '.')
>> @@ -610,9 +749,12 @@ int main(int argc, char **argv)
>>       struct igt_profiled_device *profiled_devices = NULL;
>>       struct igt_drm_clients *clients = NULL;
>>       int con_w = -1, con_h = -1;
>> +    bool is_root;
>>       int ret;
>>       long n;
>>   +    is_root = (geteuid() == 0);
>> +
>>       ret = parse_args(argc, argv, &args);
>>       if (ret < 0)
>>           return EXIT_FAILURE;
>> @@ -621,6 +763,62 @@ int main(int argc, char **argv)
>>         n = args.n_iter;
>>       period_us = args.delay_usec;
>> +    populate_device_instances("device:subsystem=pci,card=all");
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (!per_driver_contexts[i].device_present)
>> +            continue;
>> +
>> +        for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +            if 
>> (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +                fprintf(stderr,
>> +                    "Failed to initialize engines! (%s)\n",
>> +                    strerror(errno));
>> +                    gputop_clean_up();
>> +                return EXIT_FAILURE;
>> +            }
>> +            ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +            if (ret) {
>> +                if (errno == EACCES && !is_root) {
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    if (args.verbose) {
>> +                        fprintf(stderr,
>> +                            "\n"
>> +                            "Running without root privileges.\n"
>> +                            "Engine busyness may not be available "
>> +                            "without root privileges.\n"
>> +                            "See \"--help\" to enable engine "
>> +                            "busyness without root.\n\n");
>> +                        countdown("Resuming with only gpu client "
>> +                                "busyness in ", 5);
>> +                    }
>> +                } else {
>> +                    fprintf(stderr,
>> +                        "Failed to initialize PMU! (%s)\n",
>> +                        strerror(errno));
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    return EXIT_FAILURE;
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        for (int j = 0;
>> +             per_driver_contexts[i].device_present && j < 
>> per_driver_contexts[i].len;
>> +             j++)
>> +            if (ops[i].pmu_sample(per_driver_contexts[i].instances, 
>> j)) {
>> +                fprintf(stderr,
>> +                    "Failed to sample PMU! (%s)\n",
>> +                    strerror(errno));
>> +                igt_devices_free();
>> +                gputop_clean_up();
>> +                return EXIT_FAILURE;
>> +            }
>> +    }
>>         clients = igt_drm_clients_init(NULL);
>>       if (!clients)
>> @@ -642,22 +840,49 @@ int main(int argc, char **argv)
>>         while ((n != 0) && !stop_top) {
>>           struct igt_drm_client *c, *prevc = NULL;
>> -        int i, engine_w = 0, lines = 0;
>> +        int k, engine_w = 0, lines = 0;
>>             igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0;
>> +                 per_driver_contexts[i].device_present &&
>> +                 j < per_driver_contexts[i].len;
>> +                 j++)
>> +                if 
>> (ops[i].pmu_sample(per_driver_contexts[i].instances, j)) {
>> +                    fprintf(stderr,
>> +                        "Failed to sample PMU! (%s)\n",
>> +                        strerror(errno));
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    return EXIT_FAILURE;
>
> Imagine abstracting this all to a library akin to igt_drm_clients and 
> then both xe_gputop and intel_gpu_top could use it. Then the step 
> where latter would work with both i915 and xe could be very near, all 
> the code would be only in the new library and not duplicated, plus, 
> one day extending the support to a non-intel driver could be quite 
> plausible.
At present, the planned scope is focused on adding Xe support in GPUTOP 
and support for i915 will also be added in the near future if necessary. 
In addition, GPUTOP is designed to be extensible and can be adapted to 
support non-Intel drivers as well.

Regards,
Soham
>
> Regards,
>
> Tvrtko
>
>> +                }
>> +        }
>> +
>>           igt_drm_clients_sort(clients, client_cmp);
>>             update_console_size(&con_w, &con_h);
>>           clrscr();
>>   +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0;
>> +                 per_driver_contexts[i].device_present &&
>> +                 j < per_driver_contexts[i].len;
>> +                 j++) {
>> +                lines = 
>> ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +                             lines, con_w, con_h);
>> +            }
>> +        }
>> +
>>           if (!clients->num_clients) {
>> -            const char *msg = " (No GPU clients yet. Start workload 
>> to see stats)";
>> +            const char *msg;
>>   +            msg = " (No GPU clients yet. Start workload to see 
>> stats)";
>>               printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>                      (int)(con_w - strlen(msg) - 1), msg);
>>           }
>>   -        igt_for_each_drm_client(clients, c, i) {
>> +        igt_for_each_drm_client(clients, c, k) {
>>               assert(c->status != IGT_DRM_CLIENT_PROBE);
>>               if (c->status != IGT_DRM_CLIENT_ALIVE)
>>                   break; /* Active clients are first in the array. */
>> @@ -681,11 +906,11 @@ int main(int argc, char **argv)
>>       }
>>         igt_drm_clients_free(clients);
>> +    gputop_clean_up();
>>         if (profiled_devices != NULL) {
>>           igt_devices_configure_profiling(profiled_devices, false);
>>           igt_devices_free_profiling(profiled_devices);
>>       }
>> -
>>       return 0;
>>   }
>> diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
>> index ec39f4c7a..e95657fca 100644
>> --- a/tools/gputop.src/meson.build
>> +++ b/tools/gputop.src/meson.build
>> @@ -1 +1 @@
>> -gputop_src = files('gputop.c')
>> +gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 521607a4c..caca57d0e 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -123,4 +123,5 @@ subdir('gputop.src')
>>   executable('gputop', sources : gputop_src,
>>          install : true,
>>          install_rpath : bindir_rpathdir,
>> -       dependencies : 
>> [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
>> +       dependencies : 
>> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,
>> +                  lib_igt_drm_fdinfo,lib_igt_profiling,math],)
>
