Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1860ECA0FF2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D4110E1BE;
	Thu, 28 Aug 2025 10:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2PtLfxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAE310E1BE
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376726; x=1787912726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=yS7yYP4dPtvZKil1FEqsh1jT55xL7Pvf/Ly2QcvnzQ0=;
 b=e2PtLfxugnYbzfLls1f3svZUZe9uIbvvrMhMqDpFc54HU367r2dL7+cC
 PBdOC20tvax2osJCMimLO47tiEHCVwnhiv5QF9JtKSRsgEeY/bhAB7EFJ
 lwxwWEnx4/LCVNnTCkFkC+gzWl18Mz/uhCdWnFJfeST5KnHvgR+0AmIK4
 MK0GsYlLQi4f7m09NaluLNkSIdH69BkDn8bPbrnbX5V2ZLN1GXB2SYvc5
 YJZWu6PIWFV/xEyJafzSRq7COQDR0EHEh+JICE8SaAWdWHOV0K5jzuR0p
 wkEbJcZi5f4oNN8IdnXiGu7SmKWBfomlbvohd0WJ0XBhjcIUHE2BNmrue w==;
X-CSE-ConnectionGUID: 4FL9pLM8SbOBa908pzpjaA==
X-CSE-MsgGUID: zbTiNWzUTkGw6qguK1yo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="70014242"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208,217";a="70014242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:25:25 -0700
X-CSE-ConnectionGUID: e/RXCL7bSmiXdIyUsLfUEQ==
X-CSE-MsgGUID: rj5CAdniRS220PwjGzIJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
 d="scan'208,217";a="175349285"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:25:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:25:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 03:25:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3ey9J74cFnFuw/aaeLVoWWpJ39QXbHl+OTjVuyph8A0Ir1Dfa83zjZfDKmLwNtX+1e0EVCWWqfMJwKb469PPeuB3xKAifm9xJGWt+2VTsCgH/79vgPviuW6CvZl+ZTU9cuOsFP/aLi0rIDfyG+qqYylGZJy7Ib9PAiLsKe2ME96D0idAshBiKGjXQuyVH+9BC544+7aqgbKjK7ecKTktMbnPaZ6qp7Yf/feoAPxO0AlG42G0kgJ5HuEx0rcWdZa2E5PrMj0XXdQ/xbPKRwyvtCpYmThMXkZFlJxgl93+lrvI4uoVrQHw5D8EDGWlWtfX6MI+j3tmPeaAm+hf885yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygC8R9zXwxxnkcOXUgIH5ixmKm0cMgLxNQ46LpYROMY=;
 b=u6x7lOTTWUO7aOjKVtjKlMAgv7ksA6YFe5761Ub4+7o1OX69jFIR7sbo0hdL9S2DVEEpr+06TWI852LrXe2lw7LWjY5JkvGKn+q32I3bqSr0s2kapcq2EWZiD3H0IbA6tmRE3PMd8XqXCFkSM4GOKZiMDs2D67JysQ6HaaXdmSxnvPYv5gNni4bCzah7p+99yVoeQTJLYowk2rUigm1pNiILn9hPN4LCOdOkXFBDlvW81LQrBMKCc4UaYQDN8lg82rxwiCqoZT3mWTKl2GBfKJx1ETElUeJzARxou0ANlX+aAOyuWLsi4srhotkSsk+xGffI0RkdPYRsJFibhmef2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA4PR11MB9131.namprd11.prod.outlook.com (2603:10b6:208:55c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 10:25:21 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 10:25:21 +0000
Content-Type: multipart/alternative;
 boundary="------------ctu3jPhpt00mVKQJcB079zgU"
Message-ID: <78ababa0-6910-49b8-9dc3-7efdfda8353c@intel.com>
Date: Thu, 28 Aug 2025 12:25:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Skip media GTs when
 reading LMEM provisioning
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250826192555.465679-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250826192555.465679-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA4PR11MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 148f421d-5412-4fae-2530-08dde61d3118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE5TRHJvQkxhbzZybEFJMXh5WStTK0lOSkVqKzE2YUxyYkJ0SGtXdG1odnYz?=
 =?utf-8?B?VENFRnhsMHpVK1F0TWxaMFBLbGRJZ251eWpmZVB2WXZ5RFpoS1N2c1ZlL1pL?=
 =?utf-8?B?cVo1dnFkQ3JLQ1dQdm0wbWhramh5Ym9NZkxiN2tabURzRjlDblVLWTFDQUJK?=
 =?utf-8?B?TmhwamFjRnFJVmNKM0xDOUpFQ29sR3R0TkthWlFQUDU5QzhWNVRHeFNncjIx?=
 =?utf-8?B?bThBcTVoaGtFKzJycENWZnFxMlpwRzRxSWljRU1kTFg0bFROWGwrWmZwNHZ5?=
 =?utf-8?B?eDlKemxZRXg1OWNFSzVkSWdnd1pjUGdpaFEyTkZvM3BEMml3WkJmVDBaS0hZ?=
 =?utf-8?B?Z28xeXFtOHdpVkpwL0E1Tm03b0ZMeUVOaEN1cWg4U2g4TXlkams5bHRBdkZw?=
 =?utf-8?B?MU8wcjh3ZkJzVDF2LzhCSGgxQnVDMlY2b0hXRHNJN1QveFlIendsZWhiNU5k?=
 =?utf-8?B?R1ZXRHJFT0dFMCs5OUZEYnBqOVhSQjVQV0RVWWNRTXZpckwxQ0NPZllRZFNu?=
 =?utf-8?B?aktKczd4NDMwMzVFNWdTREZ5M3o5bHFXejNtQ0IzNFNEMXhjZk45OVhxeU1H?=
 =?utf-8?B?UEZ6c0czbHczbUVCRDR4OVA4T1pqWnJzWkxZbkNaOGVySWE5TzJ6cVZoNUo5?=
 =?utf-8?B?ZzFJdVRrMWtkZFg2amxNOHBJd2liSjRmSkkxb08xd1lXRmNObGxsdW5uK2I4?=
 =?utf-8?B?ajc5ZTNBSmVkTUx3YzhDNEF5ZVpsdC85bmpNcHNIa2twNS9HSytsdlpIQ3ht?=
 =?utf-8?B?T2tTQkJ4UUZvaEhOUkZMbDhRb1dmNXAzZ0YrMDNkY0JIeWNmLzQwK0IvdDk5?=
 =?utf-8?B?MU5SMmJVeVMzNlZKUDN5RzNvRERuTFRicnBRWUtRV1FQNDAyWGJEbC9WSld0?=
 =?utf-8?B?M1ZsVTgzUDg4a3VrMkZXTVlWWnhtTThCTHpyRFgyZ1YzeEh3QmN6MVNjZVJS?=
 =?utf-8?B?NmczVUtBTWpwcjhSMkI4Nk80UklYbjhPdFE5VDl1b1pFMFdyVUU3dkp6dncv?=
 =?utf-8?B?RDZqS1lDSmpBSlFQTnBQWXFsOFdsS0IyWEVpQVNaMSsxcTR4Q0VoTU1SN3Jh?=
 =?utf-8?B?dEFUeFZ5aW1qcEVvNTBneUxxU1lWVVd3ak9QdUl0d0dDY0p4cDFJNGxhelB2?=
 =?utf-8?B?RHJxSVNXcHk4SU5ZRkFueTRoMmJzQTVDSmphUnBPYkdrWFh6dHd2MldMSkk3?=
 =?utf-8?B?aElsN00zaVpheTd3VEZWSzJKSGZlbkpDL2VxMlFySjZXWWVmTUMvaG5FNkFp?=
 =?utf-8?B?RjE1Z0JpYUVQamMvaDNLbkZibVAzdzFpeHczYk9INEVqZiswUUZhaFRlNWND?=
 =?utf-8?B?bXhpakNQd3Y2dHZyYmNTSmJsUTgveTZhcUdpeU90NWlGSU02MDVoTHI4aW9l?=
 =?utf-8?B?SGRqSlVONUxVZVpJQjNnV0dBdWh0U1VZRG1JbC91d1lWMzNqVFZlRjN3ekdQ?=
 =?utf-8?B?b1ZFdE9QL2c2czVTWERsdDRSWEFtckZSVUx0SEpLYThrd3ZnQkFsSndyWUo4?=
 =?utf-8?B?a0pia1YvYWNneXdYM1R1cVhYalYyOGFKbDJFTk9hMHNXSGxPTi91RE51MGJN?=
 =?utf-8?B?bUtRN1Jza0JJTEtta2tkdWRyWjh3MC9kOVI5b1dMNWtCK0x6TlNRNjBPK2ww?=
 =?utf-8?B?QkhJeTNubWZlWjhwMzFxR2wrd2dkNkVMaWZPY3BLZFU1aUZoWk1CQ1JIU2g3?=
 =?utf-8?B?VWNlV0MxL3pOTXFhN2g0SmZlbFQ2SFFSS1ZjUDRQOG1BbkhUTWQwZGVrUlZh?=
 =?utf-8?B?NlJ2S041ZTZJbXRuTkN4UzNUSnlIbE1iTXk0ZjJzTkgzQmdpV1I0NktHZUh6?=
 =?utf-8?B?NnNla1laYnYzYjMxYmZEc1ZqRm14ZThXSUphNENsSDJ4amlJYSt6UnVjdWEx?=
 =?utf-8?B?RFVWdU5zTHdKNXM1cXpjUUFOZUh6cjE2T2twdkxtbzVwWDM0eXhVWk5PMGdQ?=
 =?utf-8?Q?yoRKONyouN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enl2b1lHTkZmN1hHVUNyeGxqbWVmd3Q3dnkwSnZsM1R0WTRtK3dQVmhtaDlY?=
 =?utf-8?B?S3ljSVpsMTY1YU9USmkyeGp2b01ranBNeFZpT2daZ0tQVEU2K1VrcExqdHFC?=
 =?utf-8?B?cmNBbnF6ZXo4Y2RXSVU4bG16cm94c0hxdlNySE5mZmFSZVhLZnNweDZTSWQ5?=
 =?utf-8?B?aXdUS2xHdURUM3BoODJCdHpqcnFIZDZyb1g5eUp1TWdSM2xNci9pZHlmZHdh?=
 =?utf-8?B?UTIvS2hENXNLVTAxU3VmZTRoWE95bWRKaFZuUllQWHp5dVNtSG90Y2VCQlc1?=
 =?utf-8?B?OHliUllmWWQ1YkozckxCTVowNFZ6UlJhS1NwWUNuUjRUMHViUy82TVlOOWJ6?=
 =?utf-8?B?ZDc2UEx6TUV0SFRRUjluT0dUVUFPaW1RVG5uUlVOb1VEWnZLWEczczQvUnV6?=
 =?utf-8?B?TDBJSlJpOGxBS0lwZUpHTDIxcWZZRGYvZnpMT20xaDg2bmdzejlrK1F5QTAz?=
 =?utf-8?B?STVhb3htdHYvUksrSlZsN29wTzB0QUZwUmdTSG1Kck40aHlmd0NUOCtnOHl4?=
 =?utf-8?B?T2J0NXNUUndzV2srenI1SWJKbUZnNlV6Uk9QVHFrdGJFQ21Xcks1RHVIWm5h?=
 =?utf-8?B?NElSdVJERi9ONTlJSkowUGxDM1NEMmFZa2h6MG9WbEMwNWthNFJYeDJUem1q?=
 =?utf-8?B?U0NWWTlmcmFKRmZoc2I1d0hQSnFMQUpsZ0FuM3oyK2x2eFRraytkejN4L05J?=
 =?utf-8?B?N3ZYeFNzMTBRQzBOTG1aeFV4aHVlV0w4OFo0bGtYUjRxMkhFRk81bFIrenls?=
 =?utf-8?B?aUUxVGxIOFlHOUcwMDhmOE9RdDZpMXBqUXJncmF3WGVOQ0FtNERrbldzVE12?=
 =?utf-8?B?OEJ5WEhNWFIzWTdDUE15ZU9ZT3RqeTlVTGdDSjdJQk1XSHBLa05qbW9oaG5r?=
 =?utf-8?B?OEVGbS9Xb3JxNE1LRGFEeVdKMEdnVWNqUWt4VktxU0VWdHA5SlpoMzVHREpx?=
 =?utf-8?B?aTh2c1hVMWV1NmZPV3R5Y1NUVm1kQlA2M3JDWldpSUhMWVloLzdLOUlhRko0?=
 =?utf-8?B?eENIN2tocVVHK2lmcUlHL1Rkc2R5N1BEbmRkb3dhMDhSbS9IYUZBM0loZVVs?=
 =?utf-8?B?VG9tbjlPdVRSZEFoM2I4TGd4UUNJWjFZbnZjcDhwNUMvVVBYRnNObnYxKzhO?=
 =?utf-8?B?NG10NitJelp6WG5sc2ZHV2FNUkIrcGpEYWJseTNubkhVekltczVGdmxxM293?=
 =?utf-8?B?QTVKQWtQV2dLOTl4aW43aEI0QkdFeEZqZGpvZVlkWUJvcjE2ZXpUYnBFeHpV?=
 =?utf-8?B?NEVIQWlVb2g3NExaQmlYOENMRmJDVW80R25tQi9MOWN3S0ZIcmJrdVZaTWtn?=
 =?utf-8?B?Z2h1NlJhUWxaVUMxVzgxZzMvWlhNUm5ZTGppTVoyM0ZOd0dEVnBhSnlmK0dS?=
 =?utf-8?B?ZE14K3RSVWJBdnhrNkNwMVJDOGp6T2RjelFOTjZLQ2hDQjdCaXkxQ0pPbDZn?=
 =?utf-8?B?WHloMGVxNG4rU0tOb01odVFZYW9hUDdJMC8rSk9qV1M0cjJDaWRMWnpnSXdG?=
 =?utf-8?B?NEVTd1RnSUhPUmhYYVBEcmcwT3V0WS92L0dhOS9ZTVJkOWI4dlY0RmhrS05u?=
 =?utf-8?B?NnZkRnhheW5FSjNnMzQ4QXJnSitRbWdhVkhTUy9kRUZMOXRQd0xVbXE0bDV6?=
 =?utf-8?B?cHQ1SyswWGpsMTUzZmNZR2VKY3B6NUE1QnNWajZ0MlF0dUxXdGp0dWNzbzJz?=
 =?utf-8?B?NnBaUllDNHFsb0xaWU4zVHVMUkJaV2M3TEl2UGlOZms0ZHlDZW9SREEzWG9s?=
 =?utf-8?B?T0hqckhJZHZURVR0NXd6V3hXN09mZGFKQlU0OUZwZHd0aTdyNlVXSzFiM3Mv?=
 =?utf-8?B?VXkveGZQeENXTmhzODcrV1d2MFNmc1NreDhzYnkrUXVaZnY5bjhOTFFmbG54?=
 =?utf-8?B?bzZXMno1SWlDcTNidlRjdXBsRWgxdHJZenhITC85MzF2ejh1Y2NkRE5aa0x1?=
 =?utf-8?B?Q1ZkSklEMGYyWDMzUmQ1Nmp4czB1cStRWGZ1SmR0U05KTkp3OFZWb0tZMzFn?=
 =?utf-8?B?TzFwYzQ3aXgvZHdmNGpzM01JU3NvNUhmc29PbFZsRGVmYVMrZEw5WVVuZFJC?=
 =?utf-8?B?SExZZ3RrR3FSOWZoT3hFc3RLcEIxVS9pQkNZbDEwUWFFZjdRUkVZK1Zrc2Z5?=
 =?utf-8?B?eDc4dHREK3ZMSXMzSkFrVVVTdkZEdFo1eUtVaE1ZeG55RjlHalUxZVBGNGhP?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148f421d-5412-4fae-2530-08dde61d3118
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:25:21.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72wK/tJHi+1hYYR8ljocJFvyKGc6WgBeGXkl43X+dXEEZcnUzdeKST7H2MAPsmAyTTcp/8+DXpB5enkCxvW19g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9131
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

--------------ctu3jPhpt00mVKQJcB079zgU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/2025 21:25, Marcin Bernatowicz wrote:
> LMEM provisioning is exposed only on the primary GT.
> Media GTs do not provide LMEM provisioning data,
> so attempting to read it there caused the subtest to skip.
> Restrict iteration to non-media GTs before reading LMEM provisioning.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index fc08703c0..248dcf6fb 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -813,6 +813,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>   	igt_assert(ldata->vf_lmem_size);
>   
>   	xe_for_each_gt(data->pf_fd, gt) {
> +		if (xe_is_media_gt(data->pf_fd, gt))

This data is available only for the main GT, so I would suggest changing 
the condition to |!xe_is_main_gt()|. That way it also covers potential 
other non-main GT types in the future.

> +			continue;
> +
>   		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>   								  XE_SRIOV_SHARED_RES_LMEM,
>   								  gt, &ranges, &nr_ranges);
--------------ctu3jPhpt00mVKQJcB079zgU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/2025 21:25, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250826192555.465679-1-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">LMEM provisioning is exposed only on the primary GT.
Media GTs do not provide LMEM provisioning data,
so attempting to read it there caused the subtest to skip.
Restrict iteration to non-media GTs before reading LMEM provisioning.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
---
 tests/intel/xe_sriov_flr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index fc08703c0..248dcf6fb 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -813,6 +813,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 	igt_assert(ldata-&gt;vf_lmem_size);
 
 	xe_for_each_gt(data-&gt;pf_fd, gt) {
+		if (xe_is_media_gt(data-&gt;pf_fd, gt))</pre>
    </blockquote>
    <br>
    This data is available only for the main GT, so I would suggest
    changing the condition to <code data-start="151" data-end="169">!xe_is_main_gt()</code>.
    That way it also covers potential other non-main GT types in the
    future.<br>
    <br>
    <blockquote type="cite" cite="mid:20250826192555.465679-1-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+			continue;
+
 		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data-&gt;pf_fd,
 								  XE_SRIOV_SHARED_RES_LMEM,
 								  gt, &amp;ranges, &amp;nr_ranges);
</pre>
    </blockquote>
  </body>
</html>

--------------ctu3jPhpt00mVKQJcB079zgU--
