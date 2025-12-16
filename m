Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC58D5E374
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 14:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813A610E2CE;
	Tue, 16 Dec 2025 14:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1HHKUej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F95910E2CE
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765894702; x=1797430702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v2GBnhSVuc1ltjsiJS0SbCPXQDeN6VkDYJNteAi4j8k=;
 b=n1HHKUejAuCNlJV9m9p90GVJAkjQ13qTYupNdjNi166f9BEBJWDldKA2
 5TX+pVzZYkDbLbkLPeUdZDR1HO2lfctPklhLSkXJErpWglw5PejSSKa+q
 +yKiX3uXgL01ENLfHxxo5ABnd9A5E6YIi1UveaZE2k2drkCkC0dOn7Ygn
 XlcYIyyP5I0JZ0s9JL8xUxbu2NIJhFd6DiY4Wk61UOuO/dhNLbacpamLG
 CdFrtpaTqziY/ksv57vfsBXC84VfQqNcmfOvH5QEATyEiD4QZJ/bnCrRp
 KiMpPCk/FaI8i6WKEO/YkKaUHJGgkg+07w7ItGM4RAj/oLPiYKwynm+Jd g==;
X-CSE-ConnectionGUID: 7pswNRs2RIOmH8fsQAod4Q==
X-CSE-MsgGUID: ZZ+T5b5iSbOqXjzMGFgd/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67693106"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67693106"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 06:18:22 -0800
X-CSE-ConnectionGUID: z97wdWAgSa2fnfqeyFOkLg==
X-CSE-MsgGUID: muDhjfQzSASkWL2449ouQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="203132316"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 06:18:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 06:18:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 06:18:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 06:18:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIqqpXFQPXw/EoeHfjvJm3+p+C4BDVPQ8Z73tzTR4rSYO4ShATsbD59nQ+QkVWX9mMl5G5kOd7KMQUIITJsaAMA72RT25RYrLvbFzL3fdgY0U6hs2fsmvw7UIquKRG8FtY5P1056+ZPbbDqjxLqkNZk821C1aDAmku5JG8amkRUx99UeSb4Oaf9nK3rH0VmuPzl1WPTzFZ0YZYymWZNWTiNbOFt4QDl8DOiSiyGYglj8PAEUzzMShKnojvwDNZ/ccceM/bFgyrz4xTPIb5LfomsfXsMJCBOvG91GE23CtUeD2Bz4leoSiycZRmlUhLwXn6636wmqgHb0efyHJkatww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWPB2qSB6dVPiZZu7w37KGeMdCn7L+9E+7I+YpCmEdw=;
 b=X6pWoMqNurAGkt0UTd0YOa1hKdlnb9kZpKRpPvhhWTZ9l1d1Zg6Z2H2AeSgszia3taL+Z2+VViM6hnP28DmmS2o7JyYUJRlROA8o6gxHr9ymZOsuEkPsFHWLU/t+hypddBV3l4RxCr/rNf9F7XxS9xyzuSNUsyE3cpps7L9SqEqgHlGH4e5eVws7yARtsKlYnlljKBNAQE0+X1Op4scotp/BB53JhN84xfhs/+Ox1Xw1fMYM+JhpAaIlWD5Aqd1F6iYr+LaxC8MJnOfUeiYEiFkk8HHC3NCTpaa0GJwTq563S+QoiIJY3lYmy5AznC8xzpjmKSJlj7lJwQW6E5KsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Tue, 16 Dec 2025 14:18:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:18:16 +0000
