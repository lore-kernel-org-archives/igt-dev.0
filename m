Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F7CD58D5A
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 15:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3110B10E0DE;
	Mon, 25 Nov 2024 15:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHUGDu7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1DD10E0DE
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732548471; x=1764084471;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=C3Ry0WCWhgoGKTnzYlEB6gZiz3FQpD462U3Fb1E6oOU=;
 b=BHUGDu7B3mjA54Io2fOPRS6xLx+MxwdiObAVneSZR15bNxLFxZEohEO8
 J7zPq+M3RQBdReN706sN2IjZWhBTbc1yUuWGAWjyp7iQdufEWWVlR9plv
 L8dO4sH08raUZ0zW410XzJfjbajVLV89KluYl9H5iWwMhOR5b5X5Kj2ld
 stIl3VhyAfO/t+DoPlMuRDN8Ea6HrIKt48lnrbvwcCh6By+yOOojQuzIa
 45FJFQwO5zkZOz2biKEkKFaSfG0I68oJCbDvMu8NwyfU5DiNowlsL0qWV
 xlJvROyvXCX8m4oasKJBsnBgde/3j0jNnIKRtFYlPe/L0Qx2LhtIxC1FR g==;
X-CSE-ConnectionGUID: GkNQh2SLSByUanxHYdwzRw==
X-CSE-MsgGUID: mtOlNcOxQ6WRrlDNfE5xEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32034804"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32034804"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 07:27:49 -0800
X-CSE-ConnectionGUID: uNB8V2YOQL6NAeVmHqF3kg==
X-CSE-MsgGUID: tzLX8IRTQSCYrNDrWfUzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="96210767"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 07:27:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 07:27:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 07:27:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 07:27:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq6/JmM4udb+oIp6z0kE6yWH4XBUeAx5I7JF55InuPbnf59JZeJB94BeiaFoeoM9ow0k9FjRExIaDVMCNNs8iGrWZVZDZg1ACi3wfdKtbzg1ze7yNCmNwpjiRUj9iTcoPHGoTLJ+TdzCTO4VqZlrYTI3kCrWYR7EqJ7XgbjB/EgEsYl/TSu/+6EHhmSQd5oD0f/EogCarUyPYyT2fjZCHUFYHnWKutxRXp8jJ102955Bc2KWbM8YqtnMqIMFkxjG90x9zV6LFMdEQf2kINmpS46Tf/eQIpvf1vKJHAaePbOhkOaW7uJ5YK5gxIuIa2F6kKkpsab3ysUpT5x7kr/vYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0ENA5gDsIjJph3+Aym5F2nk8bUfQWL0KmLUIRSaS64=;
 b=PM+w07OOCY+7Pn26hV6QC32fUd+7YA3y2DGmuwvYgIlR8oJBe4Vc4OlrJcCOW/qzOUmUwb6Qgw+RII6YWJk5Y+3JcGPB0rYKZ8a2UU9wlp4kbS3Lov/8a5fzP+GvTUqZNfOXUI2kUhljUN9mSqimAof2BcBAy84N00Z/mqYzqtcbPCjZyY6n6/1D68NT7gDUxqVCyen+p/WQxnLWcMvS3ImGqy2hkPiIPu33ukGOM7PT2GrEh39nZaoM3K5Mz+qhASgke5RuJu3r2vB3yC7L/R4hB4uL1cp7QR7R7xMcbeDxaBej3DE4NFPxIN6lvv/MmLFRJyTyu6RH0KuO9xrIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 15:27:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Mon, 25 Nov 2024
 15:27:45 +0000
Date: Mon, 25 Nov 2024 16:27:35 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fexec=5Fbalancer?= =?utf-8?Q?=3A?= Disable parallel tests
 on execlists (rev2)
