Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF54C3DA61
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 18:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6410E78B;
	Wed, 24 Jul 2024 18:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cxgeu7rF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C444A10E78B
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721844783; x=1753380783;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=GUVIDXVbiM7wjxyDdyxH8uSKbMTCM+g1yDo1/TDXIrQ=;
 b=Cxgeu7rFVEn0Oam7HovwNkxqAA6ETYKt42P9KsvBcz4AwPMF7/q2jcxH
 hzOioKyS99PXTmbMD4xL+jZAukvLG1ltBZhEyBrXNI4Io0aDgrsUb2vAl
 UfG1PWbTHDzjdiGiv9QNYgP/YZ0wyXnRYKWEBjId2NGRYBUnDUDx6qYkm
 jFSA7nO7RqmjHe0eCSYA+Kfianlp7aanm2HTw1k3ruuZ2RABd4Ws1CPEE
 oZEdQxo+Oxqwv6FT6SvwwblzD5bbxcpBrR/UMXMhg1Pli0fY/XAjMNCJE
 8ctUy7yfSoFFjCSvwnKdOGOpGiRdwhdQ3nVrMs1E6H4Q5W5yV5SfsiNym Q==;
X-CSE-ConnectionGUID: 9/wWwgxZQe6Ehhcq5XaNcg==
X-CSE-MsgGUID: AB5c4wOoTVqvCUmVCb8yOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30148532"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30148532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 11:13:02 -0700
X-CSE-ConnectionGUID: /LTCRscAQGKC40U9JFYkbg==
X-CSE-MsgGUID: R+HbJogpSQqkgGdeYIgNaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52362057"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 11:13:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 11:13:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 11:13:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 11:13:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 11:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRF/AkAEBDTCqEkvr2jp4xv0zZwdu2R3VclpCim1W3DvGaKc56JZRtgw83GVk38ecMgN/lSSiigAuW6MBQlxyL3qMGzRli1jB+f6CQ2bdK/51NPDPJIQT8i2Wihfo5hil8BWAoJie47zUGAqpbsnbZHyzNa7JEgMy4tWw037WHkPd1iLg7KFQTcZyW1DCvfm0qAwRdiygqDo2IIoingCHrORSnOfZVvaW+VHHd2Fbj253QMTlQcZR5A8AC7N6gegdLCOj9uRn0/SO2bM5s8nD4bJ9V1r9JI72Ksk2R84ce6C1mjmlas7uvzrq5zBTMU/RDeX7A/HE0cuFhBhofCzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRmM52JTAWBbW3k/DAYQsAed4vToRhjKm/OmC+gDkAU=;
 b=w7pdeDu9n1BUmqXFq/sgUmsaVrrzuQsar3jrSHrxHt5Pa4ZTcAGOEF4O+32g1dfen9SmfroTrB7PTa2sTyfs98zMaIKFaVz/Hy59VKjYgQ2E40McoZ//rO3WDNSEddM+QFAQ4JhAI4pt0n80yKWoUaM0K3UJVCGhEIEMswK+zwJuE8ZT9+2PJqXHBGYb5AxEojPr5Si2xon6jqmpZ0g6HIQbiRI/uHq9m/XjEeiCHy90LSvWSiiXGsis3YxukU+Hyv1ijUrM+S+ZrQ18SaHqYO0y1bSP6O6fLfyhRDRaBbcIo5hcUgF7o6BHiDOEdqC3GG0XWAoKAClz6DFCNXXDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 18:12:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Wed, 24 Jul 2024
 18:12:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <vmcmprgdzmvjpd5sf7twsatgpi7n3b7aiyz4a7lytiewnk2exq@46gtajd43xah>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
 <20240621195150.390462-4-gustavo.sousa@intel.com>
 <d2bmnw6jnz4encqian5z4xy5uk3f3kmigew7zjdpjsuq6ud5p3@nfsu3lszt4eo>
 <172183958665.1506.3418213799642416402@gjsousa-mobl2>
 <vmcmprgdzmvjpd5sf7twsatgpi7n3b7aiyz4a7lytiewnk2exq@46gtajd43xah>
Subject: Re: [PATCH i-g-t v2 1/7] igt_hook: Add feature
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 24 Jul 2024 15:12:48 -0300
Message-ID: <172184476882.1506.13974384524333983145@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c3824f-8f62-4627-f65e-08dcac0c3da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk8rNk5QYVI4U3JiYjV2NGN2VVZoUlJ5R2pNNXF5MG9BVEwrV1dWY09GS0xX?=
 =?utf-8?B?c0VOU0dHVXNuWDJNTS9TWHNrLzNKWUs5UGVUVUV3SzRkek90M0NHM2NSQWhE?=
 =?utf-8?B?bUJYbThLcmIrUDFMN1drRnNMR2pQMFlDWHZPMkIxUHRoaDE3YXpOeThoeDRp?=
 =?utf-8?B?TlBac3FERjdBTUVTRzUyVDZaSDgrOFJBK2o1ZFRZVG1xRG5neGc2K2RjZm1y?=
 =?utf-8?B?bDN2NDlpK0NJd3NsV2NLamlQSEl3L1h3Q3JBSzIzSGhTYUJsQ2lYYmgxSEJq?=
 =?utf-8?B?RzRjNzA1eUdLK0NqVzI1WG1XYkIwZk5tVW5rU29hQUNkaUZ1bGkzd3JXb1Av?=
 =?utf-8?B?Y0hhWklMT2x0b1JOc2hxWWk2aHg3WUtpTmhwT2dJeDVoUmtIdXBOT2luS3RS?=
 =?utf-8?B?Qk1yV0xzOUdheXgycUdiUjJrditFMWN6bldRdHpLaTM3U0xLbE52TFJJTlJW?=
 =?utf-8?B?MlphVVV5K2t1UXYydDFWMFBQbi9BVlZQek95STZPZmNWQUIwL05kbCt2OFc5?=
 =?utf-8?B?cDBkMWZuaFdTckZVN2c4K05CdCtTd09kTmNrWCs3d2w2U2ZMd1NnamdCUzRJ?=
 =?utf-8?B?RGNuMG1BdXZrbDZzeDdYV04vbkdwRlhsbVY5SXQ1TlhWVjFGMnNpbEt3S1Fj?=
 =?utf-8?B?RGpLYlhTSHY3WkhjZFpEaG5BSEdWdmFPcmNZa3dQMWNLekpsQnBldU9HZ3NS?=
 =?utf-8?B?dTltWkdlb2Fpemp3d3FqWTlicklKUTNYQkx1SGJqZHZFaWY5YlNaczMrd3gw?=
 =?utf-8?B?Vm42WW1XTUFvUEhDRjZ3REVIN0VwNVBDM3FpaHhqcTk1SnRBdSsyVEs5UTFS?=
 =?utf-8?B?ZVZpSC80OUpTNDAweU5uTThtVi82dUs3WGxRQit2Vis1ZUlLUGxHZ0o3L1lD?=
 =?utf-8?B?a3hDaDVTM0NNNWtWZEcxdllnWDA4Sms5UVgyNEYwMDFZTmJDSk5qKzdkeDNO?=
 =?utf-8?B?NWdVd2ZVYW9RcTVCdXp6RXk3c3orUjV0VzVNRHgxUVlzc3M1U0JLdTk5QlRM?=
 =?utf-8?B?emVzeVBzRzZEcEdwcm9nQ1VHRmRIeFU5N2Z5UFB2MS83bkxUbkplUUpqQmtF?=
 =?utf-8?B?VU1BWHloejJ1RDB6L1hkLzNWVHpFYzk0TDZoaWpuY1UyL3VWcmlGb2ZpczR4?=
 =?utf-8?B?MjNXYUNPZ2xIR212d0lmVlB0Q1EvSlVOZkpjbzFaandicWV3UjFwN2VSSEhm?=
 =?utf-8?B?ejRhWmh1SGJneFJnWGV5eGl3QmtwUi9yMU9XbTY1Vis0WnFZVlZYckZQVVpH?=
 =?utf-8?B?aUtIT3RSSzRzTlEwcDE3VVVWL2JxVG5nWjA1MnpNd1cydkJubDJGZnpTMjB3?=
 =?utf-8?B?ckhyN0hrQzRpYWk0R1h2Ym1xQ3RXWTJoakFIU0phWE10QWVtSFllckJiNkxi?=
 =?utf-8?B?a3RHclU0eWhNa2piY1VSMDB2T0plWDNZajBJMzBXeDA5cUljcThiSDhZQURN?=
 =?utf-8?B?MzYvNktlVEdMNmh3TDQxOWFMT2l3TXp6Y0ZMME85dXZPUVNqSy9IN2U5bFdz?=
 =?utf-8?B?NXJ3TGtEVTdnaEtrenlJNG1aOUpOeTlUQ1B4YVROMFdqaDd4Y0g5czhEMDJM?=
 =?utf-8?B?dHBiamJUSzgxQUFQTUxsTVRLZ0VXSmoxNUNYM3c1WTEwQU9uM2VMV1FLaTYy?=
 =?utf-8?B?M0J6djJaQmsrb0duK29hZDhSZ0ZWcGh0M25reUJJY0x3YTBVK0xtQ3preWFo?=
 =?utf-8?B?K2JuUkc3U3JRYVQ2YmlqMkwrK0Z5cW5kZTR5SEo2ckRTRGZoQWFFMTNtMkE0?=
 =?utf-8?Q?VWlbNZ94ZeXRpVJ0Yd85sZ51Ge8q8CMptsgRh6/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBGQWRRZHpYbEFtZkx2UzFkU2NwdXFmWVZjRW5lME41U2hpdFVwaTZ3bTJE?=
 =?utf-8?B?RUFIYktpaHBwNmNSc1drRThndzhLTXVhQjVCTDRVZTU5aGRsQWdjZjhXNmJT?=
 =?utf-8?B?aTgwNm1ydWpTMFZKY2JkRnlqK3dZTUE5RjJmTk9QMzY3YWphR3ZSL1VxTWFS?=
 =?utf-8?B?aC91QzhQSHFzUTBYQWVtN3I1YU14RWRnNVVUOGZ2TXFwUlcycVJxc2RIOTMv?=
 =?utf-8?B?U29vdDdTWmRqQmFHa3NMVVd1Y1hGdHl2RzBuV2VSeThXWUxOT2dCalowdFk2?=
 =?utf-8?B?MlQ2ait4LzNudGp0QklnR3RHSHM0M0xrYnJyWCtyMFdnanZIQ0MxOXhIaVZH?=
 =?utf-8?B?Z2Z2Q09iZklQOFM5Wnd0K2xCa25PODNyRHlCdVZuVitpNFBiWmtqVTNlQVJz?=
 =?utf-8?B?VXVuZHA2aG1FOHJFeERlMlBGNklYUlRacEU2alZsclhWeTJZZ2xSOGhXQVBj?=
 =?utf-8?B?N21tUkZ3M0NnT1NnaTRkL0VWTUZuWTA0cUlEMXhySlVIdW5DdlNGZlVDSjF2?=
 =?utf-8?B?d2VSWk5WbmxmYlUrNis5bVhmdC9hTXFuMWgzMHZYMU9Jb0lFNXpkbVVBYkYw?=
 =?utf-8?B?QWZIRlhhTDJFSUllQ2x6TXUvYXdFVTRJR2lML29rd1YyU3VoUUR0NXMyeTV5?=
 =?utf-8?B?ZmpMQkhuZzUrRUsxbFg1QzcxYzdIdHV4N1dNaTV4SmNwa2FrZ2VreHlMZUZZ?=
 =?utf-8?B?UGk1UlVETzAxY1dNaEdDUDgyUkZiZlpGdzBZRms4UisveVovYlorNUUvbFM0?=
 =?utf-8?B?N0NVdjdKTFVSeUZHT055UlkrREUzNDl4dVVJVVBjdy83WnZQa1pjbElaYk9G?=
 =?utf-8?B?ajNRM1Evei9nYVUvU0N2UWZwWVRRZG4zaTNrOVhCY3lXOU4wTng3cmVZVzQx?=
 =?utf-8?B?RlpneThJbEUxRE8xb05TMnI2Ujd5RWxXOVlWN3I3ODQrTUtBQ215ck1sNXF4?=
 =?utf-8?B?QlArK0NnMm1ZVGtqRzRkRVdQTTB3dkNEUHVxY1haZjVyU1B2TXp6ZGFFSERm?=
 =?utf-8?B?UzA3Mm52cVF5MHRUdVNGcEtBNk9XSXYvSW5jdWk4NGZHTHBsNHJWTTUrbnJp?=
 =?utf-8?B?Q1daTEdKR2t6MVB3NXNRSFd2MVVkalRuWlo0QTE2RVY2Tng0VFJ2WXNqenAv?=
 =?utf-8?B?OWt5RDhHeEllY0w1bkRFSVVUTDdEUnpGaEUyaFRDM25zVjdwZkpFS3RIKzZs?=
 =?utf-8?B?aGZpcElyRkNranl5blp6b3Q5NTAzWDFBb3E1YVZDaUdaaXFCQTJ2bGN3dllo?=
 =?utf-8?B?NExuNzY5aTRxRm5Bc0JTblhHamJnRGozdjdiTDVKVTAxYkhiNFl1LzBKNDVi?=
 =?utf-8?B?WWlSZVREdXpoRVNoRXN6UEdWUUQ4Y0Zzb3dkdlNhTE5XandTUUtlL1NpMWFR?=
 =?utf-8?B?RE1WL2pIck1SUkNaYi9TTGVoeXhnSW9oM3BvTE15RnZyQVJzYVZRY25GNjRI?=
 =?utf-8?B?YlNJRXBXY2JZRlU5bXpsaHRuVGcvNGVXSmVXNWdTV3VQcVpMN0UrMTFiWjE0?=
 =?utf-8?B?b2pQU2xNUTRkQ29UMWVjcGk3WmlYbW5sck8rUjhZYy9zOWoyS25uQXE1YU0x?=
 =?utf-8?B?Ti9iNG9lYWNFdU5NQ1dOczF6WXkrTk03WVdHejFVZ0V4b2VWdHRGR3dJMFdw?=
 =?utf-8?B?WFJJSEthUDh5ZkRCNldWRW11OE5sZHZUYlpURlBtcWFPaTBaWElraEpQaCtF?=
 =?utf-8?B?dUtsNi9EbXp3ZnN6dnI3TS93ZXhQUjRMSFJKVlhDdC9XQlcwR0FlVk5aMVFh?=
 =?utf-8?B?cWovVHdNYmtkQWVJM1pVYkg3MXB2WDFvdmw0QWNhRWRKcnp2bVA3dXJVaENM?=
 =?utf-8?B?QjAxOWV6OGx0ZGw5Z0tlcm9CS0VlZHkwRnJyYTVUVUsyRUUzNDkrQjJEUTI1?=
 =?utf-8?B?T0VKTUd1RFFPcFZVL3EyRU5NRmxlVTczREMxbjBRWVZwYzhBc2hSc043ZXl5?=
 =?utf-8?B?aEJjZ29zTERFSUpTa1BPanJrREpMNmtBdkJWOXFHZTI1Q0xKTW4rcVc1TW1G?=
 =?utf-8?B?aEY1NTFrWkNCV1BDNnQyS3RTdEF3VzA3Z0hnNVZieEJ2alUwaDZ3RTJVLzZt?=
 =?utf-8?B?enNzMHJRK3p2Q0NYYzZWeUZCK1ZQVEhjcy8yckhTaC9hNE5LNkhpc1V0OGc2?=
 =?utf-8?B?Y1hyQU8vQzBXNkZPYjUvRUhGcVFHalQ3Sm93dElVZGJTb3p2Y1lyT1NMd3Fz?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c3824f-8f62-4627-f65e-08dcac0c3da2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 18:12:55.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2dA+35EWcR6J6V7rEi72xInVc4bAUeGW1CXZTdEpcJwhwYWaADEEovhG46Q3YSmwNdxIN/xXyKht8ntMa8miQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