Message-ID: <b49b01e7-935c-402e-93c9-eaf1f4ecaca6@intel.com>
Date: Tue, 16 Dec 2025 19:48:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20251216080951.199893-1-karthik.poosa@intel.com>
 <20251216080951.199893-3-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251216080951.199893-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0122.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: be33e285-9327-4bbc-89f3-08de3cadf4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlV2NVc1VHppRS9yVUc2SXcvdllkWGtpcTN3dndYR2p0M09TcmxabndFbTZr?=
 =?utf-8?B?b3ZXM3RsSldyNGZ4YVR3MmxSRmNaUWl1V2FXcjJvamNTYmVNM1F3cmc1ajhM?=
 =?utf-8?B?TWhKMUtaN2JMbGRrT0EvUE1QVk9JRFZJd1hJRkJhRFJMSytUeUx5THpEQWl2?=
 =?utf-8?B?bjYrYm5SelU1aTJKYUF3QTdGM1RjYlRxTDVlQ3BKelVmeno4Z0FTSkM3SjZ0?=
 =?utf-8?B?UWx1T2R4SFQzQnRUS05wQ1JiMjMzUUhuMjRGTHoxcU5GbDVzdjFIblJydm1H?=
 =?utf-8?B?K01rNExYblROa1ZLOEFNd3p2bWU2ZlNBUzQ2blFKWDJGMVJTdkFJdWdORjBR?=
 =?utf-8?B?aVRNQkdXTng0UVpmemFJRjAyblVwUHJRb3dndnBJenlGdmFFM1Y0ZldtVHJo?=
 =?utf-8?B?R1hnaElrVVBkSmRER0Y4aW9PLzh1YVMrN0ZEWS9XVmhYU2NjdmtjZ3FCc0Rr?=
 =?utf-8?B?eVFiU1didlhsbEI0UEtMTWNvNlpUTlVYZTlkK0xSRGo0MjRnZUhhaGd1YVFa?=
 =?utf-8?B?SmdoWGYydlNJWVdtdjFwSUNUdW9DR2dETFdYUTRFbmZka3lTVVpubFlKUDhn?=
 =?utf-8?B?Z21HWk5LYUR5SEJWTDVtakhsWGh5d29kVldmYTRGNnYrT25TSXZUVnNuZ0dx?=
 =?utf-8?B?UUtNU2FuVGNWaEdWRU9PNzc2S1BuNUNiYUl2TmRVM3lIWlVGV2FsMU5SaUJz?=
 =?utf-8?B?YlRKV3dPemxUeERmMklKR0JHc1pUQ3NBN2w1NldWSU12T2pOcHBzeGwxNWJs?=
 =?utf-8?B?TnhWdnhIbndVSjBLQzZkcmZhWEdRVnpOVmlmdnRyVUlWYzRoY0pSZXJuM1h4?=
 =?utf-8?B?K3JQNjQvcGJpS2VqZk5tTDEzZ2g4dnNyK3JIM0xFUjRtUWp6T29mOGdMaEJT?=
 =?utf-8?B?SjVGTVp4UXNtV3ZZaFF2TDN5MlZNTlBjcjBXdWhNUjNMb1d5NkhaT3pNMmds?=
 =?utf-8?B?MDY5QzdTdzM0NURqNmVnRzNsSzlnRis4TmJWREpFQ2VydjNueC9xTWsrVGZV?=
 =?utf-8?B?MFFVUlpsKzVpQmhtbENpZWpEY1pZQWpobExPM1Q5a2phblc5TDV3Y3hrajNZ?=
 =?utf-8?B?TTlZNlMvUStQOVF4VGdSNDZzNmtRbjJRLzlWN3E3Z1Vha0E0WWlxR3lnWTdG?=
 =?utf-8?B?bklaRHNmeTdlc2pQUVpIb0NQbGZLRkVXN2p3LzFZTDh6Znp4YzR6c3JSdHVm?=
 =?utf-8?B?djRRR21lSXpQRUVYcXFhUnFzczVDZDVSZUNsUkRTOUpCM2VlRlVzOWxIYmhk?=
 =?utf-8?B?d2xwdFNGdlpQWmN2VlR4VTZuWEV3OTJvemRCdzlNUzJ6YXJjcTRxd3BUbnBI?=
 =?utf-8?B?eEJta2pYM0tBbXBBMStlTElxSnRkVzVLZkNxelA4c0djaGJIblBMZDluanFZ?=
 =?utf-8?B?ZloyeFhBZzFrd1B2QmtMZ2Zac2dWZFF6ZFJEQ21YSG9QYjJFVDEzemJjbnJa?=
 =?utf-8?B?OFZkekdBRlROcTRXWHVIdHBIZGE5L29QTGxOOVB3dEhkQVcrbXM4cGU2d0dL?=
 =?utf-8?B?dUdYN3dlQlYvcU9neEVZKzdmSURBRjBjVjkxVm5WSDJpZkdKbmRjYUtKV0xk?=
 =?utf-8?B?OXRqVlMzYlZJbWtaM0lVUlRYOHlhak5SeUZWdWpjZFd2K1JqTlpxRVh3bWo3?=
 =?utf-8?B?NzZjTUtJNHdvb2hlaE9PTjUyQ0hsMTk3UWVrK3ZDdnQxUm56MURuZlJzeFE4?=
 =?utf-8?B?ZU9JV2x6WFcrZUt2SWFlYmFpMkExM2RpMlhQeFFsaTFvSXRlUmZ5SGkzWnVl?=
 =?utf-8?B?UmRBSVJoaDZYQTNwcWRTZ003SVQzNkxySWhXdFNsUVdVWUxlWGQvQ3d5M1Fu?=
 =?utf-8?B?akFZK3REc1dnYk5ld2crbytsQ21GejlNOHVoQWNKR0d1WUxOeEhvbG1QT1Fs?=
 =?utf-8?B?cUJydnNib2NrR0hNZGtvcUJ5VG5uSVQwNlRmWlBzNFVpc2RkTTJWeWlucUVW?=
 =?utf-8?Q?wRsNYEtemmSvK86oCx6erLttEIkGEFR5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWJxb29lU2NHdnd4cFRhVTF5TEZaczdyY09tVUUycnZ3TlJyL2hiRmxvODZy?=
 =?utf-8?B?MmlFYnZOL3RoeXdjcUxBalpyY25nOEREVkUwT25Za1FvQU0yeGRDQTNTODlk?=
 =?utf-8?B?QTBON1M1VFNyY2Z5b01mazFDV1oxaU1wRzZzeUlRVDFFL2ZicFNoeHpXK3JO?=
 =?utf-8?B?bjFMOEVKeklQZjlkaUJVcXhjUlZ5aWJVRGw5NytNMVNlUXM0YlJwZ1ZQTFFp?=
 =?utf-8?B?S1AxaTJBaTRKdzdVRW9NcFNzWTdqUnRPYjJIODdlejJaWlRaVjJKYmc0YkNG?=
 =?utf-8?B?Zkw5dlJnc1BGV24xVnBSUzJZaE1VajZxZmhub0ZMdjcyTGNRNlVqYjREYWhn?=
 =?utf-8?B?eGN6WW16VHpXeUJJZHZ2c0JicWtOYnJKb2JyRkdpZ3RvWjlnWklyUFU3aFNM?=
 =?utf-8?B?cFZZQ1Mza29iM3daUXpQRXlUZ201Nk85V1lEY3Q2V2ljZmRRMW50ck5iSUps?=
 =?utf-8?B?MWlSelZ2aXJ0d3ZHeWJnREpEcSt2bTRLWGFiSW1zcVc3YXExRmU3NTFkQ3lw?=
 =?utf-8?B?ZTExOHYyWGo5dUZLelNBOWo2T2RKdm9hNUdsbG5JQ3NYYVAxT0xCT053RVRC?=
 =?utf-8?B?QjdZVzg4ZHQyOE4wcXBveDJZZ21vdjlKVTA4L0JWTHFjRHhJak1xNHlWUzFU?=
 =?utf-8?B?MFFqZkV6OEZpNURmYmJUd3Y4cWNxVUx0U1NCalVXQy95RldYWnM4ei9wbkFM?=
 =?utf-8?B?TmYycWRSaUJFbXFLM3pvbUp6cnlnU3ZEOVdCd2JJSkk5MDFobjBETjdhMXB3?=
 =?utf-8?B?UmVySmhXcXdOc21VT20wcEY0M2lmcDdxcnJIeDIwV096c20xZDlFd2liaGNE?=
 =?utf-8?B?aVdhdXBpVTZObVRhZ25SZ1FWQ0o3TUoxTENXVHJZRkNzdVdGVDRxT1Fycjc1?=
 =?utf-8?B?bmZpN29JSm5kT1N1eHhFQ0ZKMkNtRy9wUmdkYndORzNyU3lGMHdwdVQwMjRx?=
 =?utf-8?B?YytUVDlRYW1hM3JLdTVPUjJDbUozZjNDRThSRW9wTENZMFY3QU9JVHovYlEw?=
 =?utf-8?B?WEFwaEQvM3lLVEdaWk9RaUEvTktBVHo3MUI5OFhmTUY1blp3dUZvZm1xcldH?=
 =?utf-8?B?LytmcFIyWEJVNnQxcFdjZnZQMmp1UEFIbVFaU1FNZGxadHBpcWxUcnpwK3NU?=
 =?utf-8?B?Mm5COGRjbERsaW1kcENheXFKKzM3SmZVWUZVbzhEdXpEQlRzbk54U0lPWVp5?=
 =?utf-8?B?ejJYWFVFeXdWaFRWdUp1S0pWUC8zNzBHY1RxK016ZFlXRmtwZTh5ZllVN1JB?=
 =?utf-8?B?N3l4MWEzOGNSTFVSdjIyME93QVpLc0I5U1dWNGh6eTJYNW1jcnRraHp4aGdO?=
 =?utf-8?B?NmxIT0FFazZ6ZTVoUUxvWS9pVXJXL2NIZTRtc0dZUncvNUxRUUZ1NHc2TnFj?=
 =?utf-8?B?cFlOYmhKdFVNN0Y0cTBMbE83VzdGY09oU0ZURGJqendzdXU5RDJIL25iSjUz?=
 =?utf-8?B?ZzkvVEtaQ1VyL1ZxLzVPaHlya3lMMzdlNjZYTHJTVkZDNUNhWVF6NGlxeFVI?=
 =?utf-8?B?azRTVmpZd2d4NHlNL0RyMyt4eTNiUlZYaVVLdzJuVEdYMUpjLzFPYkh5Q2cr?=
 =?utf-8?B?UkdFU1JSdFNTeTh0SVhtQWtRSlJNajY2ejZ6T0JDbVBEcXR4RWRLM05ZYVU1?=
 =?utf-8?B?bTV3ZGhPVDNNTTRoTlV2bFZwYm5RckZBdEpFN1RYNks1WGJicXpydDVCL0pq?=
 =?utf-8?B?cGtvRVNBUW9qaTRkWTJubm1DR3Q5MnJYYWF6RHNiR0VmMFAvUXpsYkMydVVJ?=
 =?utf-8?B?UU51UTU4cm11cW5kajh3b2FsWXRabG52dm8zbHpOY2hicWVFMlRlSk0rQ0N5?=
 =?utf-8?B?NWsxWEhHelZFVTA1K3lJYzNjUDR1MEMycmRtSklVYmRkUlNqZ0ZwZDdoQmdD?=
 =?utf-8?B?cVRjcE9OV0ZlVDBseEU5cnRhR2s3Q04xVUVyMWVFMStTaEttWTRjOTcvVkhZ?=
 =?utf-8?B?T3ArNEJiNEtFL0VvVG9KWDNVZmt6R1ZmYkJ4OXJNWEN4emxkcHFSYzdhUEZ6?=
 =?utf-8?B?MC9haENSMnhteEkwcUhtRFhzRGxlY2VzaE5wd0l1aVNjRkNrRHZmam1HeHZ0?=
 =?utf-8?B?cC9sNXNNN09yeHJuQkpkZVBQcFpYVWhURXRqdTdiOTlsc0FnUjhtckJtRTBG?=
 =?utf-8?Q?e7jB2eBhLo2Dgt6IDiFt30li4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be33e285-9327-4bbc-89f3-08de3cadf4a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:18:16.8288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5AZ59MmKD14QLG/QtFaKfFOcgSGEr4ct4BLH3AEke3RigTdlPS9I3S2/qtbSn7eB0U9RU7Vq3BoPZ9sPquYxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
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

