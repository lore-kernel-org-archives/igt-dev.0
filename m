Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0067C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 04:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300710E066;
	Thu,  7 Aug 2025 04:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmoAcwzm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A055C10E066
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 04:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754541629; x=1786077629;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MQgHplANNpxDjEljdDjtX+QZvDitZDvNu0g8SLAqOTs=;
 b=KmoAcwzmU8a/Ojm2q6ElHO00HaduiFrWz3wsa5wkiQk2O32ZfzUBkQsT
 c+Vy5+lTxznp8dQyKt2sQ9r1y45XmoTQFYabrqH7r1JqdOTtPZjUk4T2Y
 pVEjOO86goQgAx3MSQeuPQcaYbH1qh5xWU46UdXAOLgaUSCGA757gbK/n
 9Ysorh+ykrLaQeooh/5VaRIP7GStW/Wv9dGG4vWhYGe5xmSDYSo49pdax
 opM6gX8SYzpvVGitNtX2zEtKLdpndBWoQiN0BfhcWw+BR2Axg9FS2yvXp
 ORFlj9vCm2do0oSj82Drk8ZqDW9nUq+isGxdeZy71hM9iRW2O0aWyEVJU Q==;
X-CSE-ConnectionGUID: rL/0C8xhT8avib3qg/hIgg==
X-CSE-MsgGUID: krrJKPt9QRethsJiVuN+fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82314354"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="82314354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 21:40:29 -0700
X-CSE-ConnectionGUID: hL4EfJEeQjqHJnawblxpWg==
X-CSE-MsgGUID: xL6cqxicRqm72P1hhV1WeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169137312"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 21:40:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 21:40:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 21:40:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 21:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhRwygU4EBusmhtaOTEbWWXak12DocMvCrnBzaRQaXsprZqJDzty18GSoTAgRr3O5BIk6F0TZrT4FqzNzxMoiQk7UstE9ehPtu1ZXfr+oG3mjhjauqGJChMPNON0W0ovpvMd6FXD8CTb2Qz78P0+SL60ELnFMofIwnfId5cJ+vtYhNyeg8kwv/wt3oDRJJdFL+ioMpWMWv9pqP/V4+UleROHfZ0ZiA3mX6k+xMFtyLsB9KiusF2Eq0fNnRPKZz5xgabuOGrg+8Qq1/BWLRzgRQ9vfTO/pVSYlYVzY8AOCUec3f0G76W98HVlp6G8tRQSbOBYylmvfYW6mw0RZ4XQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdBsWzRKmljJECY2jgWcnTgE2+DvT3+mckvTwVBhb8E=;
 b=NueK0BjZQmXGbQNjOgNRwyI7ps4L5/Hrt/MlTz7g+sFE6u5RbJtcUiIxE6xjilfiAfC9tDucgGLmEpuieYuor08GKoGeTHv9bZACUthKcQ86Y7Dnl3hHWS8LoM3b/P/addlUtF2nhWN3td9ENBh0yqJ6p/PMySLl0RdWpgO7Sh0W1kkbXAroQzDtJkf8DzEheZJFppiXjUByo6LVUaLnMZY5nzpwjMiWrubEeGzwQpGz2ACxrlzWLsZh04FBaiQos6M9NnbaBxIO7q9lPoqyOQBmZy8+qqRPAnqCFT6OXP1q1Ifl+izv+wXB2myTi4/LiE8tiAgQK+RrY3+cwo2/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 04:40:24 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 04:40:24 +0000
