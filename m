Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4107BC28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 04:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1D10E65A;
	Wed, 26 Mar 2025 04:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFlgJrst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D309D10E010
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742964437; x=1774500437;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=5E61Vg4NjF4PXZurNYJv3ZSm4Ii1yfrs6HRk5e7LpI4=;
 b=HFlgJrstBcauWtX/2jxvWBUjq++lWI7k8BD5Aonbt33wXnFDn2SoHexk
 1+xMwD6wvN+4lAiFZOxtzPkjOzLixrSmqyi0ilAm/ZZlJdfhS3ozCp3ic
 MoU32FBRPnNSzNjjO+ng9dj4pVNFNA0SzIgUWSfWbaTcBlXVK9J6KV4Ms
 mvLYgEficWBxnt2yJZjJk/Q/IH63IPqhrfTnzuadu0eMaAXiCzCufGBi7
 0eedGkpGZODLo+NJ4Zn76JzFVgww/2mokVuWYhtUUEHzBpWoPZVuOWZye
 stmNg89+ILYhZex4xDzreZXpJb9A13RiA37VlDLsMeEhZUbI4zRnIGgm/ w==;
X-CSE-ConnectionGUID: l6qwy52NSQu82egaif3D0w==
X-CSE-MsgGUID: sM/HZ/f+TACdN0/1b65laA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43965907"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208,217";a="43965907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:47:16 -0700
X-CSE-ConnectionGUID: RNmnwz3VTCmwz286CdDrNw==
X-CSE-MsgGUID: DeN6hHkISjqPGtyJZuds9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
 d="scan'208,217";a="124572831"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:47:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 21:47:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:47:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8Sh4vIFCgpzp3YVMcqBsWtUXkcvQp8oR/1vBCCPu5FYDuV0oK2bMJ4uIy63HEblAgW7NWEy0GfGqZV40sLfuTsDlOwkRJLz8T0rCLFGVsGWZ2AY3Qa1I67XwWzOgIPx0kEzzU7eljwf4lTrom63h5Xl8gfcKz8/mq5FLU5XzUCjwm9jugMaMAevrv4FfBPHaY45/EWwAvY5dE/YOPcKvEPmc2pncLctza8ZbuPBE0TpK3c32RlC2FvN/eZd47zdaSm/u7bGEnrl5Z0hitXRb2WRlHvJoyxTalj2xdNo8rmP+cSFP7j+AWsXUK0yg2qS4iVQ1t5WwwVj5f3Nhdy79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r13oGABt9z1AR+tu2r+0tCZUMWwpy0uULzq096tncDA=;
 b=aWifBBm92Q9Jd0muIsjeIOytCtqtdP0NKiu2uBcHThf2oJmo/Gy/rcGhRKxEM4LycSYM/iBhZwZVp0jfOdWbdqJP2HSxYKjTYS/Odma8UWGc5nb8MsPGO9WRB9fkEHUKraJ5M8pjYeqohOHh7E/TTM4WcKhKLHvjWxx/pTGOyEWI2bcvu6QjrX/8qxeH01U83skVML/Vnl4MpwSccPcDptRA0eZL4n9gW57Kiei2VBhWOlgb70/i8Zasl6wN61x6myIozW7KX+ineQ/Qb2WvRqeb9nDWu0olIimvpW5wvmBzckLw2WbQTqXqAuoOI+vdDJeLdxcYX9VklL/MpQKjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 04:47:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 04:47:12 +0000
Content-Type: multipart/alternative;
 boundary="------------BjUSBmW68RqgIM8vRGfC0OmE"
Message-ID: <30b1f87a-c22f-40e6-addd-8fcfc842e207@intel.com>
Date: Wed, 26 Mar 2025 10:17:07 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9r?=
 =?UTF-8?Q?ms=3A_Use_get=5Fmax=5Fpipe=5Fhdisplay_in_joiner=5Fpossible_fucnti?=
 =?UTF-8?Q?ons?=