Hi Karthik

On 12/16/2025 1:39 PM, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from debugfs - dgfx_pcie_link_residencies
> to verify this.
> 
> v2:
>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>   - Read residency counter as unsigned long long int instead of
>     unsigned long int.
>   - Print residency counter before sleep also.
>   - Don't assert if sysfs not corresponding to aspm_link_state
>     is not present. (Badal)
>   - Run workload before validation of aspm link residency. (Anshuman)
> 
> v3:
>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>   - Move reading of residency to separate function. (Badal)
> 
> v4:
>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>   - Resolve compilation warnings about using variable as format string
>     to sscanf.
> 
> v5:
>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>     of igt_device_get_pci_usp().
> 
> v6:
>   - Refactor and enhance readability. (Badal)
>   - Move save and restore of link states to separate functions. (Badal)
> 
> v7:
>   - Skip aspm_link_residency on integrated platforms as it not supported.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 179 ++++++++++++++++++++++++++++++++++
>   1 file changed, 179 insertions(+)
>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index d33a87b13..04e560f9b
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs [] = {

Remove space before [

> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};

What will be the value of state here?

> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +85,10 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   	munmap(done, 4096);
>   }
>   
> +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	unsigned long *done;
> +
> +	igt_info("Running on %s:%d\n",
> +		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
> +	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(done != MAP_FAILED);
> +	memset(done, 0, 4096);
> +
> +	igt_fork(child, 1)
> +		exec_load(fd, hwe, done);
> +
> +	*done = 1;
> +	igt_waitchildren();
> +	munmap(done, 4096);
> +}