Message-ID: <75914ea6-0a33-4d3c-9ae7-7bd9096a7879@intel.com>
Date: Thu, 7 Aug 2025 10:10:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>,
 <zbigniew.kempczynski@intel.com>, Jim Shargo <jshargo@chromium.org>, "Marius
 Vlad" <marius.vlad@collabora.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com> <aJHMyZwbV4bV7zma@fedora>
 <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b0942f-b6e6-4650-c030-08ddd56c8600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUxIQ2lmYTlxcnE5Y0orTmtNbDRYcGVJRFgrNEorQWJHV2xGWm40L0RIUzI0?=
 =?utf-8?B?UFJEMWtzNEdIc2dwT1V6ZVIybUtieFhmT2dZSG5oVGE0NEJLRVR0cWJ2R2ZQ?=
 =?utf-8?B?TkhJV3d3Y1FpT1ZoMFMzS1A2WWJIdGt2dFRVOFlaWDJiakh4dUNERFJXVVJ6?=
 =?utf-8?B?dktpSkV5SnM5VlM1cXBaUVlNZHBaWGl3cC9icElTQmsyTWpUK0x2STE0MFZk?=
 =?utf-8?B?M2RjcFB3OXdWSEs4WEM1U29BV29xRmErRXc4NDFTdUdqT3IzcHE4TUttYXJY?=
 =?utf-8?B?WmRoVFZvWGtQdjVxa2JTRFpwYzI4dVB4MnhDU1M2MWtwL01TbDNlT05naFNH?=
 =?utf-8?B?KzkrZVUzN1M4Rko4SEUxUDhad1VUam9DMno4QUFBbGEzbEhFZExFUG1WaGc5?=
 =?utf-8?B?M2VyMnlHcmpqbDlIcHVubTgycWZyVkFwV0pUUHE0NW91ZWhYNURyR0hDc2Qr?=
 =?utf-8?B?WDdGSnlsWW90aDMxbTl5NmRBVC96WnlzTkNUdzFQREFJeHc0OFdkL05wOWNp?=
 =?utf-8?B?SGNRN3JxamZacm9hSmo4Q2ZqdVNUZ2tOUlg4UWNUZUNBVFJOcTBEVTNqT0px?=
 =?utf-8?B?ZFFwVzZleUdKb25FY1M0NG01d3hnTk1tODNWdFFUdzFzbGwyakdxY2MxRk15?=
 =?utf-8?B?bzRwTG1SRVR6blhVUGM3RnJCdGFyNUhiMWFkalZHRTNDK2FYWW9yZjBqUXo2?=
 =?utf-8?B?UGg5RDJqRzhWaFBBWTRXN0pzK0ZlaWhCc0RFeUlnOGVXbUxqYk90c0hiODVO?=
 =?utf-8?B?U0p4bFFycGdsU21IYkdnWGNEaXpsaHVteUYwdFB2dTJqeVRiYkdwU0FEb3B5?=
 =?utf-8?B?azJEUEt0QmRDYVdnQVgraUcxTzJEUnJKMVJkZ1JDWTR3K3h2d0lwZ01uMkxR?=
 =?utf-8?B?bkVEK0gzZEVWWnJxL0ZRQzBlS0dqTXY5MkpOaEZjalNycVduVGVhTHRsdldZ?=
 =?utf-8?B?cXovRG5MMFBZbjRFRllmbnNWS3BveEQvazNmM3BZQ28zRnl6MEozNWVIbXBq?=
 =?utf-8?B?TnBVTkJZcW81dk5QSTJLOFhjQ0tJYlY5ejVpdWpib2ozbjVkS0xPcWlHc1JC?=
 =?utf-8?B?cXgwN014TVNXS3dZMVRuWHh2WC8vMmlNL21pOC9EUkVzS0huU0ovbmwxMHBQ?=
 =?utf-8?B?SEdvSVgzQjRSaDE4SzlaVTJsY3NMcFFta3YvanFsSW13WHB0WC84Z0JPK2wy?=
 =?utf-8?B?dHFmSHZHM0pXSmljOXJNWTFLSGNCamVsb3UzM1R4bjI0S1lqQ0xQdkFXTS8w?=
 =?utf-8?B?YUhsQUNWSitTRVNuU3RDWHVDU3BRaWJJdi9Rb3F4QWdLeElIRllzYmoxQ3pp?=
 =?utf-8?B?VFJZVmNhc2ZSdVRMUzlCVWk4eGw5bStxVlo3LzZHWG5ieXFYM1JLVGZCWGIy?=
 =?utf-8?B?M25TQVVXakFtTmMwWUxjNzRWbENyNCtkdmkzSHBONW5jM2JxdkxIOGpPMXQv?=
 =?utf-8?B?bThCUGo2NU4yUnhlUXd6VVYyUTBDa2ZOa2ZmeGdVN0JPT3M1bTk5NW41NXRm?=
 =?utf-8?B?YnpOUk5ORXE4cVNIVlJoS2xHd1JBOVAzUEQ2emZrTSthUm9nSHJ3WFJ4anBu?=
 =?utf-8?B?L29JMFROcHk5amZTOXVEWVZ3ejJUbmY5UjJYcVU1a1lMbXNmalpud29MV0Fv?=
 =?utf-8?B?S05sK1ZuWEpScVJYdjZFT0pxTDZzUXdMa2NiMW9oUG5CU2N2RUltRzU1TlY3?=
 =?utf-8?B?OWhXUjhtM0VCQVJxSmJIaFptcHdxU254YjlOUGVJN3FOU0g3T0VCYkt2V2Y2?=
 =?utf-8?B?dVRiQ25FQkxycFYycElCSTJrL3g5Z1BZbDFOVjJGZGh3WlQ1enBCMjNCNUh3?=
 =?utf-8?B?OC96d09NazZXajVrY1kySGxLN2JOSlBaWXoxbkNEVno2eDFaWUdWQ1lXMklQ?=
 =?utf-8?Q?2wRFcaK5FkBbN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNUcWlVWTM4YmJIanFuTlo3NEZNWFpTL0hZVmxUZ1lTejdZa0NhcWNXNkly?=
 =?utf-8?B?UXN4emgrTFoyVUUrQ0k3c3FvWXM4UnMyT3lwS0tXLzhlYnh3ZUF2OHFuTCs4?=
 =?utf-8?B?Q0JqSUw5L2Z4TzV2WnJqYkwzbXdtZUJxN283WWI0UEVaY1ZmVFRlVWd2TjF1?=
 =?utf-8?B?Z2lLSHRNOUlaSXZzUG5aRzNpRmptT1EzNFEzVkhTNnNDY0toaFUrWWlIM0lY?=
 =?utf-8?B?UW1Md2FvNkk0dG9WNVMzTTZxTEtsZW1Zb3VnOTF2RDFxZDVqSjZmenFieTA3?=
 =?utf-8?B?MTNPb3JrcXpkYldmcFZOU1MrSzMxbkNaZWpMMS95TGdsZnowVmpqUFIwN2ds?=
 =?utf-8?B?cWdscnFZdUE4QWVvRnBRaFZST1hwRmk1OEZSblRMRUxMQ1ZQcnVUbVl2K3VE?=
 =?utf-8?B?SjFVSVpleEtTdXlOWVhJTjlFSEczOHZUcm5PTXZBZzVxNFF4dzZYTzhSU2Js?=
 =?utf-8?B?eFBXbTYwU0toZHhVRjhKUEZBaTVZa2VQOUJ5MjM0MHN4dUc4WVVSQWlLYXE5?=
 =?utf-8?B?eWgwRHE5S1YzN1Z3RkM3azVCdDNwMDNzbVpXN25sNHpYNEpHdGdGOU1OYmpk?=
 =?utf-8?B?MXRVK0NMQ0ZIaS8rYnFCMkVXakhmYnBDVU5peUUxbzBsUFhyWWRrTG5zZVZC?=
 =?utf-8?B?UVVlOEJVZTFhRXF0MjAwTGtYdmlsQWRjZk5ZVjk1a0RocGlJQUdXbHlHWFAx?=
 =?utf-8?B?MG5RR1RCUUJtSXBFNEI3RVBSMDRxcHd3NUhYQTRKMi9TQ0Z4ZTdVVWRCVVZE?=
 =?utf-8?B?SHdodkxSayt0WkhrTDg4bjdiSWhHaUZBOVJSeHVjbWdFSXVMekl5TW01cFht?=
 =?utf-8?B?MDdUdklwNEZLVk53WUR3ZG9BOXBEd3hzaWtpaWRORmdSam1mNk83ejR1ZWxP?=
 =?utf-8?B?WlJuUzZlVmdySDZRQW4yU04xcjJJdW1Od0cyckx2YWdMWi9kbFhiWnBXVmpW?=
 =?utf-8?B?Nm5Kbys1VWxBMUlud0w4VjhMNXpaZnpnUmYrVVQ4WnByUnNCc0dKSnl6QnNa?=
 =?utf-8?B?d0QzNmFuam9iUmt4WTRaazN2amtzZjJMWHlLOW1tM1JreDhqOVMxK0FJaGxh?=
 =?utf-8?B?a3BQLzRiK2NCT2ZpbEYwYUZkWmRzWS9IRHNXZ1oyVTVDeGtnaTlGQjFqQkhJ?=
 =?utf-8?B?bEhoTFBkSktjSVc4dElWN2pnenUzcE1TQ3laYlRpdUxpN2VGRHFHdlY3Z2My?=
 =?utf-8?B?M0xvZG5PbHdsMlE4V2R4aUwzNVFJK3A5b0tnRHUzbm9nQ3NkVGYzUnhZaXBV?=
 =?utf-8?B?V2xBdmhCVS95U3lHRy9wZzNEeUZZMno1a2FzWXJEQUtCeTFUMXV0L0phand0?=
 =?utf-8?B?b2EwdlFpbkkrbHRiVE1rS0NNUURtcjhVZnk0VzR0YlVqbVVUckxtVWdqTktF?=
 =?utf-8?B?aXNpNnVnT3pBd3FIbzlVZ29LdVhOL1pib2VRSWpVMXlxV1NPaU1peUFUSmtT?=
 =?utf-8?B?MmV6L1ljZ2YxcXBNSWZ6U1FDdExjNUJCSkp0WWxKZGZQclhLYXNnektlNEhz?=
 =?utf-8?B?cHRBdVlmdGFoY0FlM1c2TjN3TDI2WkpxUENLNEl3K2p5Q0xzUzNWSzNVQWxz?=
 =?utf-8?B?MnU2R2ZLK1d0YTJZK2VlV29wR0MreVREZ0xXY1pDSExlWkhMRUVRZkE2WWpa?=
 =?utf-8?B?WE9ZQllFQlNVTzJ1VmZUREFESit2NlBGZDVHMndsQ2lKZGFVVHpnUnpMVS90?=
 =?utf-8?B?VnhLUk5yWWh0ZjVzRk5ZcEgzVGRkeGtYdkpWZDJRUE9hdk02ZzZJVDB2ZjVW?=
 =?utf-8?B?YXluSTlTQmlvaHpxQVhhUDM5NVBWd1BMc0hxRy9Ob1UvSnNQaEQzdWNmc09L?=
 =?utf-8?B?Z1Z6cHlkYmJlN0x1dEFMRmNDV2ZQUHBOWi9yclQzT3pKWDFyQ0dVbGRxZ0t0?=
 =?utf-8?B?Z0RKZXAvSyt6ZFN3dTc2bFFZbW5ITFhhK2IwNjN5VTViaWhIQ1JyQk5kWFJu?=
 =?utf-8?B?ckZMamVIaEg3RzUyd1JtYmJLTDlkYmttK0JDSE5zcEpxQ1dhSFVaV2lRTGRv?=
 =?utf-8?B?V2dpMFVhZEtDODljbVpjdTcxVUNmUFBBUjVNMWlRU2F2SkMvcnJaMXdUMnNO?=
 =?utf-8?B?VEpPeEx1S2ZjdXBldWxkVUJPOVltZEN2RnlaVHNjSHVsQXRWamErZmNycDRO?=
 =?utf-8?Q?8jLoqBCxU/8cc+/gjv8idMo12?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b0942f-b6e6-4650-c030-08ddd56c8600
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 04:40:24.5297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUcn8b3wp0hcUxeoWVnMrgGPgXsX+PvMw8nTVDNQkRsL15AQ2ttCep4Z2hnVsBv72f/9989eKqXKCpWSp3g32A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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


