Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ABEEEC285
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 21:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009AC10E44D;
	Mon, 23 Feb 2026 21:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOgpiqZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192E10E314
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 21:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771882128; x=1803418128;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vek6tvA1IW2Natcjg4KpSaLsrHI9Crhy49+gWvSnK5I=;
 b=TOgpiqZ4NQeD/swLoL/MbF9LYGgfbx2k1j4dxz0YHIQjMggtDcyHAWv/
 muA71ZcyXAuU4Dha+p+DXmPNMKupv9Kzp+3ZEQIZg3+/sdklkUfs4jKqz
 0xUzaNQjkK7hMLMDhR8hUvbu/zEnY1zp6qDvdGl3RUtKdGpQfmbA+zAj2
 sFk9ZgLbVQfRJftnObiRmBjl8Sy30d4HkjXFrc1os/zgw6EduoBl4OuGm
 5aadAkyFmrOeJ7ot9u1AiNz+14Emg1fNHx2hqA2JWIakpTNrFiZ6OGF/B
 qfQ13ji+Gl9tO+ZmXqXgCdfaMgYwm7UlwKblnTNSetL54IRruA4h+IoBF Q==;
X-CSE-ConnectionGUID: cG9IseK2Rmqnn0iGMoYIqA==
X-CSE-MsgGUID: 63cQLgMCSxKU68ltAXz2Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72790766"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72790766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:28:48 -0800
X-CSE-ConnectionGUID: +eCU+eZoQx+2bwThtUz1FQ==
X-CSE-MsgGUID: 8dB5VaONRJ+ywh4SrzqSFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214071148"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:28:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:28:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:28:47 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:28:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPQlG6Izld8o8K8tanYRkzIcmXH+11dDMXaftLO5LytFqOnHuW9pc7zub8xfA56H73s1BZ1kHmaXIiR64guCW4hBkbeFaZNdgDQGRqojdtQlVePvcX7gJnO5riFCfsh8KT/1ZYrSxKH7x4lGz+DjQHvCCy71sRncu/dm/yL15+laPM5H/YLIq2FhiVddO2SEttGwvNdBObYixerzj2ohrn3Ag9FDa5FD7yAg0c2PkLB87zhUJyLPTDHXo7JWUDZU8vPSMczlE9xrZnu4+9ZSISabPaIaeJFhJ8IBUw9OZmEg2ZqxgM6nRc/1O6aQs8T8IGj3qGMcVm92axX52pumjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWUOWmKBVjrUV+aCS+G/c21yJy8nBEhDuUgdwAcq9ik=;
 b=Gy5sJzc/NDMOq2ZBU6cbn+W7oqvtJ3X+2jSX7F/24OMDWXx8pfFPqjRKCJkx1nWTwMCj959piyDgaiW3WebBmKolo5ITTkJLraJonwFM6XlE4FGc9yGalX6S3vfTOWfAqIT5f8EfRyyO3jJGB+xoOOKlsQeHM8vQw0NQDqOxs0uKhTJ4pGoxEILxlFt40cDl6WqyH2UryUjWxlIjqfnZVDi9kq4wujuALI1kM1XZaLRZ8DvTm5cplBFtn6iha9xm9pZKl3oSieqCikpgoCY3CtL01HD36Jt7v4ecHLu3mH3NQ+NPyldTODlDujQoRKJeBSv0DxvqCkZytO0dGB1lKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:28:44 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:28:44 +0000
Date: Mon, 23 Feb 2026 22:28:39 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/rendercopy: Alter pipeline and add shader for
 Xe3p