Can't we just run a spinner. Is this necessary?

> +
>   static void measure_power(struct igt_power *gpu, double *power)
>   {
>   	struct power_sample power_sample[2];
> @@ -370,6 +413,127 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
> +{
> +	int fd_debugfs_dir = 0;
> +	int ret = 0;
> +	char *ptr = NULL;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies" , buf, sizeof(buf));

Extra space
Keep the maximum length to 100 lines throught the file

> +	igt_assert_f(ret >= 0, "cannot read link residency file\n");
> +	ptr = strstr(buf, parse_str);
> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", parse_str);
> +	if (ptr != NULL) {

if you are asserting why check again?

> +		sprintf(path, "%s%%llu", parse_str);
> +		igt_debug("searching for-%s\n", parse_str);

Why do we need these debug messages ?

> +		sscanf(ptr + strlen(parse_str), "%lu", &residency);
> +		igt_info("Link residency %"PRIu64"\n", residency);
> +	}
> +	close(fd_debugfs_dir);
> +	return residency;
> +}
> +
> +static void save_and_disable_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {

Use existing sysfs functions

> +			igt_debug("%s not present to save\n", path);

unnecessary

> +			continue;
> +		}
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);

extra space

> +
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		igt_assert_lt(0, ret);
> +	}
> +}
> +
> +static void restore_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	/* Restore saved states of L1 sysfs entries. */
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_debug("%s not present to restore\n", path);
> +			continue;
> +		}
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);