Quoting Lucas De Marchi (2024-07-24 14:29:30-03:00)
>On Wed, Jul 24, 2024 at 01:46:26PM GMT, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2024-07-03 16:27:10-03:00)
>>>On Fri, Jun 21, 2024 at 04:51:46PM GMT, Gustavo Sousa wrote:
>>>>For development purposes, sometimes it is useful to have a way of
>>>>running custom scripts at certain points of test executions. A
>>>>real-world example I bumped into recently is to collect information fro=
m
>>>>sysfs before and after running each entry of a testlist.
>>>>
>>>>While it is possible for the user to handcraft a script that calls each
>>>>test with the correct actions before and after execution, we can provid=
e
>>>>a better experience by adding built-in support for running hooks during
>>>>test execution.
>>>>
>>>>That would be even better when adding the same kind of support for
>>>>igt_runner (which is done in an upcoming change), since the user can
>>>>also nicely resume with igt_resume with the hook already setup in case =
a
>>>>crash happens during execution of the test list.
>>>>
>>>>As such provide implement support for hooks, integrate it into
>>>>igt_core and expose the functionality via --hook CLI option on test
>>>>executables.
>>>>
>>>>v2:
>>>>  - s/igt_hook_init/igt_hook_create/ (Lucas)
>>>>  - Use SPDX License Identifier instead of license text. (Lucas)
>>>>  - Do not rely on hard-coded length 3 when generating full test name.
>>>>    (Lucas)
>>>>  - Do not pollute current environment variables when running hooks.
>>>>    (Lucas)
>>>>  - Change hook string in run_tests_and_match_env() to use "printf"
>>>>    instead of "echo" to be compatible with CI environment.
>>>>
>>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>---
>>>> .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>>>> lib/igt_core.c                                | 116 ++++-
>>>> lib/igt_hook.c                                | 489 ++++++++++++++++++
>>>> lib/igt_hook.h                                |  69 +++
>>>> lib/meson.build                               |   1 +
>>>> lib/tests/igt_hook.c                          | 170 ++++++
>>>> lib/tests/igt_hook_integration.c              | 281 ++++++++++
>>>> lib/tests/meson.build                         |   2 +
>>>> 8 files changed, 1120 insertions(+), 9 deletions(-)
>>>> create mode 100644 lib/igt_hook.c
>>>> create mode 100644 lib/igt_hook.h
>>>> create mode 100644 lib/tests/igt_hook.c
>>>> create mode 100644 lib/tests/igt_hook_integration.c
>>>>
>>>>diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs=
/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>>>index 9085eb924e85..11458c68124b 100644
>>>>--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>>>+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>>>@@ -32,6 +32,7 @@
>>>>     <xi:include href=3D"xml/igt_fb.xml"/>
>>>>     <xi:include href=3D"xml/igt_frame.xml"/>
>>>>     <xi:include href=3D"xml/igt_gt.xml"/>
>>>>+    <xi:include href=3D"xml/igt_hook.xml"/>
>>>>     <xi:include href=3D"xml/igt_io.xml"/>
>>>>     <xi:include href=3D"xml/igt_kmod.xml"/>
>>>>     <xi:include href=3D"xml/igt_kms.xml"/>
>>>>diff --git a/lib/igt_core.c b/lib/igt_core.c
>>>>index 3ff3e0392316..6463a5bdcae5 100644
>>>>--- a/lib/igt_core.c
>>>>+++ b/lib/igt_core.c
>>>>@@ -70,6 +70,7 @@
>>>>
>>>> #include "igt_core.h"
>>>> #include "igt_aux.h"
>>>>+#include "igt_hook.h"
>>>> #include "igt_sysfs.h"
>>>> #include "igt_sysrq.h"
>>>> #include "igt_rc.h"
>>>>@@ -241,6 +242,9 @@
>>>>  * - '*,!basic*' match any subtest not starting basic
>>>>  * - 'basic*,!basic-render*' match any subtest starting basic but not =
starting basic-render
>>>>  *
>>>>+ * It is possible to run a shell script at certain points of test exec=
ution with
>>>>+ * "--hook". See the usage description with "--help-hook" for details.
>>>>+ *
>>>>  * # Configuration
>>>>  *
>>>>  * Some of IGT's behavior can be configured through a configuration fi=
le.
>>>>@@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
>>>> const char *igt_interactive_debug;
>>>> bool igt_skip_crc_compare;
>>>>
>>>>+static struct igt_hook *igt_hook =3D NULL;
>>>>+
>>>> /* subtests helpers */
>>>> static bool show_testlist =3D false;
>>>> static bool list_subtests =3D false;
>>>>@@ -338,6 +344,8 @@ enum {
>>>>         OPT_INTERACTIVE_DEBUG,
>>>>         OPT_SKIP_CRC,
>>>>         OPT_TRACE_OOPS,
>>>>+        OPT_HOOK,
>>>>+        OPT_HELP_HOOK,
>>>>         OPT_DEVICE,
>>>>         OPT_VERSION,
>>>>         OPT_HELP =3D 'h'
>>>>@@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
>>>>                 bind_fbcon(true);
>>>>         }
>>>>
>>>>+        igt_hook_free(igt_hook);
>>>>+
>>>>         /* When not killed by a signal check that igt_exit() has been =
properly
>>>>          * called. */
>>>>         assert(sig !=3D 0 || igt_exit_called || igt_is_aborting);
>>>>@@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool =
output_on_stderr)
>>>>                    "  --interactive-debug[=3Ddomain]\n"
>>>>                    "  --skip-crc-compare\n"
>>>>                    "  --trace-on-oops\n"
>>>>+                   "  --hook [<events>:]<cmd>\n"
>>>>+                   "  --help-hook\n"
>>>>                    "  --help-description\n"
>>>>                    "  --describe\n"
>>>>                    "  --device filters\n"
>>>>@@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
>>>>                 {"interactive-debug", optional_argument, NULL, OPT_INT=
ERACTIVE_DEBUG},
>>>>                 {"skip-crc-compare",  no_argument,       NULL, OPT_SKI=
P_CRC},
>>>>                 {"trace-on-oops",     no_argument,       NULL, OPT_TRA=
CE_OOPS},
>>>>+                {"hook",              required_argument, NULL, OPT_HOO=
K},
>>>>+                {"help-hook",         no_argument,       NULL, OPT_HEL=
P_HOOK},
>>>
>>>I'm not a fan of having --help-*  for the additional options.
>>>I think this is being added because of --help-description? However
>>>--help-description should really be just --description (or removed at
>>>all since the tests aren't documented like that anymore, which IMO is
>>>sad).
>>
>>Yeah, I saw --help-description and decided to have a --help-hook. But,
>>yeah, now that you mentioned, I agree that those two have different
>>purposes.
>>
>>>
>>>I think we need short explanation for each option, and then probably
>>>refer to a man page where longer explanations can be given. I'm not
>>>blocking it on that though.
>>
>>That sounds good. Since all options and not just "--hook" need the short
>>explanation, I guess that can be done in a separate series.
>>
>>>
>>>>                 {"device",            required_argument, NULL, OPT_DEV=
ICE},
>>>>                 {"version",           no_argument,       NULL, OPT_VER=
SION},
>>>>                 {"help",              no_argument,       NULL, OPT_HEL=
P},
>>>>@@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
>>>>                 case OPT_TRACE_OOPS:
>>>>                         show_ftrace =3D true;
>>>>                         break;
>>>>+                case OPT_HOOK:
>>>>+                        assert(optarg);
>>>>+                        if (igt_hook) {
>>>>+                                igt_warn("Overriding previous hook des=
criptor\n");
>>>>+                                igt_hook_free(igt_hook);
>>>>+                        }
>>>>+                        igt_hook =3D igt_hook_create(optarg, &ret);
>>>
>>>usually functions like this are done the other way around: the return is
>>>int and the pointer is passed by ref.
>>>
>>>ret =3D igt_hook_create(optarg, &igt_hook);
>>>
>>
>>I'll update to match the above. Thanks.
>>
>>>>+                        if (!igt_hook) {
>>>>+                                igt_critical("Failed to initialize hoo=
k data: %s\n",
>>>>+                                             igt_hook_error_str(ret));
>>>>+                                ret =3D ret > 0 ? -2 : -3;
>>>>+                                goto out;
>>>>+                        }
>>>>+                        break;
>>>>+                case OPT_HELP_HOOK:
>>>>+                        igt_hook_print_help(stdout, "--hook");
>>>>+                        ret =3D -1;
>>>>+                        goto out;
>>>>                 case OPT_DEVICE:
>>>>                         assert(optarg);
>>>>                         /* if set by env IGT_DEVICE we need to free it=
 */
>>>>@@ -1274,9 +1306,24 @@ out:
>>>>                         exit(IGT_EXIT_INVALID);
>>>>         }
>>>>
>>>>-        if (ret < 0)
>>>>-                /* exit with no error for -h/--help */
>>>>-                exit(ret =3D=3D -1 ? 0 : IGT_EXIT_INVALID);
>>>>+        if (ret < 0) {
>>>>+                free(igt_hook);
>>>>+                igt_hook =3D NULL;
>>>>+
>>>>+                switch (ret) {
>>>>+                case -1: /* exit with no error for -h/--help */
>>>>+                        exit(0);
>>>>+                        break;
>>>>+                case -2:
>>>>+                        exit(IGT_EXIT_INVALID);
>>>>+                        break;
>>>>+                case -3:
>>>>+                        exit(IGT_EXIT_ABORT);
>>>
>>>I think ABORT shouldn't be used... this is for when tests can't be
>>>executed anymore due to one of the monitored abort conditions. Not if we
>>>can't create the igt_hook, which is more likely because of an invalid
>>>option.
>>
>>Yeah. This comes from the first version of the patch series, where a
>>negative error meant something else than invalid hook str. This can be
>>removed now that we only error out because of invalid input.
>>
>>Thanks!
>>
>>>
>>>>+                        break;
>>>>+                default:
>>>>+                        assert(0);
>>>>+                }
>>>>+        }
>>>>
>>>>         if (!igt_only_list_subtests()) {
>>>>                 bind_fbcon(false);
>>>>@@ -1284,6 +1331,15 @@ out:
>>>>                 print_version();
>>>>                 igt_srandom();
>>>>
>>>>+                if (igt_hook) {
>>>>+                        struct igt_hook_evt hook_evt =3D {
>>>>+                                .evt_type =3D IGT_HOOK_PRE_TEST,
>>>>+                                .target_name =3D command_str,
>>>>+                        };
>>>>+
>>>>+                        igt_hook_push_evt(igt_hook, &hook_evt);
>>>>+                }
>>>>+
>>>>                 sync();
>>>>                 oom_adjust_for_doom();
>>>>                 ftrace_dump_on_oops(show_ftrace);
>>>>@@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name,=
 const char *file, const int lin
>>>>         igt_thread_clear_fail_state();
>>>>
>>>>         igt_gettime(&subtest_time);
>>>>+
>>>>+        if (igt_hook) {
>>>>+                struct igt_hook_evt hook_evt =3D {
>>>>+                        .evt_type =3D IGT_HOOK_PRE_SUBTEST,
>>>>+                        .target_name =3D subtest_name,
>>>>+                };
>>>>+
>>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>>+        }
>>>>+
>>>>         return (in_subtest =3D subtest_name);
>>>> }
>>>>
>>>>@@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynam=
ic_subtest_name)
>>>>         _igt_dynamic_tests_executed++;
>>>>
>>>>         igt_gettime(&dynamic_subtest_time);
>>>>+
>>>>+        if (igt_hook) {
>>>>+                struct igt_hook_evt hook_evt =3D {
>>>>+                        .evt_type =3D IGT_HOOK_PRE_DYN_SUBTEST,
>>>>+                        .target_name =3D dynamic_subtest_name,
>>>>+                };
>>>>+
>>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>
>>>I'm wondering if we shouldn't make igt_hook_push_evt() accept NULL as
>>>argument so we can use a compound literal like below:
>>>
>>>        igt_hook_push_evt(igt_hook, (struct igt_hook_evt[]){
>>>                .evt_type =3D IGT_HOOK_PRE_DYN_SUBTEST,
>>>                .target_name =3D dynamic_subtest_name });
>>>
>>
>>That sounds good, however I don't get why we would need
>>to make igt_hook_push_evt() accept NULL for that. This seems to compile
>>fine:
>>
>>    $ cat /tmp/foo.c
>>    #include <stdio.h>
>>
>>    struct some_struct {
>>        int a;
>>        int b;
>>    };
>>
>>    void f(struct some_struct *s)
>>    {
>>        printf("a=3D%d\nb=3D%d\n", s->a, s->b);
>>    }
>>
>>    int main()
>>    {
>>        f(&(struct some_struct){.a =3D 1, .b =3D 2});
>>        return 0;
>>    }
>>
>>    $ gcc -Wall -Wextra -Werror -o /tmp/foo /tmp/foo.c && /tmp/foo
>>    a=3D1
>>    b=3D2
>
>I meant igt_hook_push_evt() to accept NULL as the first argument.
>So instead of doing this everywhere:
>
>        if (igt_hook)
>                igt_hook_push_evt(igt_hook, ...)
>
>we do this:
>
>        igt_hook_push_evt(igt_hook, ...)
>
>Without the compound literal accepting NULL as the first arg would be
>kind of pointless since you'd still need to setup the second argument
>(struct igt_hook_evt), probably in a inner scope. But having the NULL
>check for the first + compound literal for the second, we can reduce the
>boilerplate code to add events.

Ahhh, okay. That makes much more sense now. :-)