Message-ID: <yjblbvxv3ng2txxtx3apaako7wfzaxybdgqhqc5c63pwrzwii5@lotfs5r5k7c3>
References: <20241016132718.36457-4-krzysztof.niemiec@intel.com>
 <173151303072.3666420.7969071230885702990@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173151303072.3666420.7969071230885702990@2413ebb6fbb6>
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH0PR11MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a25278a-d903-497c-f2a3-08dd0d65b5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VExJaG1QLzlvQ1p2d0NLT3RpbEJTeDQ1M0tuNzV1SEdhTHZWaEFBQ0o4Z3VW?=
 =?utf-8?B?eHc0b3psTnBXMDkrWFFjYWFzNUg4RmRzbDZQd3puS2pXK29IcENNK01wQ082?=
 =?utf-8?B?Zk9OVTkrWlpvZlRWR2FSZzhodUNqM29TR2Q4eFNDSXVzZHFIUUJrNC9PWjZ5?=
 =?utf-8?B?dURYUVVoQ1lKSnpvZDgxRDlBMkJsWHZVN3hOSW1MMTVlazZ4SGFUY2xOeHhQ?=
 =?utf-8?B?dE9QZ3pDTy9nUkdDYnJxVUNHWkxKV2RkRG5YQXJPU3VNMnBtMGFzamt4amlS?=
 =?utf-8?B?ZFJNQWIxLzl6R0NiWTB3TW01dm5UM3c2TE5idHFiN1JZK3kxdDJHSlVER3o5?=
 =?utf-8?B?QytIeFlaR0MrZXR6NU1YY2phaytQK3NxQ0tnczZYbW9TSmRIVFJucTQzdC92?=
 =?utf-8?B?QzdjQkxoRm5aV05ZODVvKzRZM1FGSXpQQW56Qm4vck82RnRaNXdZc28weFNQ?=
 =?utf-8?B?YXJBYkViY28zRExPQ2tJOEJvWEpoQXhnbUZsc2hLYTQ4WjRrQXNiSldWeVlO?=
 =?utf-8?B?RWhGRmMwYzc0d2RYWTFuQlhwOG03ZmhvaUFmV1hEa3kxTWVMWnh0WG9STk52?=
 =?utf-8?B?blVGQkppNWs4bGt4QmJoaWVYNk9LVTN2U2ozMHBxdHcvNWZ6aTV2VzBsNlY4?=
 =?utf-8?B?b2lXUzRlc3pxSU9vVGF4WkZDZHBtQUI0RGx0Z2VhaDFqSnVXQU5FMzB4empX?=
 =?utf-8?B?Z045RTJwT1hIS1J1VFRGemxwTWdGazRUWWpZdmhGbEdndFRFWEt1ZnZkT0Ji?=
 =?utf-8?B?QTVqdlBOQ0V0RFpLM05hYjN1TlRibGVwc0NLZDhNTUhMaEVVczQ3ZFgyZDJR?=
 =?utf-8?B?SmZaRGJZaitINHNrWTFpdVJuVm1VSllvUU1nZnJwVjNIK2xHWEgraHhwYkF1?=
 =?utf-8?B?aVF5NEtvTzZVWERmMDM5ZmNDR0lMYWJDMWxYcEhjVnlZSXVBTkREdk1LdURV?=
 =?utf-8?B?SWpBTEp5cVAxN0J4OUd3Sm9jODBDVWh0L1RSZ3VxSW9QOWhwMldCSkp2L1Fm?=
 =?utf-8?B?bmtLUVFqY2VNOEdYRDBKbVIvbGkzSCtWUEQ0TkFYdFd0WEhSZmpZQjIvSU1D?=
 =?utf-8?B?NjdsWjdsWlQ5MTNURUVPWkZpS1ZmTzNwZVVLOUZLdnZWVjFlb0NGMkw4MHRs?=
 =?utf-8?B?OHpKdS9IRjkzcTdDR2d4QUVQWDd4QmFhbkx4ZGlZVUt5eVRmdGJmUVVnYURL?=
 =?utf-8?B?eW55NFpBRHF3bXpxR3ltK2thMmVWUUlPcThvZi9uMGRJVjJyT09WZTJLT09K?=
 =?utf-8?B?UE9tL0traVVhY1dHeVRMTWdPRTJBUWRkbmhhUDJENm1ORlNiYXV1N0F3Rlc4?=
 =?utf-8?B?ZFppMnl4amtJaThLQy9lZmFQWHRXMXloalpBcW1jZjJNMENiU2JlZzdMMSt0?=
 =?utf-8?B?OWVjL1JOT3dhS3NnVlJoMGgvUGtYQ0xCQ0tuVHhrekEzaG5hR2hYRGxMbC8y?=
 =?utf-8?B?ajExTngyc1VTdGhWUUlvTDNhaVJKeml3VUkvTkRLSUFNLzAxbzArRjJFTDJ6?=
 =?utf-8?B?YlJOOEs4UG9QajZpWFJRMzZxR3k0UWdoSC8yN2Rja2k1VlEya3lFU0pnOGpG?=
 =?utf-8?B?RE9JZmpsMzhHWUhBTVZncFJEOEtqNTI2QnRWaUdhc0hoVHVkSUpKMFovaVRW?=
 =?utf-8?B?VkdoM1U1MGkyTmE3SGQvYUp1V3BTY3lXc3ltSG1xN1dUbXQweEtoS0xJV1BK?=
 =?utf-8?B?c25aaUhtOW1ScFJBZkRUZHBDcmY4aGdTM3B0T201R0o4di80RWZ4aU5TQnhF?=
 =?utf-8?Q?XzIipGo0UYRoObuUq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhCNFNUd2FLdzZhZEVvdkR1SnYycWVaeHhUOWNobzNpY3duNHpMZTBXQU8x?=
 =?utf-8?B?eWNRTmpjSUcvMkNHZHlBUDFCb0pQWFdsU2Z5cUNmZ1AwNCs0dGhlL1NLeW5P?=
 =?utf-8?B?TGZhMDhkZEY4Rjl5ZGVOZis4alk4clVGUitUT2tuTk5aMUFIa1hxbEo0eFVP?=
 =?utf-8?B?OXFnYzdwZmhaVmtweFFDa012UGt6R1NOY1lMbTc0WmZUOGlvTVN0V3J0NE01?=
 =?utf-8?B?TURtaU9TNU9laUxCR3BUWCsvK3gyVVcrL0p0bFZBQkxnd29mRHlwMEtBQVFU?=
 =?utf-8?B?a0FTMWVNaHM4d09JeVJhbEpwZzNScDZ2aGhCYk5JekFHTXQxNGl2RENWRTVx?=
 =?utf-8?B?NUNrcFQ1a1A1NVBTUndyZS84TTZOSzVxKzN6cjdPMXdGREUzcGxNeTBEUHJo?=
 =?utf-8?B?c3MyQVZPQWlUVXRpODVSNjk3UDloY3VKY3EzY2JlQkViZSsrSVZ6ZFRkQmlW?=
 =?utf-8?B?Wk9MVTlJeHJOdHloMjZpZ2dzaS9qcHhTaXhjc2tBM0FIenlIaytpN1RsdEpl?=
 =?utf-8?B?N2FuaGtZMXZkQ3hteW45bVNjL28zdnlQSFhYODQrTXdLcmxFTTl1dzMreDI4?=
 =?utf-8?B?M21kaUJJTGwySTFnaDFERHJxSTVsZ2xyVkJ1bFgvbzBTTHJoalNZK3dGR3VK?=
 =?utf-8?B?a0xmUW16ZWNBeFNZQ0M4aExmVEFGbEhqNTlCOFVOb3ZZcENWYnZZczZ1bklP?=
 =?utf-8?B?N2dtZXlsbVlOUnFTMFlZVDhaZzJyZ2oyRk96enZGQ3Q2QUt0K3ZQU21naURk?=
 =?utf-8?B?aWVjN1NqQVc1SXlTajJ6bC80dktrbE9SVWNWV0VKM1NvdWVOT3RKL21oUVlx?=
 =?utf-8?B?RFdQTU03dDVMQ1JsbVlOUmYrQllsQURFd3BsbGdReFVKOVdpSlNZLzNDQWVO?=
 =?utf-8?B?ZERpamVZWk1xNUpVNFdSOHNmcWdmWm13bndvZnplcnFUSVYvNlZqTi9UdStI?=
 =?utf-8?B?MEpsamFnVGpISExwNEdsN1hZMnZZN2xYNVFnQmY4T0F1UFRmQW43bTRjN2pF?=
 =?utf-8?B?alcwR3gzREJGd1BlR2VvYmc2Qkk1SWFVbU8vbCthdkhLc0F1d3J6cThabFBL?=
 =?utf-8?B?MnFlekVmdUtNVUNLUmlFSmp5bzJLOThUcUlRdTlrcUhObTNFd0I4RC9wbE9q?=
 =?utf-8?B?aUo5TkFoZlFYekUxTFBrWUJSemh5YkIwNXY2Ui8yOWpQVTdITlFyZjBMV1F3?=
 =?utf-8?B?YzV6ejh4UmZNU0tKS1dWSk9tY1NyUUZvS2JNczk4cjJkWkx4YWZZbDhrRnVH?=
 =?utf-8?B?aDZjY2svTkxneEtzTEw1MHRldzVkSFVnMVdVb0I5ZEhoSDBCWWtBNGdmd0k5?=
 =?utf-8?B?WEh0TG9GQjQrandvd3JPTENIbitxM1pIS1dMSURSM1NqMlhlbm9lNWYySERl?=
 =?utf-8?B?SXVDRE56Rk1YaExkMUlMN3RMOE9mQW95dCtTT0dmR1ltaTJRYUdkVk1Rb05y?=
 =?utf-8?B?dkJBekgxUkRVTW16cFI3OGJhTjRIUkhJUjkwTVJRaDlsU2RtcnJkUmpBVS9R?=
 =?utf-8?B?UFVqdkUweExCb3ZKQ0Q5cUdBVlYvT3FRRWQ0b3RKUXNNM0tQaDF0bkJMZU9y?=
 =?utf-8?B?Tk56KzlBeTdUYVVSUzk0UWM0c09iekxMRXBNSDlldzlSNmkrbFltaWNDcUFT?=
 =?utf-8?B?c3Y0SmVBdnVSNTZ3aFVSYmdvZzgxOElNRGpNeEdyYlV1V1Q4aDlnVFdQOXFn?=
 =?utf-8?B?R25EdWJEci8yTFdjai9WVVJTWnRhWjRhazE4am9tOXoyN1c0MURiTmpNVk1L?=
 =?utf-8?B?a2ljcENZdEZkczZkSDVVeXcrQmZ0bWFxc3NwVUxKd1JISW9MOGZ6Yk5qOHdC?=
 =?utf-8?B?cjN6RTJFN2tKVVU0anFDN1o1Q25iMlV4UmdMV0xzbGI3dnhDNWYvVVlsenhK?=
 =?utf-8?B?WjJISURDMndoSm5XNERITnBaeURRTWxLcDd6d0pYc0JOMTRPSXc2cEN4VWQ4?=
 =?utf-8?B?QXlsdEtzUmlIYkc3emVpbjdHeGd6WVBPeUhONkpQTVUwS3o2cys5SW9USUUz?=
 =?utf-8?B?WFduUXpOYjJVaG9ldEJrZ1NISm52K3YyYWlFNHIyRlF5S1ZyZjU0REFwQzVB?=
 =?utf-8?B?dTJmMFMvQ0ludkJMbjhuNmlVZVowakljZDhiUXpMbjIrVGkwTUxxWVlHSjV0?=
 =?utf-8?B?Z3dxQzNPdUkvNEJDaGlnRXEzR3hOSm5lYUFSSXlrR2gxUmhhNkVuSVdXTW93?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a25278a-d903-497c-f2a3-08dd0d65b5db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:27:45.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh8AbAgFLHxOeDSDTdhGlvw1BQo4bv2V3GZlb0LBdWZfjlEoCYUygSKizRIoS1M3UkvZ2UPriRZiYTWuJNYK8CTQcEnVr3MZHQbjq2OXr7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
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

On 2024-11-13 at 15:50:30 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_balancer: Disable parallel tests on execlists (rev2)
> URL   : https://patchwork.freedesktop.org/series/140062/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8106_full -> IGTPW_12087_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12087_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12087_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12087_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>     - shard-dg1:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-snb:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-7/igt@kms_rotation_crc@multiplane-rotation.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/shard-mtlp-6/igt@kms_rotation_crc@multiplane-rotation.html
>     - shard-dg2:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-6/igt@kms_rotation_crc@multiplane-rotation.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/shard-dg2-7/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [SKIP][9] ([i915#5354]) -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html
> 
>   

Not related, the patch touches a different test.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12087_full that come from known issues:
> 

(snip)

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12087/index.html