To: <igt-dev@lists.freedesktop.org>
References: <20250319061244.769947-1-karthik.b.s@intel.com>
 <174237078457.52729.5191632418246132499@18a75f3d1eae>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <174237078457.52729.5191632418246132499@18a75f3d1eae>
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 7053f6a7-4494-42f8-5e23-08dd6c214626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnpUMWI5dzZKSytxOWNncDRQemVmYjg4ZENmSWNpbjYwdFh4dmd0Zm90eXVO?=
 =?utf-8?B?Y0NhWGhaVzF2Nk9MVUFJaE1sK1Z0dkk4ZjAwVk9kOEs0RlpGdWw3dWhhRkt1?=
 =?utf-8?B?TDREMXUrK1kzMkt6LzluRzdMYXY0ZHRkcjA1OWJBNWt4cHVaRE5VVnNKdm1Z?=
 =?utf-8?B?OEZsT2xFSmFreUIxbzdNVFRMUXk0ZlpwR3RhaHovb0dGMnU0d091U0c2MFZS?=
 =?utf-8?B?elI0QVA5bk5kMGtNbTBzQVhKaitrZmhJZXE0dlVZKzc0TlhnV01FU2RXeFZs?=
 =?utf-8?B?L2FGak85ZThwbVYxWnNqNlZiM1FuRmNhS3UwRUhjcHhCNXJkSVpLTkNIQ0FX?=
 =?utf-8?B?UitBQUZNekhQV3BIcWZJT0o4Q2ZLNnBhRjUvRVVmZnpzRGswNTNwOTZzT1cz?=
 =?utf-8?B?THRRODN6TURvOXVRM1dVZC8zN3ppR0Z5WmdMZDNOYkgxUmZTK0MyTXM0OGMx?=
 =?utf-8?B?VGNnMXcxcmsyYm9IZXhCZ21IS1gzN1hrWHg1T2lZN1lka21PaHp2cjJnM2p5?=
 =?utf-8?B?T0Vsbk5rZHdESE9oSDBtaUJldGo1WWM1dG9HWHNSYUJLN2lkU2wra2JhNDNs?=
 =?utf-8?B?am5SUDBxY0pzcVdicndURjBlNjh6SnlwK2xabWw4R2psSGFYemlQcDNuZnNo?=
 =?utf-8?B?bnEybEVRemVYM3RwbmYvWlJLdnYzV1BIb2h3TDhEbldJL0dCV2lxamN5cXox?=
 =?utf-8?B?cE42SndhR0VsV2xTWThkTnZ0elBNMW1Yd0RJbVYzbGx6NmNmNEN2Qi90cDc1?=
 =?utf-8?B?ejZQVEw2UWMvTVpSdm92S1VTdVdsYm5BbFpsOXhkZlhlSUNVSW93VVRTQ2hM?=
 =?utf-8?B?RmNZQURCNDVsM1hGU2tZNERMUzNQUld5dmFicWRSRHVodWNtaEkrY2ZlOEs4?=
 =?utf-8?B?dzBNd3Fpdy9ZRlV1dlkydTFPOFlka3RicWJNemVucVpWcXB4dUw0Sk42MUdT?=
 =?utf-8?B?a0hqRVhFcC9lcGFxbm9tOXIwdjdLM0wzSmk2eFhkOHRrTkVVNSs2M2pKK0Zv?=
 =?utf-8?B?aHBDaVF2WExBTnhmT01KQjNsYUdKekFqNHpvT1hpTit2VTEyRnRVQW5IdmRN?=
 =?utf-8?B?QkUrZkVQVklNdlJPQzJHR0RPb3hYMHducEVnT3Z1RThnc3JhMjMrZFNvYlhr?=
 =?utf-8?B?MUJENjdGNk5hMjVtei9XZTZVai96QnNTbWFPWDJwcGN0UWtqakdaVUNHVzQw?=
 =?utf-8?B?aHJEaEJkMGF3aGdiTWZTaytCc1pGNklTWnJscTZtUzhNT3NzU0ZrNEpCVit0?=
 =?utf-8?B?a1Jub0Z2NHFYQXlTUHNmaG5xdGFiaDM4NmxPWUowdnRLclNYZkNUVlNZZW9L?=
 =?utf-8?B?ZmVxZVFVZUZ6R3MrZlQ1WFRHK0h4UnJreENXK0xsT1dLaVJQeEpsUmR2QkFC?=
 =?utf-8?B?TEZ1SkVrM3F2TVhHNHdZWmFWTUQvUE51US9IRGZwOWJpeXM2aFlQMmxDYnF2?=
 =?utf-8?B?QitBSjBZSFdxTno0U2w2cFFhaXBDV3JnT2dmUFAvVE9rU2FmNTNOR0RGK3cw?=
 =?utf-8?B?ZGNBODVtSlRnazRwc3UyMlhRS2VwRVdWQnlNd3hiTXBrWGxPbUdPblBCSERC?=
 =?utf-8?B?Z2pPcmtkU3lZME9GY2k5SloyWVdYTzErUDR5RVB3aGhDd1JLeWlsTGl4VzFR?=
 =?utf-8?B?OENMZjBrSGd5OWtpVWtJYzVtbWZyK2ZrbW1KTzZkVy91TFJlZEhEQTVpdFY0?=
 =?utf-8?B?dXEzeXZGNm82blkzUDJxTmx0Y2kxaTJDeWNxTy83djNLNlAvcTYrTWJZanU1?=
 =?utf-8?B?MmlZcFprcjAxZEN5eDlOVlhlZGJ2TjlhRzBRN1k0aW1laDdFSUVtWThVRXB2?=
 =?utf-8?B?UEVHYXZMdHpnUHZTNGNSdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlJtU2xlWStLU0tCbXhpU25KVDl6V1VFc2dZWjZvekdqcUUwcEQvNHV5QXIv?=
 =?utf-8?B?UDF0dEkyQnBEalFhUmo0eUhTOWxLVXJ4U2MxbjR0eGtxRFNpd24xc28yMTdr?=
 =?utf-8?B?SWVaZk45aEhFbHFtOG1QY29JZ2ZVSXB5VzNubDhVRzlaSzR0UGcvdXdXSUF5?=
 =?utf-8?B?RnJDbVZGQlhjTDg2Q09DaHlwRUtYKzNSS2VuRVU5aXVFWjdGRzZ0VUdJUEdO?=
 =?utf-8?B?cCtLQmZUVEdqSFJjdW1XdmM5SmhZYWdIb0pIWDkrYkpTank5SXBYcnpRSGdZ?=
 =?utf-8?B?Ni9JbHIzOFZjSU51TEFabTRwLzdqMVFIajcybi9TRHc0WERIaHBqOC9vLzJQ?=
 =?utf-8?B?a3NveEdxKy9yNDAzQXZiK3ZkeWVrN2oyTWllTWlTV3AyUTd1czYwZmpYeENr?=
 =?utf-8?B?WFpPZWNiNjZlYk5NblNzRzlBVmFNcUs5WHFkTGJCekpMUU9oY3JyOHo1eUhk?=
 =?utf-8?B?WEpIMVhSbUFpc0hmcXFGZCt1d1krQzlFSTlRUyt5bkVWZ3ByMUNvWGFIN215?=
 =?utf-8?B?WEVTMFFXdzh3enVmRVdUWjB2a3diM1VCZW5makZFOVpNTVM0aWhHZzlNaGJk?=
 =?utf-8?B?WlB0dWc4dUY1MytTNHFxTktmaU8wdUVyYi8wbGo5TEg4eW5jL3F1RE9Mb2Jz?=
 =?utf-8?B?bnBmOUdmNm1Db1Q1VWdDWEtPRDBjTExmYThjL3NSc2I5ZUU1eUgvR2hjVnRH?=
 =?utf-8?B?RHEzc2VVMVFMU0YwcUI2cG85ZmtGci9GOGc3QjRIamczcGNtVkYvWXFidDdY?=
 =?utf-8?B?OGhON0R0RDl0TWwzS3ZhMU1RTUhRa21HdXlvSVhFdkZtVzBhNlV5cmtPMDZP?=
 =?utf-8?B?UzhNbEJ3UmRucnJCY0ozSjhucStnM0Q2L0pKdVVBK0J6cXdVd0ZHb0Zsa1pm?=
 =?utf-8?B?UFcrV0VaTFFNb202U0tZbFZiNWlMS05UUGNlNklSbU5WZ2VxcURnSHdWaGJ4?=
 =?utf-8?B?VWJkSGl0UGxweS9oTlcwNFYrKzJxWExia3hEUlk0cXByUVZRL2E4ZGd3MFBF?=
 =?utf-8?B?ci8rOG55TTZyWXhTM0YrWXZwcjVScm1jOHRid0U0cmRJbHZmVjJ1bTVaTDlT?=
 =?utf-8?B?WFZVbFVtU2xvOFJMcHQ2UXNiVWlQTXBrd2ZUNlhobHFoWGgvTzdxdXM1c3Ri?=
 =?utf-8?B?TGNEd3o3cXphSVJ0T1BVL2ExaUJ0SHNlYU52REw4RVN6a1pqYmhpK254QmJ5?=
 =?utf-8?B?MGVSd1ZLVWlsdjlkeEtBTDIyOGtINFJyV0Uya2k3a3ZPVVl1aUplMDBHa1Bm?=
 =?utf-8?B?eTJrTndLWWdsRkpYdEdQV081eEFRNjNuWS9aYWFyaEY5NjlkNmttUk5SdFIw?=
 =?utf-8?B?bFJiTXJabGdIQjhrNExzWTVyNHBTYktQa294WUR0amxxUGhobWQyVGt5amNQ?=
 =?utf-8?B?d0JnZnJOQ09yMXVIL3Z6V2tTcTYweUE5UUNpais1R2l4TTNDUHBDd3RSNVpu?=
 =?utf-8?B?R2R2bFRKdDUvSnA1RXZ0Y1FTWlZEWktRd0FNaG15RVRWZlU2Z2lvMlFLa1FB?=
 =?utf-8?B?ZVZtQVUwSSs4Wjk1aGtoTStkLzliRVg2R1pURHIvR2lVeXJhS2ZrbE1LNEJB?=
 =?utf-8?B?Tlc0eGtGZnpjYUdMaGlVUUNoRVEvZE1WMXR6ZldOanJDMkV4ZGdWYUdKYjlB?=
 =?utf-8?B?dC96cFFVbGo5YkhTZFZhdTQ2RCtUUDd2dldNRTZVbm4rYXFZQnRaZGZBSjMz?=
 =?utf-8?B?TTZkbVNRMTZGL0o2N1pyYzREbVAyQWFaQTJvdHk4dGR2MXRVNURiNW82OEx5?=
 =?utf-8?B?WVQ2dHdES3pYYjY2NGxPbHdHMDRha2FxejlPZExkaDRsMENXY2RsSkwvWGVp?=
 =?utf-8?B?WmM1a2N3WTJjZ0lRZHJQUHJiNC9Cd2dzYTFwRS9ZQ3M3dkxHbFNKQVNpRENt?=
 =?utf-8?B?eHNQOUFmTll1eGVzbFZuclY3UzI3T3B4bUhjdktWL0wxRWl0VDAwRlJPNmgv?=
 =?utf-8?B?Q0F2MGhNNlVCYW4za1lHak1yUkRqSXhxazBlVzl4eEQzbmxyQk5LaW9jQXB6?=
 =?utf-8?B?VlpKWnNaMW9tSllGQ3plYjg0aEpGVTZRK1NGQU1TK1k3VkRaN3A4VEFMVUpo?=
 =?utf-8?B?S1JHa3kzcEtYTjlIVklxTzhLamx3RDJlTmJTVXFzR3VibDNzVk5yUzJuenFq?=
 =?utf-8?B?L1B0Yjh6UG52dW84MDA3bW5GOFB3bWwydXRvaC9DT09ZV3RDbHV5Z05aNHdt?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7053f6a7-4494-42f8-5e23-08dd6c214626
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:47:12.7708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3mdbExrFYj/xJGZm2pHKe2xkvnuKTYnILDs3xrVQbzwgUo6a3kEsvimPxlxXV34ec406E+wMANrmpIK6Co7eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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