Message-ID: <aZzGhwylKNzKqPTW@ART-DEV-395>
References: <20260223163544.1519449-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223163544.1519449-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VIZP296CA0007.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::15) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|CY8PR11MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: b82ce887-469d-4906-27aa-08de732285c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWZUcTlMeFhGN0RFbGpNMnExZXZlanlkNzdwOVJvb2M5Q2QrRVVJTzFydFNk?=
 =?utf-8?B?Y2llM01TT2I4NGpwUVpPNkJKVzduK3JTR1U2NkR2NExOemdKNUlKYUxEQ1Jq?=
 =?utf-8?B?d1Y3REIyTCtnZlNsY2FZV1hWQkFPcXNLbG1kbDJ0d0dJRitrUlVQM1dPWDVP?=
 =?utf-8?B?VzdCR1liTmdWeXBFQ1oxaEJtQW0xR0o4Z012cStGUFFmWWd5OHpjbnNJRFpy?=
 =?utf-8?B?YXc2R1hzSzRVcTNwSlF2b0M2RlRsZnRsMDFyVnllMGR5eng3ME1HRTdUUHBu?=
 =?utf-8?B?UGxsUXl1M3RHaUhVQTJQY0pJNkNJU1JoVWpUbHFnRnMyNDhJK3RocGNEZmRn?=
 =?utf-8?B?ZWJqYnBWUGxHUm1aSDlxV0JJaDlLakRnTm1MT3pRY0djTTJLTlJNcFZ1Sm5v?=
 =?utf-8?B?am1Yc0RJNFpTNVVWeU5mNjVKQ1N3WjlRUkszZWxVWWpZdUY4RE4reHRjVi9i?=
 =?utf-8?B?R1I3Mm9CTnVYbThoUmw4T2kwOFo4clhhNld1WFB5b0dpamQ5T29UcHlRQ0J3?=
 =?utf-8?B?Yk9iWWt4djg0alFQM25zYkk0UjBtOTA4TnA4Vno3eklFdGVJbldhMG1BNzZC?=
 =?utf-8?B?Z29pNkNJOVpjWEtPVlQ3ekxsNUk5MjJ0N1lnbFJNa2xRV2FlemUwL1JyQTdB?=
 =?utf-8?B?c1Azd2x5YmEvYVFzZHQ0TGl3Z2dKY1RFRms1TmMrdTVIeURFc1RCNlFhQXJi?=
 =?utf-8?B?R2I3RWgyNGtVME1jRWxoZ0hDblBaQi9GWkZQZzBXTVdKa1doQmN1SW56aGNT?=
 =?utf-8?B?QlZEU1hRUENvQzJ1N1o5TnNFMDVlcGJCRzhKMlc2cC9ybHVXcXNCKzlsUllh?=
 =?utf-8?B?eXRhMVZ0a2lLVGVVZzR5RjNWTFc1czNOZjBPZjRUTDNGWDF2dmhGZjUrU21V?=
 =?utf-8?B?OTJKaWFDamkyNnpRQjBVTy8wcnlhNnRPVm9tMGpTWlcwZ3FWZ05mVGpPOG9T?=
 =?utf-8?B?YjI5VWh2N0NJZXBVUTN6QWMxTFlVMWd1WmdqWDJ1ZjNydWVQbStGRklPMFBw?=
 =?utf-8?B?OXBSc0dEL09FbUV3OWlOelg0bThsVnkxUkhGUGlVV1pRa1JwdHhHNmtmL2FC?=
 =?utf-8?B?K1luU0szd09mczNBaGh3SGJnZE1Falpmc25BZHI3L3dHQjIwV0d4NHhuMFFr?=
 =?utf-8?B?ZjN4Y3BROS9zbWhvbTY5d1BIVFFVZnJQSGptaVRqOGEwNCtsNFc2bU1nWjlm?=
 =?utf-8?B?ZGMrdEZtVmZ3NVREV096UlB2d0dFbmdPS2dhZFUyamkzUjV5SVBldlM2L3J6?=
 =?utf-8?B?YW9HM2NUZ09tRCtsVVRUeGw4TTlUS0Jsb0xJMXBYak44Rk5sYjA2b0xKVVFY?=
 =?utf-8?B?aVpzV0ZMWDM5RFlCQ2NRcmYyUmpMM0hJckRpdDQxVzR1dXROcmp2cE9KOU0y?=
 =?utf-8?B?bCtIakZDZWg1K2hOUGRSNXBXcVJlWVcxem0vMWZ3cSt0OHBUbWx4bnNyL3BB?=
 =?utf-8?B?eDduYVF3VzBZbnR0QmpTUjlvcm5RY1RTYjVFazNKQUJqSTdHNXRJSXk1NnFY?=
 =?utf-8?B?SHlVaURhUENVdUhTamZrbUFVanpIOTJldkZNa3VPeUl1dll5Yng3bjFPSU9K?=
 =?utf-8?B?bUpDNEtFYk1WbTNJVTVOcVFpMGNOOEp0aWZtY1ZrSTFjRTBEYUd3ai9tQjEz?=
 =?utf-8?B?dUc5N055azZrTnduc3ZDL3c4aXpiSno3YXNNcWgzRm1mYnp3SzA1WlVJa1BY?=
 =?utf-8?B?K0xHZmNSd3FpREozbkxkRUh5QUNIcGR1YmRsS3BldGw2WE5xMUV3VjhyM0V4?=
 =?utf-8?B?VHNNaWU5dHNtQ0Zqc0xxWVNFNFk3bDAvc2oyUU5GK09FMG5jcFlRd2hrTis4?=
 =?utf-8?B?ODJiVjNucEZhYkUvWW5uMkQ1V01JQmVzbWpzVzRXUVZ5WWluMmtEOVF3S1B0?=
 =?utf-8?B?YUF3ZnkwOWJQUE0rVFk0QWdCb2FWbDJhSmNrU01leUN6LzlvV2VyM0pNN1Ro?=
 =?utf-8?B?TEhmMWlmN0p1OVJQNThTaUJqblprVDM4STArWUhUYUZTS2IwcjVDcmV5VlJ6?=
 =?utf-8?B?dlM0bkh3NzQ3eklEYXo1VGowekUzUVl1OXR3R2JuQ0ZIYzQzNGhRcUUrRU1y?=
 =?utf-8?B?dk1OL0l0eDJCUDZFY3ltZ01NM296b2xhdW1sNWtJZ2E3c2ZVZEtVL2lRM1R1?=
 =?utf-8?Q?89Uo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGhVNjdsaDh2TXptMm1SblQ3ZGh2UVNhZlI0QnVtOWNQWjIwalArWFNjMUZj?=
 =?utf-8?B?bzh4WkFjYS9RdnBNMk5XYzFXWjNMUFo3OTBBcjdrVnpSTy9zbDdnNDhORFE4?=
 =?utf-8?B?MHhmZ0JmNFl4dWVCUE01L1doVVRmOFVJRDRyWlRYQU5sbzBiT05nUklGUTRs?=
 =?utf-8?B?UVFZNk04ZjVDb200cy9XOVZZSzVzclc4K1F4YWsxclRNck5ya2p4QXZzdFha?=
 =?utf-8?B?Z3JBYjdob1h5QTExQk1JSld1d2M3alVLUm8rdDdEaEh0eVBEN1ZMMnB6WHhE?=
 =?utf-8?B?TVU1V0lubUtWWEY1VDRqN3dxeFpnTDNmaFd5RkVXRnVtZXlLOE5QQ3NWZ045?=
 =?utf-8?B?L1JDRVk4cGdpU3g3OFBOU3FUVjdWZTMwU0JLTWlOemNhM29TcWFRZzJsUHU4?=
 =?utf-8?B?S21EVWNCMzIwYnlwSFNnMDNFMGozVGU0UkdZd3V0Z2VlV1BnWk5xWVdaUm12?=
 =?utf-8?B?WklseEZXdHhNUXVSYnYrMDJnV0FvMzR3UmVzdzRMZzk1d0Jmc3Bzb3doeHFa?=
 =?utf-8?B?aDZ5N2hPUDljMGhWV3ZCdUU0WU8veGxYNVJ3N1dZN0lQV0ZJN3NBSk5xSnZE?=
 =?utf-8?B?ZG9EVVVjUCtaZEJlbzZUZXl2UHRPMnF1NzA5VmVDc1ZYa2xVNklvSjlLd0t0?=
 =?utf-8?B?VkVUNHFCRTVPQ2dJVmYvdzlWYytkNXFSZGZ2NFZMbk16dWxrU0w3WW9yQ2dp?=
 =?utf-8?B?YjRWSzlqd0FxL0pyTS9YTVZyRlpiclQxOVlUM1FqTlJxTVo1RDNkTndXSzdv?=
 =?utf-8?B?NmpsMmY1ekRmaFBFaUhWRytOb1JMdHZsTVVrbURNa1JSZFVYTmhYK3M5TSt2?=
 =?utf-8?B?QzVVeE9vaHVCZXNVMVcvVk0vQWc1Vno5ZkpFdy9waHVVL2ZobzVMYXNDQ2tP?=
 =?utf-8?B?Z09nNnRhNGx1RTdGV1FCTWc1eEVNOEJlS3B3Zjk1VUFyL2dKQ0Rqdm5keWZ4?=
 =?utf-8?B?eFdBT05ScnZZQ3dmSktQM2xyanN5SFRJaldyVHMyWitBQUZpRkFKVmdjeXZ3?=
 =?utf-8?B?ajJKWlNidWozSmcxSExHcXViV0NIcTRwV0g1V0M0U01hb1dzTGZKeExyRU9I?=
 =?utf-8?B?VzRJbFZBT1VSQzU0RVBTV3Q5aUxGT3pqWHU1dmZNT25QdGdud3dxb0x2dHM3?=
 =?utf-8?B?ZGVLTU9Zbit2RmV1OTZMQ2s4NWFxa08yeHlJejRiRDlHakhYRlpwNU5BaDNz?=
 =?utf-8?B?MXZ1aFpYZTlkQnFxWlNnNFNpMUVVelg3VXY0WkswZ21FZThTT0V0ZEo0alZT?=
 =?utf-8?B?SEY5eHFJd0wyaTlNNjlFZmZZRkR4KzdlRDBGSnJvR0lhMm90cWhQV29DR1ZW?=
 =?utf-8?B?Tm1hN2V4WG1ib1dNajZGeTJBbWhVcTNSYWJVZGhVYmJwRS9EWSs1WGc0QnJI?=
 =?utf-8?B?U1VibEp6SXF2MDNJTTU3eTdmZzdHdzBHTDYzSVNwK0U3RzdNL0N6UzAxaWZD?=
 =?utf-8?B?clNLVnRIdHRxRVhFVDduclpBSjNUNFBYTUYvK29xbnd6dmxjQnBJQ3cvZ0NR?=
 =?utf-8?B?a1BHeTNFbDE1K0t6R3pHeUxOTTBQeG5WVS9kYmg2c0ROMjJsUmtLNmZwcVhI?=
 =?utf-8?B?bUNsMDRGMWdIYkFmUjFUUkZDbHo3QjBNTS9ZS2pIYU5rODlKWGo2eXpGaU01?=
 =?utf-8?B?MFJIbU00eDF0S3Bnbmo3Vys1RXVUTFUxNVdzUGw0T1VkYjMySFdIQXBjR1NF?=
 =?utf-8?B?bXRiT1kwVm85dUQ1aTczYXpjRG05YUFudmxYUE9CT0tvejBMR1lRNXhuYWF4?=
 =?utf-8?B?L0duM3B6enFKdU40MmJqanYxeG1CVWVZVERBTVFUQ1lQWnl4Mk1yOHJVUHI3?=
 =?utf-8?B?TExRU21DWjFNcldvNG9qNFBxcURHaUV3L2FkZW9Ic0tJTmMxYmRQZ0kyTDI4?=
 =?utf-8?B?ajZiV281ckJkRHhMckZnQ0lsNFd5T01YQkUzcEs5d2JXUTRqQW42SzVtd0NW?=
 =?utf-8?B?UThITkVtUER0OEcrdHZLNEpiVEdwbG9HejROd1JZZERqTzN4bSs0akFLWXgr?=
 =?utf-8?B?N0oraDlIaU1zYXFrMzRJbFd0WTNyMXdCeTE0VWE1YmpYbDZFY1M4ZE9tZmti?=
 =?utf-8?B?b3M1QXk0dlpqZkNMRlJWUHdGc0I5cE9ma2xTZWMzWCtma3ZxWmJVazBEK1Fk?=
 =?utf-8?B?T0lkVlN0WnlLaTFrOEpOTDFxV1FBRkFYZlBFaEVQOEhWQlNDUE9hMzliQnpz?=
 =?utf-8?B?NmVxR1lsaTBqY3diSE5GYVpLY1F1TTFqWlVoWmZqbXdYb1lFUzJsQTM3aWgy?=
 =?utf-8?B?NTZRNVMvSHU5Smk5UGJkTjUyUUZtTjcvVExvQ1dCaEd1ZkVzM2wxaEZVZkZt?=
 =?utf-8?B?dWtsTk50QzNzUzU0NHJKbVRjdXZxWDBDeXlhNVBhMVhjT28vdi9FZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b82ce887-469d-4906-27aa-08de732285c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:28:44.4548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCk2KtvjUf8kSHt0XSaj/+7e64V5c86c7WgEN+70cXr1gVec1NuapZmbPZkSUmfzsRG5C7KVwV5peQEveCvO8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
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

