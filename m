Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD112EF071F
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 07:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFCE10E334;
	Mon,  9 Feb 2026 07:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/CDOvZo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9754410E334
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770622575; x=1802158575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j8xmr7SUoMua+cUZUDJxREJq5MS3n/cE6KC1BdybqvU=;
 b=g/CDOvZoYPdnTmHcJx0ilR7gtFkFo4+61ZRSSinPh1qXNkQaGnyVwXyl
 IZB6MxUfZ0o8+8nCDPHYUumoWNvVr22c8uqBlsRjkfY6Opg1HjgU8gWaY
 CR22rRwMiChVLL8ezATMfPMdMmPm2NpB6HAs+e9x6WqkdmLKUGAb/F7u9
 JHDbU8WESZxouhw9HJI5QLoKYMhVzMF/n98Y7WfvA4xOkKmEIXYBWNhm1
 0UfMF0RmbUbGgYK6T7ljgYnq1g/7kIDJSQVM+ImQcIpKsnqLkpu3PCn4m
 l2LGCfjp9lOvned+LojVv4/0or6KpZwEoSKrZnWpN3QJP6cioj+l7PsPI w==;
X-CSE-ConnectionGUID: J1yBkTFjSl2OevbilvexZw==
X-CSE-MsgGUID: TkDT1brqR7qypvv/DN87jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75575829"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="75575829"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 23:36:14 -0800
X-CSE-ConnectionGUID: uUUT5OlhS8m9HB7ZpCc3wA==
X-CSE-MsgGUID: WjSLvdx/RXiVJL9ikAIImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="215994597"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 23:36:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 23:36:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 8 Feb 2026 23:36:13 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 23:36:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdgaWRlcFR/iDFUix9dfZsNhhfpLcZvTY3WKEXwZYfQyv4X8vC/wRF9BKBWKGskSYhFtZvlJTLi47bPgtgvXlw8dpqZNgOf8QzKe0D5fFRRQjphrVJh4fxP22PeE3dgiNs/lwqeCOhyuto45/WUvDucG8gFuTkSCd/3BVWkPCKfF2beD2k7s+X1uTvy8e5uJDmMtjV7br2SWlxsuqLmK/5UDTOY6nxbLYs4uN4/OcYbIoGQIP7R52nsKU5Y8F5zOgSdeObAm9Jfc47FChBXglNZqtn/L1//HRZOdv9wg1W0O/zjDDVe7uobe95ssKeQXSdq54ZjeuGEAiBKWxcY/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0krmmtPISKrFW4X+fQxX++vHYhFQDJg9LJgx0vQYs0=;
 b=QBCa8PecqUa6XuNslX3TC9Sq9SH59zm9mvt5r3+GYEZEkiU7LfcACFzFA4U66PQKbiqiBJOyxpemD5AlDLMsQNHVhPrNZ0bMhyPFM/B7o88r8/bdYGxgm76BFcc9/hctz+/fpWH0dUY6vyarNSwIXfAq4vey0P6ta0jqTUEe92Gc+tsn5D32pmkRpZU3uNIQU3+Ja11ZPIK0Vh0W/4LVbVQWsfOSHwB+hE++5nElQ+zM5t3oliV4MM/HOwlhY1F7v2ty5H4eAndbbxmNp1xEg/9vKh9v+x4/mMuuuSy+KSZW0thxwkuSEhPuWRnd9JtjHT+qUMPUBw2uiFcpmpf+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB8173.namprd11.prod.outlook.com (2603:10b6:208:44e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 07:36:11 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:36:11 +0000
Date: Mon, 9 Feb 2026 07:36:02 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/6] tools/meson: make per-tool dependencies
 instead of using global deps