Thanks for the clarification.

>
>
>>
>>I tested that on gcc 12 and gcc 14.
>>
>>>>+        }
>>>>+
>>>>         return (in_dynamic_subtest =3D dynamic_subtest_name);
>>>> }
>>>>
>>>>@@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *=
result)
>>>>         struct timespec *thentime =3D in_dynamic_subtest ? &dynamic_su=
btest_time : &subtest_time;
>>>>         jmp_buf *jmptarget =3D in_dynamic_subtest ? &igt_dynamic_jmpbu=
f : &igt_subtest_jmpbuf;
>>>>
>>>>+        if (igt_hook) {
>>>>+                struct igt_hook_evt hook_evt =3D {
>>>>+                        .evt_type =3D (in_dynamic_subtest
>>>>+                                        ? IGT_HOOK_POST_DYN_SUBTEST
>>>>+                                        : IGT_HOOK_POST_SUBTEST),
>>>>+                        .result =3D result,
>>>>+                };
>>>>+
>>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>>+        }
>>>>+
>>>>         if (!igt_thread_is_main()) {
>>>>                 igt_thread_fail();
>>>>                 pthread_exit(NULL);
>>>>@@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *=
file, const int line,
>>>> void igt_exit(void)
>>>> {
>>>>         int tmp;
>>>>+        const char *result;
>>>>
>>>>         if (!test_with_subtests)
>>>>                 igt_thread_assert_no_failures();
>>>>@@ -2318,12 +2406,7 @@ void igt_exit(void)
>>>>
>>>>         assert(waitpid(-1, &tmp, WNOHANG) =3D=3D -1 && errno =3D=3D EC=
HILD);
>>>>
>>>>-        if (!test_with_subtests) {
>>>>-                struct timespec now;
>>>>-                const char *result;
>>>>-
>>>>-                igt_gettime(&now);
>>>>-
>>>>+        if (!test_with_subtests || igt_hook) {
>>>>                 switch (igt_exitcode) {
>>>>                         case IGT_EXIT_SUCCESS:
>>>>                                 result =3D "SUCCESS";
>>>>@@ -2334,6 +2417,12 @@ void igt_exit(void)
>>>>                         default:
>>>>                                 result =3D "FAIL";
>>>>                 }
>>>>+        }
>>>>+
>>>>+        if (!test_with_subtests) {
>>>>+                struct timespec now;
>>>>+
>>>>+                igt_gettime(&now);
>>>>
>>>>                 if (test_multi_fork_child) /* parent will do the yelli=
ng */
>>>>                         _log_line_fprintf(stdout, "dyn_child pid:%d (%=
.3fs) ends with err=3D%d\n",
>>>>@@ -2344,6 +2433,15 @@ void igt_exit(void)
>>>>                                           result, igt_time_elapsed(&su=
btest_time, &now));
>>>>         }
>>>>
>>>>+        if (igt_hook) {
>>>>+                struct igt_hook_evt hook_evt =3D {
>>>>+                        .evt_type =3D IGT_HOOK_POST_TEST,
>>>>+                        .result =3D result,
>>>>+                };
>>>>+
>>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>>+        }
>>>>+
>>>>         exit(igt_exitcode);
>>>> }
>>>>
>>>>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>>>>new file mode 100644
>>>>index 000000000000..a4421e2b1543
>>>>--- /dev/null
>>>>+++ b/lib/igt_hook.c
>>>>@@ -0,0 +1,489 @@
>>>>+// SPDX-License-Identifier: MIT
>>>>+/*
>>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>>+ */
>>>>+
>>>>+#include <assert.h>
>>>>+#include <errno.h>
>>>>+#include <limits.h>
>>>>+#include <stdbool.h>
>>>>+#include <stddef.h>
>>>>+#include <stdint.h>
>>>>+#include <stdio.h>
>>>>+#include <stdlib.h>
>>>>+#include <string.h>
>>>>+
>>>>+#include "igt_core.h"
>>>>+#include "igt_hook.h"
>>>>+
>>>>+/**
>>>>+ * SECTION:igt_hook
>>>>+ * @short_description: Support for running a hook script on test execu=
tion
>>>>+ * @title: Hook support
>>>>+ *
>>>>+ * IGT provides support for running a hook script when executing tests=
. This
>>>>+ * support is provided to users via CLI option `--hook` available in t=
est
>>>>+ * binaries. Users should use `--help-hook` for detailed usaged descri=
ption of
>>>>+ * the feature.
>>>>+ *
>>>>+ * The sole user of the exposed API is `igt_core`, which calls @igt_ho=
ok_create()
>>>>+ * when initializing a test case, then calls @igt_hook_push_evt() for =
each event
>>>>+ * that occurs during that test's execution and finally calls @igt_hoo=
k_free()
>>>>+ * to clean up at the end.
>>>>+ */
>>>>+
>>>>+#define TEST_NAME_INITIAL_SIZE 16
>>>>+
>>>>+typedef uint16_t evt_mask_t;
>>>>+
>>>>+struct igt_hook {
>>>>+        evt_mask_t evt_mask;
>>>>+        char *cmd;
>>>>+        char *test_name;
>>>>+        size_t test_name_size;
>>>>+        char *subtest_name;
>>>>+        size_t subtest_name_size;
>>>>+        char *dyn_subtest_name;
>>>>+        size_t dyn_subtest_name_size;
>>>>+        char *test_fullname;
>>>>+};
>>>>+
>>>>+enum igt_hook_error {
>>>>+        IGT_HOOK_EVT_EMPTY_NAME =3D 1,
>>>>+        IGT_HOOK_EVT_NO_MATCH,
>>>>+};
>>>>+
>>>>+static_assert(IGT_HOOK_NUM_EVENTS <=3D sizeof(evt_mask_t) * CHAR_BIT,
>>>>+              "Number of event types does not fit event type mask");
>>>>+
>>>>+static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type ev=
t_type)
>>>>+{
>>>>+        switch (evt_type) {
>>>>+        case IGT_HOOK_PRE_TEST:
>>>>+                return "pre-test";
>>>>+        case IGT_HOOK_PRE_SUBTEST:
>>>>+                return "pre-subtest";
>>>>+        case IGT_HOOK_PRE_DYN_SUBTEST:
>>>>+                return "pre-dyn-subtest";
>>>>+        case IGT_HOOK_POST_DYN_SUBTEST:
>>>>+                return "post-dyn-subtest";
>>>>+        case IGT_HOOK_POST_SUBTEST:
>>>>+                return "post-subtest";
>>>>+        case IGT_HOOK_POST_TEST:
>>>>+                return "post-test";
>>>>+        case IGT_HOOK_NUM_EVENTS:
>>>>+                break;
>>>>+        /* No "default:" case, to force a warning from -Wswitch in cas=
e we miss
>>>>+         * any new event type. */
>>>>+        }
>>>>+        return "?";
>>>>+}
>>>>+
>>>>+static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *e=
vt_mask, const char **cmd)
>>>>+{
>>>>+        const char *s;
>>>>+
>>>>+        if (!strchr(hook_str, ':')) {
>>>>+                *evt_mask =3D ~0;
>>>>+                *cmd =3D hook_str;
>>>>+                return 0;
>>>>+        }
>>>>+
>>>>+        s =3D hook_str;
>>>>+        *evt_mask =3D 0;
>>>>+
>>>>+        while (1) {
>>>>+                const char *evt_name;
>>>>+                bool has_match;
>>>>+                bool is_star;
>>>>+                enum igt_hook_evt_type evt_type;
>>>>+
>>>>+                evt_name =3D s;
>>>>+
>>>>+                while (*s !=3D ':' && *s !=3D ',')
>>>>+                        s++;
>>>>+
>>>>+                if (evt_name =3D=3D s)
>>>>+                        return IGT_HOOK_EVT_EMPTY_NAME;
>>>>+
>>>>+                has_match =3D false;
>>>>+                is_star =3D *evt_name =3D=3D '*' && evt_name + 1 =3D=
=3D s;
>>>>+
>>>>+                for (evt_type =3D IGT_HOOK_PRE_TEST; evt_type < IGT_HO=
OK_NUM_EVENTS; evt_type++) {
>>>>+                        if (!is_star) {
>>>>+                                const char *this_event_name =3D igt_ho=
ok_evt_type_to_name(evt_type);
>>>>+                                size_t len =3D s - evt_name;
>>>>+
>>>>+                                if (len !=3D strlen(this_event_name))
>>>>+                                        continue;
>>>>+
>>>>+                                if (strncmp(evt_name, this_event_name,=
 len))
>>>>+                                        continue;
>>>>+                        }
>>>>+
>>>>+                        *evt_mask |=3D 1 << evt_type;
>>>>+                        has_match =3D true;
>>>>+
>>>>+                        if (!is_star)
>>>>+                                break;
>>>>+                }
>>>>+
>>>>+                if (!has_match)
>>>>+                        return IGT_HOOK_EVT_NO_MATCH;
>>>>+
>>>>+                if (*s++ =3D=3D ':')
>>>>+                        break;
>>>>+        }
>>>>+
>>>>+        *cmd =3D s;
>>>>+
>>>>+        return 0;
>>>>+}
>>>>+
>>>>+static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_ho=
ok) {
>>>
>>>{ <--- here
>>>
>>
>>Thanks.
>>
>>>>+        /* The maximum size of test_fullname will be the maximum lengt=
h of
>>>>+         * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 =
for the
>>>>+         * null byte. */
>>>>+        return (igt_hook->test_name_size +
>>>
>>>no need for parenthesis
>>
>>I used the parenthesis (and should have probably included the "+ 4"
>>inside) to lineup things like they would be done for kernel style [1].
>>Although that applies for function parameters, I remember seeing usage
>>for normal expressions as well.
>>
>>But I can live without them as well :-)
>>
>>[1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#bre=
aking-long-lines-and-strings
>
>we shouldn't add random chars (parenthesis in this case) to align stuff.

Noted.

>In the kernel it's perfectly fine to do:
>
>        return igt_hook->test_name_size +
>                igt_hook->subtest_name_size +
>                igt_hook->dyn_subtest_name_size + 4;
>
>>
>>>
>>>>+                igt_hook->subtest_name_size +
>>>>+                igt_hook->dyn_subtest_name_size) + 4;
>>>>+}
>>>>+
>>>>+static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>>>>+{
>>>>+        int i;
>>>>+        char *s;
>>>>+        const char *values[] =3D {
>>>>+                igt_hook->test_name,
>>>>+                igt_hook->subtest_name,
>>>>+                igt_hook->dyn_subtest_name,
>>>>+                NULL,
>>>>+        };
>>>>+
>>>>+        if (igt_hook->test_name[0] =3D=3D '\0') {
>>>>+                igt_hook->test_fullname[0] =3D '\0';
>>>>+                return;
>>>>+        }
>>>>+
>>>>+        s =3D stpcpy(igt_hook->test_fullname, "igt");
>>>>+        for (i =3D 0; values[i] && values[i][0] !=3D '\0'; i++) {
>>>>+                *s++ =3D '@';
>>>>+                s =3D stpcpy(s, values[i]);
>>>>+        }
>>>>+}
>>>>+
>>>>+/**
>>>>+ * igt_hook_create:
>>>>+ * @hook_str: Hook descriptor string.
>>>>+ * @error: Pointer to error number.
>>>>+ *
>>>>+ * Allocate and initialize an #igt_hook structure.
>>>>+ *
>>>>+ * This function parses the hook descriptor @hook_str and initializes =
the struct
>>>>+ * to be returned.
>>>>+ *
>>>>+ * The hook descriptor comes from the argument to `--hook` of the test
>>>>+ * executable being run.
>>>>+ *
>>>>+ * If not #NULL, @error is used to store a non-zero error number if an=
 error
>>>>+ * happens. A human-readable string for that error number can be obtai=
ned with
>>>>+ * @igt_hook_error_str().
>>>>+ *
>>>>+ * Returns: The pointer to the #igt_hook structure on success or #NULL=
 on error.
>>>>+ */
>>>>+struct igt_hook *igt_hook_create(const char *hook_str, int *error)
>>>>+{
>>>>+        int err;
>>>>+        evt_mask_t evt_mask;
>>>>+        const char *cmd;
>>>>+        struct igt_hook *igt_hook =3D NULL;
>>>>+
>>>>+
>>>>+        err =3D igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>>>>+        if (err)
>>>>+                goto out;
>>>>+
>>>>+        igt_hook =3D calloc(1, sizeof(*igt_hook));
>>>>+        igt_hook->evt_mask =3D evt_mask;
>>>>+
>>>>+        igt_hook->cmd =3D strdup(cmd);
>>>>+        if (!igt_hook->cmd) {
>>>>+                err =3D -errno;
>>>>+                goto out;
>>>>+        }
>>>>+
>>>>+        igt_hook->test_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>>>>+        igt_hook->test_name_size =3D TEST_NAME_INITIAL_SIZE;
>>>>+        igt_hook->subtest_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>>>>+        igt_hook->subtest_name_size =3D TEST_NAME_INITIAL_SIZE;
>>>>+        igt_hook->dyn_subtest_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>>>>+        igt_hook->dyn_subtest_name_size =3D TEST_NAME_INITIAL_SIZE;
>>>
>>>if we store test_name, subtest_name and dyn_subtest_name individually,
>>>why do we need to store test_fullname?
>>
>>To make igt_hook_update_env_vars() as simple as a bunch of setenv()
>>calls.
>>
>>If you prefer, I could update the code to build the full test name on
>>the fly when setting environment, but like the current version better:
>>we have everything that we need already in the igt_hook struct and extra
>>memory cost is small IMO.
>>
>>Now, if your question is more on the lines of "why do we need the full
>>test name if we already expose the components?", I think exposing the
>>full test name is a convenience.
>
>humn... but we still call igt_hook_update_test_fullname() to update it
>Anyway, nothing critical here, I'd just do this differently
>
>
>>
>>>
>>>>+        igt_hook->test_fullname =3D malloc(igt_hook_calc_test_fullname=
_size(igt_hook));
>>>>+
>>>>+        igt_hook->test_name[0] =3D '\0';
>>>>+        igt_hook->subtest_name[0] =3D '\0';
>>>>+        igt_hook->dyn_subtest_name[0] =3D '\0';
>>>>+        igt_hook->test_fullname[0] =3D '\0';
>>>>+
>>>>+out:
>>>>+        if (err) {
>>>>+                if (error)
>>>>+                        *error =3D err;
>>>>+
>>>>+                igt_hook_free(igt_hook);
>>>>+
>>>>+                return NULL;
>>>>+        }
>>>>+
>>>>+        return igt_hook;
>>>>+}
>>>>+
>>>>+/**
>>>>+ * igt_hook_free:
>>>>+ * @igt_hook: The igt_hook struct.
>>>>+ *
>>>>+ * De-initialize an igt_hook struct returned by @igt_hook_create().
>>>>+ *
>>>>+ * This is a no-op if @igt_hook is #NULL.
>>>>+ */
>>>>+void igt_hook_free(struct igt_hook *igt_hook)
>>>>+{
>>>>+        if (!igt_hook)
>>>>+                return;
>>>>+
>>>>+        free(igt_hook->cmd);
>>>>+        free(igt_hook->test_name);
>>>>+        free(igt_hook->subtest_name);
>>>>+        free(igt_hook->dyn_subtest_name);
>>>>+        free(igt_hook);
>>>>+}
>>>>+
>>>>+static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_ho=
ok, struct igt_hook_evt *evt)
>>>>+{
>>>>+        char **name_ptr;
>>>>+        size_t *size_ptr;
>>>>+        size_t len;
>>>>+
>>>>+        switch (evt->evt_type) {
>>>>+        case IGT_HOOK_PRE_TEST:
>>>>+                name_ptr =3D &igt_hook->test_name;
>>>>+                size_ptr =3D &igt_hook->test_name_size;
>>>>+                break;
>>>>+        case IGT_HOOK_PRE_SUBTEST:
>>>>+                name_ptr =3D &igt_hook->subtest_name;
>>>>+                size_ptr =3D &igt_hook->subtest_name_size;
>>>>+                break;
>>>>+        case IGT_HOOK_PRE_DYN_SUBTEST:
>>>>+                name_ptr =3D &igt_hook->dyn_subtest_name;
>>>>+                size_ptr =3D &igt_hook->dyn_subtest_name_size;
>>>>+                break;
>>>>+        default:
>>>>+                return;
>>>>+        }
>>>>+
>>>>+        len =3D strlen(evt->target_name);
>>>>+        if (len + 1 > *size_ptr) {
>>>>+                size_t fullname_size;
>>>>+
>>>>+                *size_ptr *=3D 2;
>>>>+                *name_ptr =3D realloc(*name_ptr, *size_ptr);
>>>>+
>>>>+                fullname_size =3D igt_hook_calc_test_fullname_size(igt=
_hook);
>>>>+                igt_hook->test_fullname =3D realloc(igt_hook->test_ful=
lname, fullname_size);
>>>>+        }
>>>>+
>>>>+        strcpy(*name_ptr, evt->target_name);
>>>>+        igt_hook_update_test_fullname(igt_hook);
>>>>+}
>>>>+
>>>>+static void igt_hook_update_test_name_post_call(struct igt_hook *igt_h=
ook, struct igt_hook_evt *evt)
>>>>+{
>>>>+        switch (evt->evt_type) {
>>>>+        case IGT_HOOK_POST_TEST:
>>>>+                igt_hook->test_name[0] =3D '\0';
>>>>+                break;
>>>>+        case IGT_HOOK_POST_SUBTEST:
>>>>+                igt_hook->subtest_name[0] =3D '\0';
>>>>+                break;
>>>>+        case IGT_HOOK_POST_DYN_SUBTEST:
>>>>+                igt_hook->dyn_subtest_name[0] =3D '\0';
>>>>+                break;
>>>>+        default:
>>>>+                return;
>>>>+        }
>>>>+
>>>>+        igt_hook_update_test_fullname(igt_hook);
>>>>+}
>>>>+
>>>>+static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct=
 igt_hook_evt *evt)
