Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB27CD3423
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 08:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D36B10E0B0;
	Mon,  4 May 2026 08:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8vKNVDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA6F10E0B0
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777883510; x=1809419510;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=sC7zhIookvRZG3IevzkSoBcrmNsWi/u59G2iazOCGHY=;
 b=A8vKNVDGXudDl9BNQzKDxv1zA59VuN1JDHRH/2bycq638Y+ZnQSEhkru
 kRcJ6ERBoS9osq5rMMnLmGHuYq0Xv9ZMfomuJPzWZlXNQrx4bkF5shPcC
 lICtJ4KQcJxkT7XT0eBykuOiwz6umDF3t8fKTH8P3FAA+OJjhXbkXroRP
 jLbuX1q1CnWDyrW0ZrC2ENOplsqkBQgvx05L2vUYWFjaZyF18EVhEiHAk
 EUMNLKrDhWKPl+tzlyR2mJSR6CE+DgCEp6uRsTDsbXM+YaBDRL9mR0VM5
 OflUiaAAVfnoHYqEyT1WipQPlQdVFsPa4aMlP19mdKsuKrwkucJ/gcRJY A==;
X-CSE-ConnectionGUID: BGjwGB8oTLeFtOPSHpSjig==
X-CSE-MsgGUID: ajBlp7x8Tvm9YdA7J5zrkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="66268416"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208,217";a="66268416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 01:31:49 -0700
X-CSE-ConnectionGUID: EscsjKVaR8u9+7sC9Qo54g==
X-CSE-MsgGUID: Xp+tQbScSg2XXixDfB01ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
 d="scan'208,217";a="235516556"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 01:31:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:31:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 01:31:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAP5kdixIzvDl4o1JwD99NLeZjPKPFm7WkxDiet1WhOxzRUblKRQW6jQRaL0ZINSZltEaZHm/RjJzGMfuwsHXdbvwJPn7f60yUnALMg2cnuF24s7RC9+U8Xyz7e7goY8rniAVTr+DUdYFfHYowPQUMeMdUcMPjJKzk/JaoEFfmQLrRNGubkW5FJJdiSyXrHEgNRNNVZQaO2YAdQQLDCiELYltYrU2+qke/0fxQJq2lUtbmYYa1P/LU/OJTlDFcnN5aR3t8TuBG2Uud+6rmA3OuSwDHyUzc1ICmr5eTCbsrkl2KuLrDLXzXHc6dgpswboSINcCK6CRjt3HVNaf1lJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MreT1a8cfcR5VWG4IzNuWRyBkWBSkp/kol5g8x7oA5g=;
 b=P+HqUrx6ItDNRb0eMPCicJEGpK3bpMNGNAUb4cdrDmd8Kwp5qKUdAPX2rDwOvRpgyyKBwTz931SnK/5HC++TEGo6HfOwtdJ++tlnu+SBjz+ah28N7yU1lr1Dq6lAfSGq0334tv6/ASnJI8fco8628NtBMlYOkKYYphWhzS+PYCNJcwwilYS4NvPYl4oPJjJL+vSmSryzmhggoe3/wAFyd1/c4A6HD4CYSyjgudqqR95eoASQKC/9OPZ/4PT/wQ+YBQvjBsOp8oCSV0DtcxthS03Qknqd7hBhxxsEzPfTuR1ZoAXcXsn4d0v/Kl82yt3CitNmzTxrvwJ1bsjtPnK6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SABPR11MB9963.namprd11.prod.outlook.com (2603:10b6:806:509::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 08:31:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 08:31:41 +0000
Content-Type: multipart/alternative;
 boundary="------------DFUxMCfpNgtNahGgAS6a44Sz"
Message-ID: <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
Date: Mon, 4 May 2026 14:01:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
To: Manasi Navare <navaremanasi@google.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
CC: <igt-dev@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>, Jani
 <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
 <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SABPR11MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: 981395a1-377f-4804-9f79-08dea9b7907d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|376014|7416014|13003099007|8096899003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7HE5jYauZtxMIRUk+vYnbYTM/FiEaxTb0Wzzc1ARVJKqknVpMV+gSHfYtwxe7QCZlLWxZ8KL7msBD4D/wuIDrgGp+C21DDnz5lk8bLYTuXeVv+DPCnxL0whtN8q5MHDUDjnDijlZK5tsSbNYxJ68saMgj10DYIu7A7Jei/AzJxhu/Yl+FQaZLm7vHIqvuw4F23x3KUdDqk+B2z5fArUJkLeCaS90bE2OYnkvYBpvJHDIZgXFC33ZhNrWib2NXRVO2k3x6QvgcmxpXAboLYqe0uVupZcKIl+ewFPJouIFyzdjG/s9IjeKXKizf7v0CAFZv4dEH2+KNhHfk+iNzuNoaEyWdi3HN1WNjdELjmzzqbOjTm/3QNpKlNOKohy/E59lHZorQrzAikgPsCyVTFOXtjB9in/3gJQ3H7HCnWsTf/FCAq/OV9jCF3oqB/uAc9JlchsaQo3uDuQLVhnbtYZVm38kJK9HdsFrycuZus5oafi9ANB67i7ojstKzVx3nPZJRA8GInWj6pzaYPbUzuQwq5xDas9pLvguPixTDCTTc2r+96KWmjZCVQLM7HuhBq8quniTViCLwXwg/o4FjKiI5LWac4vvxo3ueQ2jNoxX2WT/2EpBNzXEcGXJH3fSCo27sVpCcmAIsFURchwfpvne8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(13003099007)(8096899003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkdtY0x3bGl0YTJmVW1FRmw4R0xQNmtCZXpzRStqVEt0Q0Zlb1ZhUjY0bm1Q?=
 =?utf-8?B?akxGUVBGN3FMUjFEajFXU1Y1b3lYN3J5U1A1SDdLYmR4dmh1QjRtK2ljNVRP?=
 =?utf-8?B?bEJsVU14QWx2ZkcwaXg0VzFLODMvYi9XTGJ0cllubkpYWGJHbUViaHkrUHNB?=
 =?utf-8?B?bDZ1N3ZVanVEZXJVSTRvcW56c080cXZ3a0JzTWhPbm9HN0pvVzA5dm93NXZ6?=
 =?utf-8?B?UGd5aCt4L2hyY1RLUnJhMnEyRGUxVitZcVNtTjN2R1RQTXozSHlXVmdFV2hv?=
 =?utf-8?B?dVlTM3Z3d2NDTGxHcFQ1aXlBYk5yYTJDY0dBWTFvVHVCSk5VWkNJYW85RHV1?=
 =?utf-8?B?REZhUGY3THVjb2tJZDlrWVM2Uzc0VjhpYitUamkycTBrTFA3QmZrd2gyamJ4?=
 =?utf-8?B?bHpNMlJlTmtaeER5YlExNnZFc3RuOVJ1SnYrSFNXV0NmSlBrc2p6UjhuWW54?=
 =?utf-8?B?dU9JSWs0YXJhNy8yc25FMGZqUklZR3pvdkJVQzVISUtoWTllMXVpM04rMnJx?=
 =?utf-8?B?R0pDWG5hU1FEeEVPV3h6bHY0SldpTHlqamk0TXNyalVXdkdmUStocmFXRXdK?=
 =?utf-8?B?eXdIcHJ6eU1rdXZzcUtiZ29NUUJHZmtoUTl1UTNldXRuYWF6Y2M3Wkh0OGRl?=
 =?utf-8?B?c24zM0xQejVPQ3Ywd3VuY05EclEwdlAwQUtGZHdQZGxQVFNhOExqQTFKdGtO?=
 =?utf-8?B?ZHliYVpmUnB4ZmM2aTZPTmxOUHJrNGZLZ01lMDhNQ09OeVF0SzhoUXMvaEdB?=
 =?utf-8?B?MHFpN1Y1U1NJcTVQRStVckp3Q2N2d3A5cG1pdThKWGMxRjVzUlpXVDBHM21C?=
 =?utf-8?B?UGVzcWhyZlJEdHhRYUE3UU04bHFFV1F2dHp0NjFnTWtLdm1wM2NBa2pVYjh5?=
 =?utf-8?B?bUdET25BclZreTkwNjkwM2liak5CZitFL2VQRVVNRDA4VXllenBlYjN2U2Y2?=
 =?utf-8?B?bGl1bjFxSlNRZkZWMUd2V1BscG5XNE43NVFTRVluUmN1MlhQMUp5ZzN6WFk4?=
 =?utf-8?B?TmJJdU91d1VIRXBNSkZVcTFGY240dVd2NFloT2RWaktFOE9BSy9OTk9PbWJa?=
 =?utf-8?B?M3pWaUNLZUFRMzEveVlsT0ppaDhqcUsyMTVpeE8raVJkZFFPcDRWdmlodFdK?=
 =?utf-8?B?azdpTGt4NlZkYTk4djd6R21XTWROaTFLRGpOQXNzaUpPeGI5V1k4V2dLeWlr?=
 =?utf-8?B?dHlhck5VK2Z3QmZid0U2ZDlxQ3FaSkphNDhDS2VwS1NkengyZUcvQzNjOUlu?=
 =?utf-8?B?anZaS2JjZnF3bVlXNG4wQUI2ODV0b1NuMm5sbXpqRjRhN1JpQUpUbkdsMWh1?=
 =?utf-8?B?TFNFTkk4NVJidittRUFLeVdqTmxYemR3M0xuWEdHYWpuTDNSZUNWYWtYcVBi?=
 =?utf-8?B?enA1MmRKVnJmbVlCbnlieTR6Yy9McnhiK1VqVUsrQnUxdzR5dGRaOXlCWHhp?=
 =?utf-8?B?YlV6TEI4dis2M1lnaVZ6UkQ4b0NQN1ppNVpyeThsWmdCNW5RNCtDczFZNk1M?=
 =?utf-8?B?TVp5WTR3OEpMN3doek9Bak1BZjZqQlo2dlgyQXhOektrZzBLQmppRmFWMFN4?=
 =?utf-8?B?Mk9xY25VQUVIQnlkNEc0dE5sUFYzVENPREJHQ09aM250d0VXcDJyOGd5U0lz?=
 =?utf-8?B?Yzlqa0JIMVNuVHIweWZyUm5RMk82KzhSSldFK080dGZ5SGNNdGk5LzhQd0tS?=
 =?utf-8?B?T3JhdUUvWnNEN2ZCbVZCZmt4Z2JvK01aVEp4WHVlaTZ6dEpxOE9EWi9CRDh1?=
 =?utf-8?B?VWwwKzlBZENiNzFQbUVKb0hoczNhdDU5VE56akZzME5VbkxpbnBYbjZTeWpi?=
 =?utf-8?B?enhWcy9jejlMb3JHV0tSQmF2UURkeGl4RFhVSjh5UjRSZ1VVNng3OHNaMXhx?=
 =?utf-8?B?eGNMQ1cyYTVscFRkQzR2dWZ6WGk0Y1Y3OHl3TEkyNkl6cVpRUjluZXNVb2h3?=
 =?utf-8?B?YmRjMUR0RmFROGZzUHh3bERpemNBU0JhRTFod2dDTm5PN3BsYWNNN0hNT1Ja?=
 =?utf-8?B?YnFDcXo4azNUdWtYK0huTEFRalRxRFl6UXova09KR3lsakdQQUFjWHA1TlVQ?=
 =?utf-8?B?QVBCakdoZWRsT0lGclJXYXhlWmNrcFMzRnNrRFVNREhwb3JIMFIxdk9SdlZh?=
 =?utf-8?B?cGNZVnN5SVNoTkhtK3l3VytnNU4rbzhsaWk2TEhLR0lOeVN4K1h4ODhVYTRV?=
 =?utf-8?B?UEhYNGhjell1OGhEdkJaZ253ckxaU1JmTlhZSFBkWUl3SG50dEVuQ1MvWkJp?=
 =?utf-8?B?QzZCU2hqUG5oOE9mSGtQY1ArMjRvbEdLU01rNUh1THNXalI5K3NSUENUdTk5?=
 =?utf-8?B?K3p5VERuMzZjRm5rY3VrMVIwNXArV294aUdueG5JaDFLTTRVb2wvdz09?=
X-Exchange-RoutingPolicyChecked: B65YAFwMPAi9TYGsuCprYU6+PrJAxw3+O12VIu/tbaYfkfUN6Ve26lvN23JIon/BgHZhcPnPS6N9WgcZqpYTG/4dgpZoHaChzUuqY3hoqTbEjZzELFbgrK0pygIuw4pgGg8rrPysqrumdLMRReYwk0pi6G7Mh43q+fiYvJz45IqffvK+DTM+4WhCpbRqVDRFqA5wGPmR9+7X1w30/kpwZoGkFYC8wUwjtTY7BHc0dXTqqKjpnN6u7vDrIQNEPYRwGqxPxKszmyJ9V/aOKw/EihmSRu7B2ItzqOBxBkiFsEQ0Ln1Zv1jjp9QIZBN6aiTidXiiNQDtQKWVUfPo/HlH0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 981395a1-377f-4804-9f79-08dea9b7907d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 08:31:40.6041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qs/ev5wN4bvEm2p/2b/uFDjZu7q4T0Gr4tBx4RjlnqP3Z8Kbp4/zZWspV2izjp58U5NvVeHknNiCYA5ZxXHOUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9963
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

--------------DFUxMCfpNgtNahGgAS6a44Sz
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Manasi,

On 5/1/2026 4:29 AM, Manasi Navare wrote:
> This change looks good to me,
>
> Reviewed-by: Manasi Navare <navaremanasi@google.com>
>
> @Karthik B S <mailto:karthik.b.s@intel.com>  and others from Intel 
> signal boosting this, could we get some traction on this, its reviewed 
> by the team, could we please land this?

Sure, the idea LGTM in general. Will try this out at our end once before 
merging as this test doesn't have coverage on CI currently.

Regards,
Karthik.B.S
>
> Regards
> Manasi
>
> On Wed, Apr 29, 2026 at 1:31 PM Manasi Navare 
> <navaremanasi@google.com> wrote:
>
>     Thanks Jason-JH for this improvement in the kms_content_protection
>     IGT test.
>     It makes sense to create a fb per CRTC given that each CRTC can
>     have different mode timings/resolutions.
>
>     @karthik.b.s@intel.com <mailto:karthik.b.s@intel.com> ,
>     @bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
>     Could you please take a look at this patch and help provide feedback?
>     We would like to get this landed as it helps improve our testing.
>
>     Regards
>     Manasi
>
>
>
>     On Sun, Mar 29, 2026 at 8:22 PM Jason-JH Lin
>     <jason-jh.lin@mediatek.com> wrote:
>
>         Replace global framebuffers (data.red/green) with per-CRTC array
>         (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with
>         different
>         resolutions.
>
>         Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
>         test initialization/cleanup, creating each FB with the
>         resolution of
>         the first output that can connect to that CRTC.
>
>         Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>         Reviewed-by: Fei Shao <fshao@chromium.org>
>         ---
>          tests/kms_content_protection.c | 50
>         +++++++++++++++++++++++++---------
>          1 file changed, 37 insertions(+), 13 deletions(-)
>
>         diff --git a/tests/kms_content_protection.c
>         b/tests/kms_content_protection.c
>         index caf3d7a56ae4..df9ff5efcaa2 100644
>         --- a/tests/kms_content_protection.c
>         +++ b/tests/kms_content_protection.c
>         @@ -107,10 +107,15 @@
>
>          IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>
>         +struct hdcp_test_fbs {
>         +       struct igt_fb red;
>         +       struct igt_fb green;
>         +};
>         +
>          struct data {
>                 int drm_fd;
>                 igt_display_t display;
>         -       struct igt_fb red, green;
>         +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>                 unsigned int cp_tests;
>                 struct udev_monitor *uevent_monitor;
>                 bool is_force_hdcp14;
>         @@ -991,31 +996,49 @@ static void
>         test_content_protection_cleanup(void)
>                         igt_info("CP Prop being UNDESIRED on %s\n",
>         output->name);
>                         test_cp_disable(output, display->is_atomic ?
>         COMMIT_ATOMIC : COMMIT_LEGACY);
>                 }
>         -
>         -       igt_remove_fb(data.drm_fd, &data.red);
>         -       igt_remove_fb(data.drm_fd, &data.green);
>          }
>
>          static void create_fbs(void)
>          {
>         -       uint16_t width = 0, height = 0;
>                 drmModeModeInfo *mode;
>                 igt_output_t *output;
>         +       igt_crtc_t *crtc;
>
>         +       /* Create framebuffers for each connected output's pipe */
>                 for_each_connected_output(&data.display, output) {
>                         mode = igt_output_get_mode(output);
>                         igt_assert(mode);
>
>         -               width = max(width, mode->hdisplay);
>         -               height = max(height, mode->vdisplay);
>         +               /* Find a valid crtc for this output */
>         +               for_each_crtc(&data.display, crtc) {
>         +                       if (!igt_crtc_connector_valid(crtc,
>         output))
>         +                               continue;
>         +
>         +                       /* Skip if already created for this
>         crtc */
>         +                       if (data.fbs[crtc->crtc_index].red.fb_id)
>         +                               continue;
>         +
>         +  igt_create_color_fb(data.drm_fd, mode->hdisplay,
>         mode->vdisplay,
>         +  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>         +                                           1.f, 0.f, 0.f,
>         &data.fbs[crtc->crtc_index].red);
>         +  igt_create_color_fb(data.drm_fd, mode->hdisplay,
>         mode->vdisplay,
>         +  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>         +                                           0.f, 1.f, 0.f,
>         &data.fbs[crtc->crtc_index].green);
>         +                       break;
>         +               }
>                 }
>         +}
>
>         -       igt_create_color_fb(data.drm_fd, width, height,
>         -                           DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_MOD_LINEAR,
>         -                           1.f, 0.f, 0.f, &data.red);
>         -       igt_create_color_fb(data.drm_fd, width, height,
>         -                           DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_MOD_LINEAR,
>         -                           0.f, 1.f, 0.f, &data.green);
>         +static void remove_fbs(void)
>         +{
>         +       igt_crtc_t *crtc;
>         +
>         +       for_each_crtc(&data.display, crtc) {
>         +               if (data.fbs[crtc->crtc_index].red.fb_id)
>         +                       igt_remove_fb(data.drm_fd,
>         &data.fbs[crtc->crtc_index].red);
>         +               if (data.fbs[crtc->crtc_index].green.fb_id)
>         +                       igt_remove_fb(data.drm_fd,
>         &data.fbs[crtc->crtc_index].green);
>         +       }
>          }
>
>          static const struct {
>         @@ -1241,6 +1264,7 @@ int igt_main()
>
>                 igt_fixture() {
>                         test_content_protection_cleanup();
>         +               remove_fbs();
>                         igt_display_fini(&data.display);
>                         drm_close_driver(data.drm_fd);
>                 }
>         -- 
>         2.43.0
>
--------------DFUxMCfpNgtNahGgAS6a44Sz
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Manasi,</p>
    <div class="moz-cite-prefix">On 5/1/2026 4:29 AM, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com">
      
      <div dir="ltr">
        <div>This change looks good to me,</div>
        <div><br>
        </div>
        <div>Reviewed-by: Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;</div>
        <div><br>
        </div>
        <div><a class="gmail_plusreply" id="plusReplyChip-0" href="mailto:karthik.b.s@intel.com" tabindex="-1" moz-do-not-send="true">@Karthik B S</a>&nbsp; and others from
          Intel signal boosting this, could we get some traction on
          this, its reviewed by the team, could we please land this?<br>
        </div>
      </div>
    </blockquote>
    <p>Sure, the idea LGTM in general. Will try this out at our end once
      before merging as this test doesn't have coverage on CI currently.</p>
    Regards,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Regards</div>
        <div>Manasi</div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Wed, Apr 29, 2026 at
            1:31 PM Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div>Thanks&nbsp;Jason-JH for this improvement&nbsp;in the
                kms_content_protection IGT test.</div>
              <div>It makes sense to create a fb per CRTC given that
                each CRTC can have different mode timings/resolutions.</div>
              <div><br>
              </div>
              <div><a class="gmail_plusreply" id="m_1039234134813026890plusReplyChip-1" href="mailto:karthik.b.s@intel.com" target="_blank" moz-do-not-send="true">@karthik.b.s@intel.com</a>&nbsp;, @<a href="mailto:bhanuprakash.modem@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">bhanuprakash.modem@gmail.com</a>,&nbsp;@<a href="mailto:swati2.sharma@intel.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">swati2.sharma@intel.com</a><br>
              </div>
              <div>Could you please take a look at this patch and help
                provide feedback?</div>
              <div>We would like to get this landed as it helps improve
                our testing.</div>
              <div><br>
              </div>
              <div>Regards</div>
              <div>Manasi</div>
              <div><br>
              </div>
              <div><br>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Sun, Mar 29, 2026
                  at 8:22 PM Jason-JH Lin &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Replace
                  global framebuffers (data.red/green) with per-CRTC
                  array<br>
                  (data.fbs[IGT_MAX_PIPES]) to support multiple outputs
                  with different<br>
                  resolutions.<br>
                  <br>
                  Add create_fbs()/remove_fbs() to manage framebuffer
                  lifecycle at<br>
                  test initialization/cleanup, creating each FB with the
                  resolution of<br>
                  the first output that can connect to that CRTC.<br>
                  <br>
                  Signed-off-by: Jason-JH Lin &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;<br>
                  Reviewed-by: Fei Shao &lt;<a href="mailto:fshao@chromium.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">fshao@chromium.org</a>&gt;<br>
                  ---<br>
                  &nbsp;tests/kms_content_protection.c | 50
                  +++++++++++++++++++++++++---------<br>
                  &nbsp;1 file changed, 37 insertions(+), 13 deletions(-)<br>
                  <br>
                  diff --git a/tests/kms_content_protection.c
                  b/tests/kms_content_protection.c<br>
                  index caf3d7a56ae4..df9ff5efcaa2 100644<br>
                  --- a/tests/kms_content_protection.c<br>
                  +++ b/tests/kms_content_protection.c<br>
                  @@ -107,10 +107,15 @@<br>
                  <br>
                  &nbsp;IGT_TEST_DESCRIPTION(&quot;Test content protection
                  (HDCP)&quot;);<br>
                  <br>
                  +struct hdcp_test_fbs {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;struct igt_fb red;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;struct igt_fb green;<br>
                  +};<br>
                  +<br>
                  &nbsp;struct data {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; int drm_fd;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; igt_display_t display;<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp;struct igt_fb red, green;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;struct hdcp_test_fbs fbs[IGT_MAX_PIPES];<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; unsigned int cp_tests;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; struct udev_monitor *uevent_monitor;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; bool is_force_hdcp14;<br>
                  @@ -991,31 +996,49 @@ static void
                  test_content_protection_cleanup(void)<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_info(&quot;CP Prop being UNDESIRED on
                  %s\n&quot;, output-&gt;name);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_cp_disable(output,
                  display-&gt;is_atomic ? COMMIT_ATOMIC :
                  COMMIT_LEGACY);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                  -<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp;igt_remove_fb(data.drm_fd, &amp;data.red);<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp;igt_remove_fb(data.drm_fd, &amp;data.green);<br>
                  &nbsp;}<br>
                  <br>
                  &nbsp;static void create_fbs(void)<br>
                  &nbsp;{<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp;uint16_t width = 0, height = 0;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; drmModeModeInfo *mode;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; igt_output_t *output;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;igt_crtc_t *crtc;<br>
                  <br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;/* Create framebuffers for each connected
                  output's pipe */<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; for_each_connected_output(&amp;data.display,
                  output) {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mode = igt_output_get_mode(output);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_assert(mode);<br>
                  <br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;width = max(width, mode-&gt;hdisplay);<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;height = max(height,
                  mode-&gt;vdisplay);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Find a valid crtc for this output
                  */<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for_each_crtc(&amp;data.display, crtc)
                  {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                  (!igt_crtc_connector_valid(crtc, output))<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Skip if already created for
                  this crtc */<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                  (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp;igt_create_color_fb(data.drm_fd, mode-&gt;hdisplay,
                  mode-&gt;vdisplay,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp;DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.f, 0.f,
                  0.f, &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp;igt_create_color_fb(data.drm_fd, mode-&gt;hdisplay,
                  mode-&gt;vdisplay,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp;DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.f, 1.f,
                  0.f, &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                  +}<br>
                  <br>
                  -&nbsp; &nbsp; &nbsp; &nbsp;igt_create_color_fb(data.drm_fd, width,
                  height,<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DRM_FORMAT_XRGB8888,
                  DRM_FORMAT_MOD_LINEAR,<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.f, 0.f, 0.f,
                  &amp;data.red);<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp;igt_create_color_fb(data.drm_fd, width,
                  height,<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DRM_FORMAT_XRGB8888,
                  DRM_FORMAT_MOD_LINEAR,<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.f, 1.f, 0.f,
                  &amp;data.green);<br>
                  +static void remove_fbs(void)<br>
                  +{<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;igt_crtc_t *crtc;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;for_each_crtc(&amp;data.display, crtc) {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                  (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;igt_remove_fb(data.drm_fd,
                  &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                  (data.fbs[crtc-&gt;crtc_index].green.fb_id)<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;igt_remove_fb(data.drm_fd,
                  &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  &nbsp;}<br>
                  <br>
                  &nbsp;static const struct {<br>
                  @@ -1241,6 +1264,7 @@ int igt_main()<br>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp; igt_fixture() {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_content_protection_cleanup();<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;remove_fbs();<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_display_fini(&amp;data.display);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; drm_close_driver(data.drm_fd);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                  -- <br>
                  2.43.0<br>
                  <br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------DFUxMCfpNgtNahGgAS6a44Sz--