Message-ID: <arrbwons2czt4hejbsssdiawjdsqiufso4ns7kh2kav3s62iyk@in6yrhmplmzw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <a5e52453497b053767bb001cee20c7ad200a764c.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <a5e52453497b053767bb001cee20c7ad200a764c.1770212190.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b12bcb-adc4-42ec-3b49-08de67ade585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZaTEVnbXB3OFFKeTlJYUU3MGpkOTF0VnZXejI2cEdIb1hGMEtxWDc4R2lm?=
 =?utf-8?B?cVdiSjFiaGRDTkhhYld2RURIQnR2U2NCZHVzT25lMS9tV3RvMnk4R2ZKaFFO?=
 =?utf-8?B?LzdLZXVVM3FRbHBXUmZZYnY0L0F4czRpMDBaZlRBQlVmQ1FTMFUxYkIwL1J2?=
 =?utf-8?B?ZnBGN29kZ2FmTDBDUnNReENQRGRFQk0zNTlqNzhkUWU2VFJjWWQvL1N6T0RO?=
 =?utf-8?B?Q2kzbHRpd3FTZDdQZ3pEeGxtblU0ckNCVktaSm5pWjVHU2RUVDRKOXNzMEpz?=
 =?utf-8?B?azVqaHFZbVMzcFh0b0ZlNEpwRHhLVmVDcDhGRmVlMFlndXo1dlliVXpiTGxH?=
 =?utf-8?B?ZHBSaG4ydE4wY3JLT2R0ZWVBNzZVWUkycVIzOFVub1JJbGpQYzNaRUtnSnFy?=
 =?utf-8?B?cTRVN2RmSmN3bkpyVWJxdVpTZW4vQlVjcklZa0pDU015UURvVm5HeWpDQ2Fx?=
 =?utf-8?B?SFJwdS9LejRZRkF3ZC9kU1VBdVdiWlhMNnZtVkpmamVtVHlWbk5SUUhsZVgx?=
 =?utf-8?B?UXlkNFBqTjBVTml5U1hUVG5hQmx3b29jdlpEeERaZ29kYkhaL2lKNmY4a2d1?=
 =?utf-8?B?WjZsdmJUUG5NODZJQkdXc01GZkh4S1lnZEVxVm5hOHNpLzVtUHR0UDdlY3Ur?=
 =?utf-8?B?TE50TVJZTHJSN3BLQ3dLUXhweEE3NFV4MDFWYjNlV1MvN0h2aHlsQlZHUk9j?=
 =?utf-8?B?Sm9HVlYvN1hYQVpnNTkxVDN5bzA2V3RNRXZSOW5NMkw2NHZuVnBFdisxSUpK?=
 =?utf-8?B?eGd4Vy9Zdnc2TFNpVFMzQU5ZNnpkbytNVmt0cHdTRDU4SSt6UENaSzI5Z0c1?=
 =?utf-8?B?Ylg3ZUtaVXdzSFc4QWVHR3U2NXFaOHRLT0FFdUJoUjRNUkp3L0pMRzlaQTFt?=
 =?utf-8?B?MnNhVVEybzFub1RmbVFDTVZlL0hPRm1tc3ozN2VuaHdaOS9EZVBDeWwwaXh4?=
 =?utf-8?B?dkk4eGFvelYvbmo5dWFsSTA5QjZHN1NCTDViR0s4SjIwTjJzNHRoUk14R3NP?=
 =?utf-8?B?NjUxTDVBOTJ2RWVOQWJDeGNXdEhhcHhvWjdyV1RKTVZpdFBzeFgzTHNTUW5v?=
 =?utf-8?B?aVBPcXRvNGExNWEwRjR3N1A5bDdONDlPb0FRUG5FOGVDQ09zNElnSkIxcGlj?=
 =?utf-8?B?b0lMUmw0cTJjWnNJMUFzbU5mM0pxWEd2Y1dNVE1VYStHMEQ1a1ZKSlpyTU93?=
 =?utf-8?B?WHVQRVZ4UzAvM0xvUVBBV1B4V3Vua1NuY3JaeFkyOWpCemFPUEE0SmF4dXB4?=
 =?utf-8?B?RFlYWGl6cnlmSDBLVE14UTI2Y3l6aGd4YWp6d0V1WkhxYnpDRFhaTEt0QzEy?=
 =?utf-8?B?T1M5NGVXanJGVzB1VTVPODAwdWVob0lpa3UwRG9lZVc3WTc2Z1JWb2h6SGNv?=
 =?utf-8?B?c2VBQUEvQ3B2ZW40RXNXYS9JVGdIUU9EOXVoTmZTWVZjMmphUG5TWE9UVFdn?=
 =?utf-8?B?V2kxRTVVYmVEdjZ1UVZKSFN3MWVpVURISmI1ZzROTWVTZXoyc2lPRjZtOFJJ?=
 =?utf-8?B?UDkzdXFZNE1jUHE0dk5wU201cC82WnVENUZCR0lyMG4wWUFsUVB6a203RDVU?=
 =?utf-8?B?SG0vdjN6d2ZSbTU2Zm9EOGdkVEM4cU1iTzFUOGx5MmwzRnhoUlkwR1Y2ZytG?=
 =?utf-8?B?ampsYnlzOEd1bzB4K1RyY2thTk5QK0xlaytIWjR1REFrSk91NjIvSldxMDcr?=
 =?utf-8?B?L3N5cE83YzEwdG1KeXYwRnRFbGEyTEFiWWNQNVVyVnpvSVg2WFNYWnV3eEZv?=
 =?utf-8?B?LzF3YkFWQlRmcTZiQTBlZWc5SDU4R0FRRXBRclJTUUhpK0F4N0gzUEY1R1pJ?=
 =?utf-8?B?QkRjSVVOb01BbTJEM3NDaENrWHAwb2xzRmY5dmY4Q0hnRFF0aXFCT1V0cjA2?=
 =?utf-8?B?dmRsNjl0bTYzc3RUS3dqYkdWMUthdC84bU5IWmpCNUMrbXI3d1A0cTd2UWVV?=
 =?utf-8?B?TXcvQkJ2dUJrQkZSZG1YK1dDdUc1N1d2aUNoVUJqTzlwL0ZiTW1VcnA1M0o0?=
 =?utf-8?B?azJqcmRORGRjcXRWTmMxbTFFZVFFUHZlTTRKb0hKanJ1b1VsQjd1ZHBkUWl6?=
 =?utf-8?B?L3ZZUGlkYXVlK1JlOURlZE03UklnMkFqTDNrM2IyTGczMVluYkNyd1lmdWli?=
 =?utf-8?Q?StmY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9MZzF5cTYrd3NLSytqYzVyVDVURThVZDBNN2Y1T0Q3ZmdaNWpxZDFRR0VS?=
 =?utf-8?B?SmhsdzNkcWV2RUFBc0lqSWFKU0RzV2RKd1pYVCt2NHpHbVA4OTU3dGpWM0ha?=
 =?utf-8?B?a2o0YldZRHVUMEdjb3ZlU1J6TUtmbHoxaGRBbEZGTDk2UW5DTjdlcVJjcmNO?=
 =?utf-8?B?L0Q5TVQ5M1pLWUdPUS92Q2VlMm1XWjVHKzIxVFl2bUFQSXpBQVJUNXJmTTN3?=
 =?utf-8?B?WUtEQ2hlaHptZTB6Y1IxZU1kUG9oSXJHVDFGUzJTZjRBS3Z3bzBlSUNWRWVa?=
 =?utf-8?B?aGY0LzlKdm5JajdtYXBxOWkrMkc0SHlZdW02RHBDZUlPSlJIeSsxOVM2QU80?=
 =?utf-8?B?aXBRY1RJWFdNbllnMU0zUFp3R0VVZVBDb0RuTEorUXlGOWluYkk4SDhjZWdF?=
 =?utf-8?B?ZmhIbytHYUdEWk1HN0xFVWtHRForNHVMK3Z3dnVIM21zYWV6UWt4RjI2K3Ex?=
 =?utf-8?B?YVlYU1RQL0cvazNhNzBLeUZSNnVsL1ZNRXNRTm5lR0RoaVVja0N3VWVycVFD?=
 =?utf-8?B?eVVneHJOZ1RWTWZWall5UDU0djJla2VwTWJ4aGsvemJXVXNMM0N5aXNadVBx?=
 =?utf-8?B?OHp1U1lzM2R5ZmdTOGZEVVQ5OEg2ZEpkbmthSmxBTytOb1QycjRNaksxUXMz?=
 =?utf-8?B?TWNiZHFIS3ZXOXBlMlJEVTRQMW1SNjNjdGFjQzRDTUt1dEd2azk5Y0dlQldL?=
 =?utf-8?B?U00vbitONksxT3Rxb2dZYXJjQ1B4UjgxeThVcm9HSUR6Smt4bnNoS3E2dFgr?=
 =?utf-8?B?QjUvOHBuOHJaUDRqQS9DRGx5Q3pQeE1HQTNEamplWEN4TURNRHZodEpwdHk3?=
 =?utf-8?B?QStEYXJjTFhrSmJlRlFxVHNySnRWUWU1Q25VUVNvZGFoWTF0MkZIWTg3YTlS?=
 =?utf-8?B?SjQ3QWZTb1oxWnJVQmh6NG9odVk1UmxpYUFONmUvamhjWktQei9nbmVCaTBq?=
 =?utf-8?B?dEpwN1NQckY0bzdoU2h4SXpQYkNVVytUNEVyNnc5LzJmaEFPbVN0aVhCMGp5?=
 =?utf-8?B?WjZObkpkMVFiZlJMbFE3cjFpNWRGVHo2Ym5hQ21zUTJPK2NkVS9nU1BLVE0y?=
 =?utf-8?B?NUZXWnZaZWRGRllFV1ZZcG9ha29lZXhKWTIrek1SRUNFcXUzZlBQQVFSQU5n?=
 =?utf-8?B?VS8wbDJnQ0MwMDdHQkdPREFHY2czR2xkK2Z6LzZCakZQbWlsb3IrSTUyRnZa?=
 =?utf-8?B?ZjRxQStuYkhGZk1laEhGTC9Ydno4RzNpTzRVKzg1Y1RCOVBwdWk5OE1wcDFM?=
 =?utf-8?B?Z3hiOC84enk2VmFSNlliK3ZWcHFVNk9ZRWhBWFBEQ0ZRbWVFSXVFNDFuRi9N?=
 =?utf-8?B?YVpUR280ZWdIUy9LSlMzZ2ZZaldTcGVTcmJZakJTYnc5QzY5cCs2R3REZkZT?=
 =?utf-8?B?NGpCdE9FR3VCWHRPTjE3eXNkdEliSDdwYWpEdlNwSE5mNGdTd0tBYksxR0tQ?=
 =?utf-8?B?NVVUckxhbmRKVEpzb0IxQ3dyU3NaVmlJSU5CWWVjcWczdnF3TTg4SXN3eUt3?=
 =?utf-8?B?eEtkWWpXamkxZW5MbnNIanRZS2k0a1JyVlNjeEo5Umx1TjdBSW1Sem9xUWVC?=
 =?utf-8?B?eVp5M29vQWNqYTBKNGRpSEpqZWtKdW5tZG5TbWFBSWk3SHV2T2drc2hpTmNW?=
 =?utf-8?B?R05ZdkNpekM3NWVtQkIrcU1qcURxTHN4VHBGVGxsWmNoanI3alZlaGh4S3Fa?=
 =?utf-8?B?eUR6UUF6OGcwcmRjU09XYzFPdmRHeFBPd0RsV2JMZy9SZDVqbG81c1N1c3Bj?=
 =?utf-8?B?bjJ0Z2p5dlVqVkRTZHZYTW82WldRaDFZMmp3cks5K3JYNmRLSzdRYjBkdGw0?=
 =?utf-8?B?alQxVlg3MVZOL08yMXkzdENhZGhZdFkxc1ZLR3pldDFWeHJ2TFIwZHBkN3Rm?=
 =?utf-8?B?cXNMdm9wVldIbmV3a01oL3FjK01SQUV2SG9vRXZmRHJHaG5YQUMwT0xLOWN4?=
 =?utf-8?B?bEk2WXJZeGo2VXBKa0puemRJWlMwUVRZKzk1VGNpM2JlSDJad2JGdFVZOXZ2?=
 =?utf-8?B?SktVMVhIV0FaUFBacThpL0c3cEhoUEp0ejNOSVo0SWdaRkVuUmFLMXdIZU9y?=
 =?utf-8?B?aFhoVmVQTDRyeW5vaDlLd3dtYVpOK0xpYmY4ZC9ncENadnNlVnBaN09PeTFY?=
 =?utf-8?B?K3dwSStaOXY3TGlDNXFuRDQzbEpjTXM3THFjM2VZdjZTWHlabUpxeFRsSVlk?=
 =?utf-8?B?V28rZzdQVEU4T1FYL2hFTncrMjZyWEc1TVEyYUtIRXFhaVpUZ1FWZEhMbWts?=
 =?utf-8?B?RHkxV09JZ3pialJGZ0NvbkxWWVh6RDY3VWx3cEpoL21IQldzTFY5OGxSdEFn?=
 =?utf-8?B?ZjIvdXJWeUt0TUxBQVpQOU55ME1KWEJiT3JVWm5zMDZqekdGWDFtVkhzZ1Mz?=
 =?utf-8?Q?djQQJxMfIiKGz05c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b12bcb-adc4-42ec-3b49-08de67ade585
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:36:11.2528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEx/1mnBFDQp92v/JlB/w2RwS/nduvwJdSgIKyosPRMSIsLl1WFwa96wEdMM3/RyHM/k6WvsM8Xw8MTGPDSC6gldclfPSwazxk59prK1Oyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8173
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

Hi Sebastian,

[...]

> -tool_deps = igt_deps
I have a suggestion for another, separate change here:
igt_deps could be defined in the root directory of
igt-gpu-tools. The name suggests that those are dependencies for
the whole build project and currently this entity sits hidden on
the same level as tools/, in lib/ directory.

This is not directly related to your series, but I do not think
it would be justifiable as a separate, very trivial patch.

[...]

> +
> +foreach prog, deps : tools_progs
> +	exe_deps = tool_deps + deps
> +	executable( prog, prog + '.c',
> +		    dependencies: exe_deps,
> +		    install_rpath: bindir_rpathdir,
> +		    install: true
> +	)
No need for a newline here.

Rest of the changes in this patch look good to me.

-- 
Best Regards,
Krzysztof