On Mon, Feb 23, 2026 at 05:35:45PM +0100, Zbigniew Kempczyński wrote:
> Extend rendercopy to support Xe3p platforms like NVL-P. This requires
> reassembling xe2 shader and increasing urb size.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jan Maślak <jan.maslak@intel.com>
> ---
>  lib/i915/shaders/ps/xe3p_render_copy.asm |  8 +++++++
>  lib/intel_batchbuffer.c                  |  2 ++
>  lib/rendercopy.h                         |  4 ++++
>  lib/rendercopy_gen9.c                    | 28 +++++++++++++++++++++---
>  4 files changed, 39 insertions(+), 3 deletions(-)
>  create mode 100644 lib/i915/shaders/ps/xe3p_render_copy.asm
> 
> diff --git a/lib/i915/shaders/ps/xe3p_render_copy.asm b/lib/i915/shaders/ps/xe3p_render_copy.asm
> new file mode 100644
> index 0000000000..fea5c5c01e
> --- /dev/null
> +++ b/lib/i915/shaders/ps/xe3p_render_copy.asm
> @@ -0,0 +1,8 @@
> +L0:
> +(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f       r1.0<1;0>:f       r6.6<0>:f
> +(W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;0>:f     r1.0<1;0>:f       r6.1<0>:f
> +(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f       r1.0<1;0>:f       r6.4<0>:f
> +(W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r6.5<0>:f
> +(W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u,v,r,ai,mlod using sampler index 0
> +(W)     send.rc (16|M0)          null     r12  null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; render write  last render target select to bti[0].rti[0]
> +L96:
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 3b25a385b7..b095065746 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -669,6 +669,8 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
>  		copy = mtl_render_copyfunc;
>  	else if (IS_DG2(devid))
>  		copy = gen12p71_render_copyfunc;
> +	else if (intel_gen(devid) >= 35)
> +		copy = xe3p_render_copyfunc;
>  	else if (intel_gen(devid) >= 20)
>  		copy = xe2_render_copyfunc;
>  	else if (IS_GEN12(devid))
> diff --git a/lib/rendercopy.h b/lib/rendercopy.h
> index 3733e8a09f..570797c490 100644
> --- a/lib/rendercopy.h
> +++ b/lib/rendercopy.h
> @@ -47,6 +47,10 @@ void xe2_render_copyfunc(struct intel_bb *ibb,
>  			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
>  			 uint32_t width, uint32_t height,
>  			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
> +void xe3p_render_copyfunc(struct intel_bb *ibb,
> +			  struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> +			  uint32_t width, uint32_t height,
> +			  struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
>  void gen12_render_copyfunc(struct intel_bb *ibb,
>  			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
>  			   uint32_t width, uint32_t height,
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index e6e5b82148..d44988010a 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -146,6 +146,15 @@ static const uint32_t xe2_render_copy[][4] = {
>  	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
>  };
>  
> +static const uint32_t xe3p_render_copy[][4] = {
> +	{ 0x8010005b, 0x200002a0, 0x02020604, 0x06640104 },
> +	{ 0x8010005b, 0x710402a8, 0x02022000, 0x06140104 },
> +	{ 0x8010005b, 0x200002a0, 0x02020634, 0x06440104 },
> +	{ 0x8010005b, 0x720402a8, 0x02022000, 0x06540204 },
> +	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
> +	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
> +};
> +
>  static uint32_t lnl_compression_format(const struct intel_buf *buf)
>  {
>  	switch (buf->bpp) {
> @@ -737,7 +746,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
>  static void
>  gen7_emit_urb(struct intel_bb *ibb) {
>  	/* XXX: Min valid values from mesa */
> -	const int vs_entries = 64;
> +	const int vs_entries = intel_gen(ibb->devid) >= 35 ? 128 : 64;
>  	const int vs_size = 2;
>  	const int vs_start = 4;
>  
> @@ -1395,13 +1404,26 @@ void xe2_render_copyfunc(struct intel_bb *ibb,
>  			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
>  			 uint32_t width, uint32_t height,
>  			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y)
> +{
> +	_gen9_render_op(ibb, src, src_x, src_y,
> +			width, height, dst, dst_x, dst_y,
> +			NULL,
> +			NULL,
> +			xe2_render_copy,
> +			sizeof(xe2_render_copy));
> +}
> +
> +void xe3p_render_copyfunc(struct intel_bb *ibb,
> +			  struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> +			  uint32_t width, uint32_t height,
> +			  struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y)
>  {
>  	_gen9_render_op(ibb, src, src_x, src_y,
>  			  width, height, dst, dst_x, dst_y,
>  			  NULL,
>  			  NULL,
> -			  xe2_render_copy,
> -			  sizeof(xe2_render_copy));
> +			  xe3p_render_copy,
> +			  sizeof(xe3p_render_copy));
>  }
>  
>  void mtl_render_copyfunc(struct intel_bb *ibb,
> -- 
> 2.43.0
> 

LGTM,
Reviewed-by: Jan Maslak <jan.maslak@intel.com>