--------------BjUSBmW68RqgIM8vRGfC0OmE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are unrelated to the patch as the changes in this patch 
only affects kms_joiner tests. Also, the targeted tests aren't currently 
covered on any premerge configs, so not going for a rereport to trigger 
the shards tests. We do have results from xe.ci.full and failures there 
are unrelated as well.

Will go ahead and merge this patch.

Thanks,
Karthik.B.S


On 3/19/2025 1:23 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/igt_kms: Use get_max_pipe_hdisplay in joiner_possible 
> fucntions
> *URL:* 	https://patchwork.freedesktop.org/series/146474/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/index.html
>
>
>   CI Bug Log - changes from IGT_8276 -> IGTPW_12798
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_12798 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12798, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/index.html
>
>
>     Participating hosts (43 -> 42)
>
> Additional (2): fi-kbl-7567u fi-pnv-d510
> Missing (3): bat-mtlp-8 bat-atsm-1 fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_12798:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o bat-dg1-7: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-dg1-7/igt@i915_selftest@live@workarounds.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-dg1-7/igt@i915_selftest@live@workarounds.html>
>         +1 other test abort
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o bat-arls-5: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-arls-5/igt@kms_hdmi_inject@inject-audio.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-arls-5/igt@kms_hdmi_inject@inject-audio.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_12798 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@dmabuf@all-tests:
>
>       o fi-pnv-d510: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-pnv-d510/igt@dmabuf@all-tests.html>
>         (i915#12904
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904>)
>         +1 other test incomplete
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o bat-arlh-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-arlh-2/igt@i915_selftest@live@workarounds.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-arlh-2/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>       o bat-mtlp-9: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html>
>         +11 other tests skip
>  *
>
>     igt@kms_psr@psr-primary-mmap-gtt:
>
>       o fi-pnv-d510: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html>
>         +33 other tests skip
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8276 -> IGTPW_12798
>
> CI-20190529: 20190529
> CI_DRM_16293: a958e31a81b3267201c85b6f171419586afa792c @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_12798: 12798
> IGT_8276: 8276
>
--------------BjUSBmW68RqgIM8vRGfC0OmE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are unrelated to the patch as the changes in this
      patch only affects kms_joiner tests. Also, the targeted tests
      aren't currently covered on any premerge configs, so not going for
      a rereport to trigger the shards tests. We do have results from
      xe.ci.full and failures there are unrelated as well.</p>
    <p>Will go ahead and merge this patch.</p>
    Thanks,<br>
    Karthik.B.S
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/19/2025 1:23 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174237078457.52729.5191632418246132499@18a75f3d1eae">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/igt_kms: Use get_max_pipe_hdisplay in
              joiner_possible fucntions</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/146474/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/146474/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8276 -&gt; IGTPW_12798</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_12798 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_12798, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/index.html</a></p>
      <h2>Participating hosts (43 -&gt; 42)</h2>
      <p>Additional (2): fi-kbl-7567u fi-pnv-d510 <br>
        Missing (3): bat-mtlp-8 bat-atsm-1 fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_12798:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>bat-dg1-7: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-dg1-7/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-dg1-7/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>bat-arls-5: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-arls-5/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-arls-5/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_12798 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@dmabuf@all-tests:</p>
          <ul>
            <li>fi-pnv-d510: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-pnv-d510/igt@dmabuf@all-tests.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904" moz-do-not-send="true">i915#12904</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>fi-kbl-7567u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190" moz-do-not-send="true">i915#2190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>fi-kbl-7567u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>bat-arlh-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-arlh-2/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-arlh-2/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) +1 other test
              dmesg-fail</li>
            <li>bat-mtlp-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/bat-mtlp-9/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/bat-mtlp-9/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>fi-kbl-7567u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-mmap-gtt:</p>
          <ul>
            <li>fi-pnv-d510: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12798/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +33 other tests skip</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8276 -&gt; IGTPW_12798</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_16293: a958e31a81b3267201c85b6f171419586afa792c @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_12798: 12798<br>
        IGT_8276: 8276</p>
    </blockquote>
  </body>
</html>

--------------BjUSBmW68RqgIM8vRGfC0OmE--