On 8/5/2025 9:59 PM, Kamil Konieczny wrote:
> Hi José,
> On 2025-08-05 at 11:20:09 +0200, José Expósito wrote:
>> Hi Louis,
>>
>> On Wed, Jul 16, 2025 at 11:22:38AM +0200, Louis Chauvet wrote:
>>>
>>> Le 15/07/2025 à 12:24, José Expósito a écrit :
>>>> Create a library containing helpers for creating VKMS devices and
>>>> configuring them dynamically using configfs.
>>>> For the moment, add the minimal number of helpers to be able to start
>>>> testing VKMS's configfs support: Create device, destroy device and
>>>> destroy all devices.
>>>>
>>>> Also, include the simplest possible test using those helpers (checking
>>>> the device's default files) and the scaffolding required to generate
>>>> the documentation.
>>>>
>>>> Co-developed-by: Jim Shargo <jshargo@chromium.org>
>>>> Signed-off-by: Jim Shargo <jshargo@chromium.org>
>>>> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
>>>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>>> ---
>>>>    docs/testplan/meson.build        |   7 +-
>>>>    lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
>>>>    lib/igt_vkms.h                   |  27 ++++
>>>>    lib/meson.build                  |   1 +
>>>>    meson.build                      |   8 ++
>>>>    tests/meson.build                |   2 +
>>>>    tests/vkms/meson.build           |  13 ++
>>>>    tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
>>>>    tests/vkms/vkms_test_config.json |  72 +++++++++++
>>>>    9 files changed, 467 insertions(+), 2 deletions(-)
>>>>    create mode 100644 lib/igt_vkms.c
>>>>    create mode 100644 lib/igt_vkms.h
>>>>    create mode 100644 tests/vkms/meson.build
>>>>    create mode 100644 tests/vkms/vkms_configfs.c
>>>>    create mode 100644 tests/vkms/vkms_test_config.json
>>>>
>>>> [...]
>>>> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
>>>> new file mode 100644
>>>> index 000000000..fa41f741e
>>>> --- /dev/null
>>>> +++ b/lib/igt_vkms.c
>>>> [...]
>>>> +static int detach_pipeline_items(const char *path, const struct stat *info,
>>>> +				 const int typeflag, struct FTW *pathinfo)
>>> As there will be a new "color pipeline" in DRM, can you rename this set of
>>> functions to avoid confusion? I don't have preference for the name, what do
>>> you think about "dc" for display controller?
> Could you give a link to lore.kernel.org for this 'color pipeline'?
>
>>> (ditto for the rest of the series)
>>>
>>> With this modification:
>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> The "pipeline" here refers to the display pipeline as in the docs:
>> https://docs.kernel.org/gpu/drm-kms.html#overview
>>
>> Given that the VKMS driver is a display driver and that "enum vkms_pipeline_item"
>> contains those entites, I find easy to understand what we are talking about.
>>
>> What do you think about leaving the display pipeline as "pipeline" and, once we
>> add the color pipeline, use "color_pipeline"?
> These looks resonable. Karthik, could you comment on this?

Yes, this looks good.

Thanks,
Karthik.B.S
>
>> I can rename all instances of "pipeline" to "display_pipeline" (with a lot of work,
>> 100 occurences in igt_vkms.c in 41 patches), but I find it too verbose for little
>> clarification.
> Well, you can use sed script for this but I am afraid that there
> are many other places in igt with 'pipeline' meaning
> 'display pipeline', so it would be a lot more work to do.
>
> Regards,
> Kamil
>
>> Jose
>>
>>>> [...]
>>> -- 
>>> Louis Chauvet, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