extra space

> +		igt_assert_lt(0, ret);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);

extra space

> +	}
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)

use the enum

> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +	char path[256] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev != NULL, "Couldn't get pci device of upstream port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);

not necessary

> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);

use igt_device_get_pci_slot_name

> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	/* Check if ASPM sysfs is present. */
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);

Use igt_sysfs_has_attr

> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "couldn't read residency for %s", path);

Start with Caps

> +
> +	/* Save current state of all available link sysfs entries and disable all link states. */
> +	save_and_disable_link_states(fd_pci_usp);
> +
> +	/* Enable only the ASPM link state needed for test. */
> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +
> +	/* Read link state residencies before and after idle wait time. */
> +	residency_pre = get_link_state_residency(fd_xe, link_state_sysfs[aspm_link_state].parse_str);

Wrap at 100 lines

> +	igt_info("Waiting for link to enter idle....\n");
> +	sleep(5);
> +	residency_post = get_link_state_residency(fd_xe, link_state_sysfs[aspm_link_state].parse_str);

Wrap at 100 lines

Thanks
Riana

> +
> +	/* Restore saved link states. */
> +	restore_link_states(fd_pci_usp);
> +
> +	igt_restore_runtime_pm();
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +
> +	igt_assert_f(residency_post > residency_pre, "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n",
> +		     residency_pre, residency_post);
> +}
>   int igt_main()
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +608,21 @@ int igt_main()
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		igt_require(xe_has_vram(fd));
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +						      xe_engine_class_string(hwe->engine_class))
> +						do_exec(fd, hwe);
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>   	igt_fixture() {
>   		close(fd);
>   	}