>>>>+{
>>>>+        setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_ty=
pe), 1);
>>>>+        setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
>>>>+        setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>>>>+        setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>>>>+        setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>>>>+        setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>>>>+}
>>>>+
>>>>+/**
>>>>+ * igt_hook_push_evt:
>>>>+ * @igt_hook: The igt_hook structure.
>>>>+ * @evt: The event to be pushed.
>>>>+ *
>>>>+ * Push a new igt_hook event.
>>>>+ *
>>>>+ * This function must be used to register a new igt_hook event. Callin=
g it will
>>>
>>>"register" IMO is an odd term. This is notifying/calling the previously
>>>registered hook, not registering an event.
>>
>>The term "register" here is to mean that we are telling that a new event
>>happened. Whether a registered hook gets "notified" (or "called")
>>depends on whether the event matches the event descriptor passed on hook
>>registration.
>>
>>If you prefer, "notify" could be used instead (to mean what I just
>>described), but I don't think "call" is suitable here.
>
>notify sounds good to me.
>
>>
>>>
>>>igt_hook_event_notify() or igt_hook_event_exec() would be more
>>>appropriate I think.
>>
>>On the same lines as my previous comment, I do not think
>>igt_hook_event_exec() is suitable.
>>
>>Let's go with igt_hook_event_notify(), then?
>
>yep
>
>>
>>>
>>>
>>>>+ * cause execution of the hook script if the event type matches the fi=
lters
>>>>+ * provided during initialization of @igt_hook.
>>>>+ */
>>>>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt =
*evt)
>>>>+{
>>>>+        evt_mask_t evt_bit =3D (1 << evt->evt_type);
>>>>+
>>>>+        igt_hook_update_test_name_pre_call(igt_hook, evt);
>>>>+
>>>>+        if ((evt_bit & igt_hook->evt_mask)) {
>>>>+                struct igt_helper_process proc =3D {};
>>>>+
>>>>+                igt_fork_helper(&proc) {
>>>>+                        igt_hook_update_env_vars(igt_hook, evt);
>>>>+                        system(igt_hook->cmd);
>>>
>>>humn... we don't care about the return?
>>
>>Not at the moment. I had considered hooks controlling the execution. For
>>example, we could have a hook causing a test to skip or to abort the
>>overall execution.
>>
>>However, I decided to keep it simple for now. We could extend the
>>functionality to allow hooks to influence the execution if we see the
>>need in the future.
>>
>>>also... Why do we double fork?
>>>
>>>it rather looks like we want an igt_exec() to complement
>>>igt_fork_helper() or at least a small wrapper around
>>>execle() do exec /bin/sh passing the command and env to use
>>
>>I was lazy and did not want to have to deal with stuff that system()
>>gives me for "free". Let me look into how I can improve this with
>>igt_exec()...
>
>what I find odd is that now we have a double fork, with the seconde fork
>exec'ing. If we keep using system() why do we need the fork helper
>since...
>
>>
>>>
>>>>+                }
>>>>+                igt_wait_helper(&proc);
>
>^ we are just waiting for it to complete.
>
>is it so we update the env only in the forked context?

Yes. See my reply on v1 of this section:

https://lore.kernel.org/igt-dev/171883157362.2358.4692119154210725467@gjsou=
sa-mobl2/

> Any downside of
>having the env var set in igt_runner's context?

The need to save and restore env vars with the same name that could
possibly be in igt_runner's context.

Well, that might be worth doing instead of "open coding" system() to
avoid the double fork. What do you think?

--
Gustavo Sousa

>
>>>>+        }
>>>>+
>>>>+        igt_hook_update_test_name_post_call(igt_hook, evt);
>>>>+}
>>>>+
>>>>+/**
>>>>+ * igt_hook_error_str:
>>>>+ * @error: Non-zero error number.
>>>>+ *
>>>>+ * Return a human-readable string containing a description of an error=
 number
>>>>+ * generated by one of the `igt_hook_*` functions.
>>>>+ *
>>>>+ * The string will be the result of strerror() for errors from the C s=
tandard
>>>>+ * library or a custom description specific to igt_hook.
>>>>+ */
>>>>+const char *igt_hook_error_str(int error)
>>>>+{
>>>>+        if (!error)
>>>>+                return "No error";
>>>>+
>>>>+        if (error > 0) {
>>>>+                enum igt_hook_error hook_error =3D error;
>>>>+
>>>>+                switch (hook_error) {
>>>>+                case IGT_HOOK_EVT_EMPTY_NAME:
>>>>+                        return "Empty name in event descriptor";
>>>>+                case IGT_HOOK_EVT_NO_MATCH:
>>>>+                        return "Event name in event descriptor does no=
t match any event type";
>>>>+                default:
>>>>+                        return "Unknown error";
>>>>+                }
>>>>+        } else {
>>>
>>>no need for else
>>
>>Right. This is also a leftover from v1, where error could be negative.
>>Now there is not need for the "if" either. I'll fix this. Thanks.
>>
>>>
>>>
>>>Lucas De Marchi
>>
>>
>>Thanks for the new feedback! I'll start working on a v3.
>>
>
>thanks
>Lucas De Marchi
>
>>--
>>Gustavo Sousa
>>
>>>
>>>>+                return strerror(-error);
>>>>+        }
>>>>+}
>>>>+
>>>>+/**
>>>>+ * igt_hook_print_help:
>>>>+ * @f: File pointer where to write the output.
>>>>+ * @option_name: Name of the CLI option that accepts the hook descript=
or.
>>>>+ *
>>>>+ * Print a detailed user help text on hook usage.
>>>>+ */
>>>>+void igt_hook_print_help(FILE *f, const char *option_name)
>>>>+{
>>>>+        fprintf(f, "\
>>>>+The option %1$s receives as argument a \"hook descriptor\" and allows =
the\n\
>>>>+execution of a shell command at different points during execution of t=
ests. Each\n\
>>>>+such a point is called a \"hook event\".\n\
>>>>+\n\
>>>>+Examples:\n\
>>>>+\n\
>>>>+  # Prints hook-specic env vars for every event.\n\
>>>>+  %1$s 'printenv | grep ^IGT_HOOK_'\n\
>>>>+\n\
>>>>+  # Equivalent to the above. Useful if command contains ':'.\n\
>>>>+  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
>>>>+\n\
>>>>+  # Adds a line to out.txt containing the result of each test case.\n\
>>>>+  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out=
.txt'\n\
>>>>+\n\
>>>>+The accepted format for a hook descriptor is `[<events>:]<cmd>`, where=
:\n\
>>>>+\n\
>>>>+  - <events> is a comma-separated list of event descriptors, which def=
ines the\n\
>>>>+    set of events be tracked. If omitted, all events are tracked.\n\
>>>>+\n\
>>>>+  - <cmd> is a shell command to be executed on the occurrence each tra=
cked\n\
>>>>+    event. If the command contains ':', then passing <events> is requi=
red,\n\
>>>>+    otherwise part of the command would be treated as an event descrip=
tor.\n\
>>>>+\n\
>>>>+", option_name);
>>>>+
>>>>+        fprintf(f, "\
>>>>+An \"event descriptor\" is either the name of an event or the string '=
*'. The\n\
>>>>+latter matches all event names. The list of possible event names is pr=
ovided\n\
>>>>+below:\n\
>>>>+\n\
>>>>+");
>>>>+
>>>>+        for (enum igt_hook_evt_type et =3D 0; et < IGT_HOOK_NUM_EVENTS=
; et++) {
>>>>+                const char *desc;
>>>>+
>>>>+                switch (et) {
>>>>+                case IGT_HOOK_PRE_TEST:
>>>>+                        desc =3D "Occurs before a test case starts.";
>>>>+                        break;
>>>>+                case IGT_HOOK_PRE_SUBTEST:
>>>>+                        desc =3D "Occurs before the execution of a sub=
test.";
>>>>+                        break;
>>>>+                case IGT_HOOK_PRE_DYN_SUBTEST:
>>>>+                        desc =3D "Occurs before the execution of a dyn=
amic subtest.";
>>>>+                        break;
>>>>+                case IGT_HOOK_POST_DYN_SUBTEST:
>>>>+                        desc =3D "Occurs after the execution of a dyna=
mic subtest.";
>>>>+                        break;
>>>>+                case IGT_HOOK_POST_SUBTEST:
>>>>+                        desc =3D "Occurs after the execution of a subt=
est.";
>>>>+                        break;
>>>>+                case IGT_HOOK_POST_TEST:
>>>>+                        desc =3D "Occurs after a test case has finishe=
d.";
>>>>+                        break;
>>>>+                default:
>>>>+                        desc =3D "MISSING DESCRIPTION";
>>>>+                }
>>>>+
>>>>+                fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name=
(et), desc);
>>>>+        }
>>>>+
>>>>+        fprintf(f, "\
>>>>+For each event matched by <events>, <cmd> is executed as a shell comma=
nd. The\n\
>>>>+exit status of the command is ignored. The following environment varia=
bles are\n\
>>>>+available to the command:\n\
>>>>+\n\
>>>>+  IGT_HOOK_EVENT\n\
>>>>+  Name of the current event.\n\
>>>>+\n\
>>>>+  IGT_HOOK_TEST_FULLNAME\n\
>>>>+  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_sub=
test>]]`.\n\
>>>>+\n\
>>>>+  IGT_HOOK_TEST\n\
>>>>+  Name of the current test.\n\
>>>>+\n\
>>>>+  IGT_HOOK_SUBTEST\n\
>>>>+  Name of the current subtest. Will be the empty string if not running=
 a\n\
>>>>+  subtest.\n\
>>>>+\n\
>>>>+  IGT_HOOK_DYN_SUBTEST\n\
>>>>+  Name of the current dynamic subtest. Will be the empty string if not=
 running a\n\
>>>>+  dynamic subtest.\n\
>>>>+\n\
>>>>+  IGT_HOOK_RESULT\n\
>>>>+  String representing the result of the test/subtest/dynamic subtest. =
Possible\n\
>>>>+  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post=
-*\"\n\
>>>>+  events and will be the empty string for other types of events.\n\
>>>>+\n\
>>>>+");
>>>>+}
>>>>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>>>>new file mode 100644
>>>>index 000000000000..a7b67837e5a4
>>>>--- /dev/null
>>>>+++ b/lib/igt_hook.h
>>>>@@ -0,0 +1,69 @@
>>>>+// SPDX-License-Identifier: MIT
>>>>+/*
>>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>>+ */
>>>>+
>>>>+#ifndef IGT_HOOK_H
>>>>+#define IGT_HOOK_H
>>>>+
>>>>+#include <stdio.h>
>>>>+
>>>>+/**
>>>>+ * igt_hook:
>>>>+ *
>>>>+ * Opaque struct to hold data related to hook support.
>>>>+ */
>>>>+struct igt_hook;
>>>>+
>>>>+/**
>>>>+ * igt_hook_evt_type:
>>>>+ * @IGT_HOOK_PRE_TEST: Occurs before a test case (executable) starts t=
he
>>>>+ * test code.
>>>>+ * @IGT_HOOK_PRE_SUBTEST: Occurs before the execution of a subtest.
>>>>+ * @IGT_HOOK_PRE_DYN_SUBTEST: Occurs before the execution of a dynamic=
 subtest.
>>>>+ * @IGT_HOOK_POST_DYN_SUBTEST: Occurs after the execution of a dynamic=
 subtest.
>>>>+ * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>>>>+ * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finis=
hed with
>>>>+ * the test code.
>>>>+ * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents th=
e number
>>>>+ * of possible events tracked by igt_hook.
>>>>+ *
>>>>+ * Events tracked by igt_hook. Those events occur at specific points d=
uring the
>>>>+ * execution of a test.
>>>>+ */
>>>>+enum igt_hook_evt_type {
>>>>+        IGT_HOOK_PRE_TEST,
>>>>+        IGT_HOOK_PRE_SUBTEST,
>>>>+        IGT_HOOK_PRE_DYN_SUBTEST,
>>>>+        IGT_HOOK_POST_DYN_SUBTEST,
>>>>+        IGT_HOOK_POST_SUBTEST,
>>>>+        IGT_HOOK_POST_TEST,
>>>>+        IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
>>>>+};
>>>>+
>>>>+/**
>>>>+ * igt_hook_evt:
>>>>+ * @evt_type: Type of event.
>>>>+ * @target_name: A string pointing to the name of the test, subtest or=
 dynamic
>>>>+ * subtest, depending on @evt_type.
>>>>+ * @result: A string containing the result of the test, subtest or dyn=
amic
>>>>+ * subtest. This is only applicable for the `IGT_HOOK_POST_\*' event t=
ypes;
>>>>+ * other types must initialize this to #NULL.
>>>>+ *
>>>>+ * An event tracked by igt_hook, which is done with @igt_hook_push_evt=
(). This must
>>>>+ * be zero initialized and fields relevant to the event type must be s=
et before
>>>>+ * passing its reference to @igt_hook_push_evt().
>>>>+ */
>>>>+struct igt_hook_evt {
>>>>+        enum igt_hook_evt_type evt_type;
>>>>+        const char *target_name;
>>>>+        const char *result;
>>>>+};
>>>>+
>>>>+struct igt_hook *igt_hook_create(const char *hook_str, int *error);
>>>>+void igt_hook_free(struct igt_hook *igt_hook);
>>>>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt =
*evt);
>>>>+const char *igt_hook_error_str(int error);
>>>>+void igt_hook_print_help(FILE *f, const char *option_name);
>>>>+
>>>>+#endif /* IGT_HOOK_H */
>>>>diff --git a/lib/meson.build b/lib/meson.build
>>>>index e2f740c116f8..10b8066647f2 100644
>>>>--- a/lib/meson.build
>>>>+++ b/lib/meson.build
>>>>@@ -109,6 +109,7 @@ lib_sources =3D [
>>>>         'veboxcopy_gen12.c',
>>>>         'igt_msm.c',
>>>>         'igt_dsc.c',
>>>>+        'igt_hook.c',
>>>>         'xe/xe_gt.c',
>>>>         'xe/xe_ioctl.c',
>>>>         'xe/xe_mmio.c',
>>>>diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
>>>>new file mode 100644
>>>>index 000000000000..c8a93952abed
>>>>--- /dev/null
>>>>+++ b/lib/tests/igt_hook.c
>>>>@@ -0,0 +1,170 @@
>>>>+// SPDX-License-Identifier: MIT
>>>>+/*
>>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>>+ */
>>>>+
>>>>+#include <stdbool.h>
>>>>+#include <stdio.h>
>>>>+#include <unistd.h>
>>>>+
>>>>+#include "igt_core.h"
>>>>+#include "igt_hook.h"
>>>>+
>>>>+static const char *env_var_names[] =3D {
>>>>+        "IGT_HOOK_EVENT",
>>>>+        "IGT_HOOK_TEST_FULLNAME",
>>>>+        "IGT_HOOK_TEST",
>>>>+        "IGT_HOOK_SUBTEST",
>>>>+        "IGT_HOOK_DYN_SUBTEST",
>>>>+        "IGT_HOOK_RESULT",
>>>>+};
>>>>+
>>>>+#define num_env_vars (sizeof(env_var_names) / sizeof(env_var_names[0])=
)
>>>>+
>>>>+static int env_var_name_lookup(char *line)
>>>>+{
>>>>+        int i;
>>>>+        char *c;
>>>>+
>>>>+        c =3D strchr(line, '=3D');
>>>>+        if (c)
>>>>+                *c =3D '\0';
>>>>+
>>>>+        for (i =3D 0; i < num_env_vars; i++)
>>>>+                if (!strcmp(line, env_var_names[i]))
>>>>+                        goto out;
>>>>+
>>>>+        i =3D -1;
>>>>+out:
>>>>+        if (c)
>>>>+                *c =3D '=3D';
>>>>+
>>>>+        return i;
>>>>+}
>>>>+
>>>>+static void test_null_error_pointer(void)
>>>>+{
>>>>+        struct igt_hook *igt_hook;
>>>>+
>>>>+        /* Ensure passing NULL error pointer does not cause issues. */
>>>>+        igt_hook =3D igt_hook_create("invalid:echo hello", NULL);
>>>>+        igt_assert(igt_hook =3D=3D NULL);
>>>>+}
>>>>+
>>>>+static void test_invalid_hook_descriptors(void)
>>>>+{
>>>>+        struct {
>>>>+                const char *name;
>>>>+                const char *hook_desc;
>>>>+        } invalid_cases[] =3D {
>>>>+                {"invalid-event-name", "invalid-event:echo hello"},
>>>>+                {"invalid-empty-event-name", ":echo hello"},
>>>>+                {"invalid-colon-in-cmd", "echo hello:world"},
>>>>+                {},
>>>>+        };
>>>>+
>>>>+        for (int i =3D 0; invalid_cases[i].name; i++) {
>>>>+                igt_subtest(invalid_cases[i].name) {
>>>>+                        int err =3D 0;
>>>>+                        struct igt_hook *igt_hook;
>>>>+
>>>>+                        igt_hook =3D igt_hook_create(invalid_cases[i].=
hook_desc, &err);
>>>>+                        igt_assert(igt_hook =3D=3D NULL);
>>>>+                        igt_assert(err !=3D 0);
>>>>+                }
>>>>+        }
>>>>+}
>>>>+
>>>>+static void test_print_help(void)
>>>>+{
>>>>+        char *buf;
>>>>+        size_t len;
>>>>+        FILE *f;
>>>>+        const char expected_initial_text[] =3D "The option --hook rece=
ives as argument a \"hook descriptor\"";
>>>>+
>>>>+        f =3D open_memstream(&buf, &len);
>>>>+        igt_assert(f);
>>>>+
>>>>+        igt_hook_print_help(f, "--hook");
>>>>+        fclose(f);
>>>>+
>>>>+        igt_assert(!strncmp(buf, expected_initial_text, sizeof(expecte=
d_initial_text) - 1));
>>>>+
>>>>+        /* This is an extra check to catch a case where an event type =
is added
>>>>+         * without a proper description. */
>>>>+        igt_assert(!strstr(buf, "MISSING DESCRIPTION"));
>>>>+
>>>>+        free(buf);
>>>>+}
>>>>+
>>>>+static void test_all_env_vars(void)
>>>>+{
>>>>+        struct igt_hook_evt evt =3D {
>>>>+                .evt_type =3D IGT_HOOK_PRE_SUBTEST,
>>>>+                .target_name =3D "foo",
>>>>+        };
>>>>+        bool env_vars_checklist[num_env_vars] =3D {};
>>>>+        struct igt_hook *igt_hook;
>>>>+        char *hook_str;
>>>>+        FILE *f;
>>>>+        int pipefd[2];
>>>>+        int ret;
>>>>+        int i;
>>>>+        char *line;
>>>>+        size_t line_size;
>>>>+
>>>>+        ret =3D pipe(pipefd);
>>>>+        igt_assert(ret =3D=3D 0);
>>>>+
>>>>+        /* Use grep to filter only env var set by us. This should ensu=
re that
>>>>+         * writing to the pipe will not block due to capacity, since w=
e only
>>>>+         * read from the pipe after the shell command is done. */
>>>>+        ret =3D asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >=
&%d", pipefd[1]);
>>>>+        igt_assert(ret > 0);
>>>>+
>>>>+        igt_hook =3D igt_hook_create(hook_str, NULL);
>>>>+        igt_assert(igt_hook);
>>>>+
>>>>+        igt_hook_push_evt(igt_hook, &evt);
>>>>+
>>>>+        close(pipefd[1]);
>>>>+        f =3D fdopen(pipefd[0], "r");
>>>>+        igt_assert(f);
>>>>+
>>>>+        line =3D NULL;
>>>>+        line_size =3D 0;
>>>>+
>>>>+        while (getdelim(&line, &line_size, '\0', f) !=3D -1) {
>>>>+                ret =3D env_var_name_lookup(line);
>>>>+                igt_assert_f(ret >=3D 0, "Unexpected env var %s\n", li=
ne);
>>>>+                env_vars_checklist[ret] =3D true;
>>>>+        }
>>>>+
>>>>+        for (i =3D 0; i < num_env_vars; i++)
>>>>+                igt_assert_f(env_vars_checklist[i], "Missing env var %=
s\n", env_var_names[i]);
>>>>+
>>>>+        fclose(f);
>>>>+        igt_hook_free(igt_hook);
>>>>+        free(hook_str);
>>>>+        free(line);
>>>>+}
>>>>+
>>>>+igt_main
>>>>+{
>>>>+        igt_subtest("null-error-pointer")
>>>>+                test_null_error_pointer();
>>>>+
>>>>+        test_invalid_hook_descriptors();
>>>>+
>>>>+        igt_subtest("help-description")
>>>>+                test_print_help();
>>>>+
>>>>+        igt_subtest_group {
>>>>+                igt_fixture {
>>>>+                        igt_require_f(system(NULL), "Shell seems not t=
o be available\n");
>>>>+                }
>>>>+
>>>>+                igt_subtest("all-env-vars")
>>>>+                        test_all_env_vars();
>>>>+        }
>>>>+}
>>>>diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_inte=
gration.c
>>>>new file mode 100644
>>>>index 000000000000..f5ba25e92897
>>>>--- /dev/null
>>>>+++ b/lib/tests/igt_hook_integration.c
>>>>@@ -0,0 +1,281 @@
>>>>+// SPDX-License-Identifier: MIT
>>>>+/*
>>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>>+ */
>>>>+
>>>>+#include <stdbool.h>
>>>>+#include <stdio.h>
>>>>+#include <string.h>
>>>>+
>>>>+#include "igt_core.h"
>>>>+
>>>>+#include "igt_tests_common.h"
>>>>+
>>>>+char prog[] =3D "igt_hook_integration";
>>>>+char hook_opt[] =3D "--hook";
>>>>+char hook_str[128];
>>>>+char *fake_argv[] =3D {prog, hook_opt, hook_str};
>>>>+int fake_argc =3D sizeof(fake_argv) / sizeof(fake_argv[0]);
>>>>+
>>>>+#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, res=
ult) \
>>>>+{ \
>>>>+        "IGT_HOOK_EVENT=3D" evt_name, \
>>>>+        "IGT_HOOK_TEST_FULLNAME=3Digt@igt_hook_integration" fullname_s=
uffix, \
>>>>+        "IGT_HOOK_TEST=3Digt_hook_integration", \
>>>>+        "IGT_HOOK_SUBTEST=3D" subtest, \
>>>>+        "IGT_HOOK_DYN_SUBTEST=3D" dyn_subtest, \
>>>>+        "IGT_HOOK_RESULT=3D" result, \
>>>>+}
>>>>+
>>>>+#define TEST_ENV(evt_name, result) \
>>>>+        ENV_ARRAY(evt_name, "", "", "", result)
>>>>+
>>>>+#define SUBTEST_ENV(evt_name, subtest, result) \
>>>>+        ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
>>>>+
>>>>+#define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
>>>>+        ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_=
subtest, result)
>>>>+
>>>>+const char *pre_test_env[] =3D TEST_ENV("pre-test", "");
>>>>+const char *pre_subtest_a_env[] =3D SUBTEST_ENV("pre-subtest", "a", ""=
);
>>>>+const char *pre_dyn_subtest_a_success_env[] =3D DYN_SUBTEST_ENV("pre-d=
yn-subtest", "a", "success", "");
>>>>+const char *post_dyn_subtest_a_success_env[] =3D DYN_SUBTEST_ENV("post=
-dyn-subtest", "a", "success", "SUCCESS");
>>>>+const char *pre_dyn_subtest_a_failed_env[] =3D DYN_SUBTEST_ENV("pre-dy=
n-subtest", "a", "failed", "");
>>>>+const char *post_dyn_subtest_a_failed_env[] =3D DYN_SUBTEST_ENV("post-=
dyn-subtest", "a", "failed", "FAIL");
>>>>+const char *pre_dyn_subtest_a_skipped_env[] =3D DYN_SUBTEST_ENV("pre-d=
yn-subtest", "a", "skipped", "");
>>>>+const char *post_dyn_subtest_a_skipped_env[] =3D DYN_SUBTEST_ENV("post=
-dyn-subtest", "a", "skipped", "SKIP");
>>>>+const char *post_subtest_a_env[] =3D SUBTEST_ENV("post-subtest", "a", =
"FAIL");
>>>>+const char *pre_subtest_b_env[] =3D SUBTEST_ENV("pre-subtest", "b", ""=
);
>>>>+const char *post_subtest_b_env[] =3D SUBTEST_ENV("post-subtest", "b", =
"SUCCESS");
>>>>+const char *post_test_env[] =3D TEST_ENV("post-test", "FAIL");
>>>>+
>>>>+#define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
>>>>+
>>>>+__noreturn static void fake_main(void)
>>>>+{
>>>>+        igt_subtest_init(fake_argc, fake_argv);
>>>>+
>>>>+        igt_subtest_with_dynamic("a") {
>>>>+                igt_dynamic("success") {
>>>>+                        igt_info("...@a@success\n");
>>>>+                }
>>>>+
>>>>+                igt_dynamic("failed") {
>>>>+                        igt_assert_f(false, "Fail on purpose\n");
>>>>+                        igt_info("...@a@failed\n");
>>>>+                }
>>>>+
>>>>+                igt_dynamic("skipped") {
>>>>+                        igt_require_f(false, "Skip on purpose\n");
>>>>+                        igt_info("...@a@skipped\n");
>>>>+                }
>>>>+        }
>>>>+
>>>>+        igt_subtest("b") {
>>>>+                igt_info("...@b\n");
>>>>+        }
>>>>+
>>>>+        igt_exit();
>>>>+}
>>>>+
>>>>+static void test_invalid_hook_str(void)
>>>>+{
>>>>+        int status;
>>>>+        pid_t pid;
>>>>+        static char err[4096];
>>>>+        int errfd;
>>>>+
>>>>+        sprintf(hook_str, "invalid-event:echo hello");
>>>>+
>>>>+        pid =3D do_fork_bg_with_pipes(fake_main, NULL, &errfd);
>>>>+
>>>>+        read_whole_pipe(errfd, err, sizeof(err));
>>>>+
>>>>+        internal_assert(safe_wait(pid, &status) !=3D -1);
>>>>+        internal_assert_wexited(status, IGT_EXIT_INVALID);
>>>>+
>>>>+        internal_assert(strstr(err, "Failed to initialize hook data:")=
);
>>>>+
>>>>+        close(errfd);
>>>>+}
>>>>+
>>>>+static bool match_env(FILE *hook_out_stream, const char **expected_env=
)
>>>>+{
>>>>+        int i;
>>>>+        char hook_env_buf[4096];
>>>>+        size_t buf_len =3D 0;
>>>>+        char *line =3D NULL;
>>>>+        size_t line_size;
>>>>+        bool env_checklist[num_env_vars] =3D {};
>>>>+        bool has_unexpected =3D false;
>>>>+        bool has_missing =3D false;
>>>>+
>>>>+        /* Store env from hook so we can show it in case of errors */
>>>>+        while (getdelim(&line, &line_size, '\0', hook_out_stream) !=3D=
 -1) {
>>>>+                internal_assert(buf_len + strlen(line) + 1 <=3D sizeof=
(hook_env_buf));
>>>>+                strcpy(hook_env_buf + buf_len, line);
>>>>+                buf_len +=3D strlen(line) + 1;
>>>>+
>>>>+                if (!strcmp(line, "---"))
>>>>+                        break;
>>>>+        }
>>>>+
>>>>+        if (!expected_env && !buf_len) {
>>>>+                /* We have consumed everything and we are done now. */
>>>>+                return false;
>>>>+        }
>>>>+
>>>>+
>>>>+        if (!expected_env) {
>>>>+                printf("Detected unexpected hook execution\n");
>>>>+                has_unexpected =3D true;
>>>>+                goto out;
>>>>+        }
>>>>+
>>>>+        if (!buf_len) {
>>>>+                printf("Expected more hook execution, but none found\n=
");
>>>>+                has_missing =3D true;
>>>>+                goto out;
>>>>+        }
>>>>+
>>>>+
>>>>+        line =3D hook_env_buf;
>>>>+        while (strcmp(line, "---")) {
>>>>+                for (i =3D 0; i < num_env_vars; i++) {
>>>>+                        if (!strcmp(line, expected_env[i])) {
>>>>+                                env_checklist[i] =3D true;
>>>>+                                break;
>>>>+                        }
>>>>+                }
>>>>+
>>>>+                if (i =3D=3D num_env_vars) {
>>>>+                        printf("Unexpected envline from hook: %s\n", l=
ine);
>>>>+                        has_unexpected =3D true;
>>>>+                }
>>>>+
>>>>+                line +=3D strlen(line) + 1;
>>>>+        }
>>>>+
>>>>+        for (i =3D 0; i < num_env_vars; i++) {
>>>>+                if (!env_checklist[i]) {
>>>>+                        has_missing =3D true;
>>>>+                        printf("Missing expected envline: %s\n", expec=
ted_env[i]);
>>>>+                }
>>>>+        }
>>>>+
>>>>+out:
>>>>+        if (has_unexpected || has_missing) {
>>>>+                if (expected_env) {
>>>>+                        printf("Expected environment:\n");
>>>>+                        for (i =3D 0; i < num_env_vars; i++)
>>>>+                                printf("  %s\n", expected_env[i]);
>>>>+                }
>>>>+
>>>>+                if (buf_len) {
>>>>+                        printf("Environment from hook:\n");
>>>>+                        line =3D hook_env_buf;
>>>>+                        while (strcmp(line, "---")) {
>>>>+                                printf("  %s\n", line);
>>>>+                                line +=3D strlen(line) + 1;
>>>>+                        }
>>>>+                } else {
>>>>+                        printf("No hook execution found\n");
>>>>+                }
>>>>+        }
>>>>+
>>>>+        internal_assert(!has_unexpected);
>>>>+        internal_assert(!has_missing);
>>>>+
>>>>+        /* Ready to consume next hook output. */
>>>>+        return true;
>>>>+}
>>>>+
>>>>+static void run_tests_and_match_env(const char *evt_descriptors, const=
 char **expected_envs[])
>>>>+{
>>>>+        int i;
>>>>+        int ret;
>>>>+        int pipefd[2];
>>>>+        pid_t pid;
>>>>+        FILE *f;
>>>>+
>>>>+        ret =3D pipe(pipefd);
>>>>+        internal_assert(ret =3D=3D 0);
>>>>+
>>>>+        /* Use grep to filter only env var set by us. This should ensu=
re that
>>>>+         * writing to the pipe will not block due to capacity, since w=
e only
>>>>+         * read from the pipe after the shell command is done. */
>>>>+        sprintf(hook_str,
>>>>+                "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -=
- ---\\\\00 >&%2$d",
>>>>+                evt_descriptors,
>>>>+                pipefd[1]);
>>>>+
>>>>+        pid =3D do_fork_bg_with_pipes(fake_main, NULL, NULL);
>>>>+        internal_assert(safe_wait(pid, &ret) !=3D -1);
>>>>+        internal_assert_wexited(ret, IGT_EXIT_FAILURE);
>>>>+
>>>>+        close(pipefd[1]);
>>>>+        f =3D fdopen(pipefd[0], "r");
>>>>+        internal_assert(f);
>>>>+
>>>>+        i =3D 0;
>>>>+        while (match_env(f, expected_envs[i]))
>>>>+                i++;
>>>>+
>>>>+        fclose(f);
>>>>+
>>>>+}
>>>>+
>>>>+int main(int argc, char **argv)
>>>>+{
>>>>+        {
>>>>+                printf("Check invalid hook string\n");
>>>>+                test_invalid_hook_str();
>>>>+        }
>>>>+
>>>>+        {
>>>>+                const char **expected_envs[] =3D {
>>>>+                        pre_test_env,
>>>>+                        pre_subtest_a_env,
>>>>+                        pre_dyn_subtest_a_success_env,
>>>>+                        post_dyn_subtest_a_success_env,
>>>>+                        pre_dyn_subtest_a_failed_env,
>>>>+                        post_dyn_subtest_a_failed_env,
>>>>+                        pre_dyn_subtest_a_skipped_env,
>>>>+                        post_dyn_subtest_a_skipped_env,
>>>>+                        post_subtest_a_env,
>>>>+                        pre_subtest_b_env,
>>>>+                        post_subtest_b_env,
>>>>+                        post_test_env,
>>>>+                        NULL,
>>>>+                };
>>>>+
>>>>+                printf("Check full event tracking\n");
>>>>+                run_tests_and_match_env("*", expected_envs);
>>>>+        }
>>>>+
>>>>+        {
>>>>+                const char **expected_envs[] =3D {
>>>>+                        pre_dyn_subtest_a_success_env,
>>>>+                        pre_dyn_subtest_a_failed_env,
>>>>+                        pre_dyn_subtest_a_skipped_env,
>>>>+                        NULL,
>>>>+                };
>>>>+
>>>>+                printf("Check single event type tracking\n");
>>>>+                run_tests_and_match_env("pre-dyn-subtest", expected_en=
vs);
>>>>+        }
>>>>+
>>>>+        {
>>>>+                const char **expected_envs[] =3D {
>>>>+                        pre_subtest_a_env,
>>>>+                        post_dyn_subtest_a_success_env,
>>>>+                        post_dyn_subtest_a_failed_env,
>>>>+                        post_dyn_subtest_a_skipped_env,
>>>>+                        pre_subtest_b_env,
>>>>+                        NULL,
>>>>+                };
>>>>+
>>>>+                printf("Check multiple event types tracking\n");
>>>>+                run_tests_and_match_env("post-dyn-subtest,pre-subtest"=
, expected_envs);
>>>>+        }
>>>>+}
>>>>diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>>>>index fa3d81de6cef..df8092638eca 100644
>>>>--- a/lib/tests/meson.build
>>>>+++ b/lib/tests/meson.build
>>>>@@ -10,6 +10,8 @@ lib_tests =3D [
>>>>         'igt_exit_handler',
>>>>         'igt_fork',
>>>>         'igt_fork_helper',
>>>>+        'igt_hook',
>>>>+        'igt_hook_integration',
>>>>         'igt_ktap_parser',
>>>>         'igt_list_only',
>>>>         'igt_invalid_subtest_name',
>>>>--
>>>>2.45.2
>>>>
