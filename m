Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C807ACCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 03:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBFC10E064;
	Tue, 28 Oct 2025 03:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgF1S30f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C088510E064
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 03:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761621576; x=1793157576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hFnHghpBQkKDfKLpPWTESnlKtqapoAexTrIhP8v6P1Y=;
 b=NgF1S30fgkfF7N4zXm/3QswjTV+fCiXLRlUqxwE3+cDZmqcvuR89vHjw
 Z2i9vQu6x3arIcv/s2eJya+dAIztOo9R//prvGcpvDtxiDwazTAfcUQNv
 saL09oW1J7lywV25oqO38X5VeCc70eyEjjCnWKBkhg/QfnBIK0K1Qgb8r
 4k0K5fZhME0hCnZ6cA1kv+2TTmWeh0MbP8+ParKxzmkIyhOMUdMWxsE9b
 f+9x5UdxoalJrs/NyVnB63GfeX1A0W/rOgrbMfBV2p7vGt+eXZyD8gH0b
 1sLzj/9SrEWjHPiyuQ62S1uMlJFBHJzff4/HQcgunaCCSAjX5no5GTJ4t Q==;
X-CSE-ConnectionGUID: itryWtrkSO2hxY5Tx19wNQ==
X-CSE-MsgGUID: w9kPkwepRI+5vckkKtOWkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67549203"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67549203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:19:35 -0700
X-CSE-ConnectionGUID: l7Y6O9xtQga3CuQaL8x6yg==
X-CSE-MsgGUID: TliBO8oBR3+hJMdKjWcEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="185126255"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:19:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 20:19:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 20:19:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 20:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ycg/mRhO75Xi6MUjiD1Qa+bYZKoVElEqOZgI2EanPCVYjMFvN5HozZnwFd3Ay2h6ao+wv7OXM6+4nO1V9MLYcijTLR7JSAClk3IqsY8CTnisH0v2OB8rmF1h8D77E6DOH4z2GsQnxlN3E7A3pE+MUmS8e9j09/CSknxM48ddd8vW9x+M/UqkwERS/V9vA97CjaanrtT2L2w3SB8/4kY4LoQ/3oEZ/FqNLvIbR6pZwQsvl6MNO823nex5aXBD58Mjqm6AqzP6IRebVQFM3wuKZD6zv3+oIC5JrvqKUA6U6xPR1hagGARG35d80tW2J+QFDwABmPRkZcdJ7vNtTaHoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRdIvv/TcPz2sIrwVadKzQBNmzLTpzsdDeX/i38w+rA=;
 b=j1y2PKt34yQQiM/lcWiwik1dyxr6LQac45Qchay2xllJzOztMtuHH0VmLSZc3YA2DcTZQ95QYJD2UsB7edZ3WvTd3vRKy3FeUk/nzL06Icv2SP4r9K+p/jvcR6k1RH8WxnOWO+yV1hcUPip9Ku9EuLC8kHJI39ddukYs09Oq3WB3XmAbl6Zs9AC3PXJ6Mo0v1AjC/6WaOmITaNxelvNfb4DOjcir0YIFnzsQwzh8G/TVbiG+JcY7A94gEpDTuqcG0oCfzXJrpUciNcZ+5nzH8hKD9rWCty016Jmc5N+0tzhdBiNtj5KiY859vVzOYba6KsTNM+xWHq4Vm0EAvOcOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 03:19:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 03:19:31 +0000
Message-ID: <57422a6b-3157-492b-adf8-d727bc36b1b5@intel.com>
Date: Tue, 28 Oct 2025 08:49:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update LNL/PTL display blocklists
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>
References: <20251027150312.2209085-1-karthik.b.s@intel.com>
 <ebcfaed0-b991-4272-bcb6-25e05cbfa166@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <ebcfaed0-b991-4272-bcb6-25e05cbfa166@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: f6262e47-9ca8-4042-06e9-08de15d0cf20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDRlN3c1QWVyaEVrZENGeDBFSHBaZHJrTkFYSEdKTkZuT0VSL0hYc3JjaThS?=
 =?utf-8?B?L0tGb090VU5MdGsySWtNVWE4TWxzU2Z4RDlScmg5RUxBemJtWElxZGpGRVlC?=
 =?utf-8?B?WThPeUcrSjRQTlZxNXZRS0VFQ0IrU1ZPMFk4ZXg4WXNoZ2xTSVNiV0pYVDVy?=
 =?utf-8?B?NGZDN1UvRWt2OE1rVkx5NXkwSXNmN0ZTZEQrWkF0QVNQZlYrN3hQdUlzNFlX?=
 =?utf-8?B?Q0xxeXdML2psYTVqQjVYbzJxeW5BMTdjekxwNGtBVkc0dCt4czdaOFM0anN4?=
 =?utf-8?B?VjJLVkI1THhwM1EyZzQyVXFQZkdweDRYRFJISHE5RVFjbTVaQ2Q2eWZicjNQ?=
 =?utf-8?B?QjEvNTYxK21meThZWjZYTURocUJPaGRpTmVadmJKS2NpTm5tODk4bUd1eDBG?=
 =?utf-8?B?OGo2WkcwU1Vsb1M5dXBaUmZYWGYvdXhIWEl6UGNkamNUcUFOR0RDcXhBOGhS?=
 =?utf-8?B?R29rRzNXeDN1cHlQVXpzRXFvUER5UjQ2eXJTVXFUeWV0ay9SUkZsTHJlTjVq?=
 =?utf-8?B?dWdGY1Fsd3Y5NlNYbXZQeS9kVVVtNjVSemlIeGRaN2dVYXk4WlVWU242YnBS?=
 =?utf-8?B?eFNrTlZ5d2toZEZpdC9BdVRzOWZXYzZaeUhxK2ZHTkVrczdiMUJ0elROZlNG?=
 =?utf-8?B?eUphamFkR0l6QjVySlQxcGo5M0M0QmFjVmw3UzhOL2VxaVAvVTRPMWxZUHEx?=
 =?utf-8?B?dGlDaE11Z3NrUmNNMzNEM2RrdHM5SlFIYU5GWmFjWkpmdTVTeDRxMFhyTVQ3?=
 =?utf-8?B?cXlyMVQ3V3RjRGZlbGVqQ05GMERRVFF1cysxTTBzelY4VnhPeE8xcGJyNnNK?=
 =?utf-8?B?YWtlT3lhNnRtVm5qaWdzRHIyZ050bGM5NHRPTWpHMWlCSmNuandMTy9VOTJJ?=
 =?utf-8?B?d3Z4WjFONk9KeUJmeEdFdHIvQWFrNXpIcTk5UW5EVHo4SVdrNnRJN2pWaTlY?=
 =?utf-8?B?dGtZSm41ODNoN1JYU0VLcUpweWp2elFDdzk2dUVxZ2dTZE43ZWJKTEM1NzBU?=
 =?utf-8?B?b1FlSDBmSytJNDR2b0ZYblY2VitqbmxYMStvWWNaK1BjbEw2R1JObGxBTkty?=
 =?utf-8?B?Rk43eVJTeXlwSUU3TG5BYVU5RFZiWG03UGRJSXg3eWplbXRmRjl4dDdyRHZL?=
 =?utf-8?B?a1QvbGE4WnVaNGhiTHFaMnRkNGxMbFk0N2U4ZTY2T3hCcmF4ZFVXcEJJcS82?=
 =?utf-8?B?RUJWWjNyNCtLRENGNWNXQW9aRHJXc3NLTzhhQWFTQkRSejc3andYcFk1WXJj?=
 =?utf-8?B?QXhScWc1TWkrc0p0VTkra3RQSVAyTy9IUElyQTF1S2ZFTjUrWXcrNWRia0lx?=
 =?utf-8?B?V09rWlhOSitDeEFPbUlLVVErdy8xTFNKdmg2Q3F0QkY4YjJMM3lBUVU0cEtj?=
 =?utf-8?B?NXJ4T1Q1Q3A4enlheTU0OVEwYUtUczVhTFpUa0ZDZFlDT0p5cUFlZXczV3pz?=
 =?utf-8?B?VG94YjVIWHlZZHAvMFhteTRacEVtRVNQYWk2SEoxbnplQmFRRzFoTkFGdmlx?=
 =?utf-8?B?ZDhXTG94aTQ0NkZGaDJFN3hWU1JibEQyYUtvRkEvdDZRSWY1SWVsSVBmMlZ5?=
 =?utf-8?B?dDc5WmVsK1dOTEErQWIvano3WEJJbFZ2ZzI2cFdNYzFyckJzQnBScXl5UjdU?=
 =?utf-8?B?R2daTitOcFkwYWJMSVdyMnUvN0s1Z1N0a09qcVZRN1BiWTlFV2t2VXpaS2Mw?=
 =?utf-8?B?Z01IbU92a01KcU9WREc2Y285VDlBVHhIQTNVZEIvWjBUd0RDaUROekkxdHE1?=
 =?utf-8?B?VVVuZldyQVVEdDZHL3BEMEhSeG5oaTQya3BhazYyT3N1WVhZN3F4YmF5WjFv?=
 =?utf-8?B?eHB5WEJmWkNLWi9LcmtVcGd2NG9sQlZWRkNNVS9XK3dURWltcUczMEZXcEN0?=
 =?utf-8?B?bWJGRDZiRnRGbWlNVE5iUjZNN0NEYUZlNmZlUDRIVWJEV2traWIvN00vb3BV?=
 =?utf-8?Q?RwCKRBURlKVDLjmRc4mK+sjUmwZ5Tkmg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdnd2NaRERtOVBIY0tZVkNSM3JjMVMwMXR0VDdlQkJvalpteUd5RjVsdWIv?=
 =?utf-8?B?Vk53YnkzQnZTYzZKMkFyQmRzV0hKanp0eGpkUHpQZk4vS0V1MjFkS0g4WEdK?=
 =?utf-8?B?NzhwTXJiYU9pMmhkUmU5SlFiSWVpTnlHYVpsZmJXWFo0aU1pcTA1dlArVXc5?=
 =?utf-8?B?cGt4bDVqUUdQa2ordHAxWktBS05lT0hzZ0RrWXhPMzE3dDVLZ2JGSTd4bzJr?=
 =?utf-8?B?SFRSWFJrbWt5N25YeDd1dFArT2Q5VVgzNFhBOUlLbXI2MGl1SW5VTTlFYmkr?=
 =?utf-8?B?QmJ1NmprMmRzeHpmRTdCRk1DcjZveW5uV0l6NFJMQXY3bEpSTVZndjFzTDVP?=
 =?utf-8?B?Z1RqSGliZHZqN09GS0JtUlRHRisyK3djY29oL2VZK1JWaDBMN2N6TmdOQm40?=
 =?utf-8?B?VHV3WUlsUGFoenYrSFZueTM0OXMzT2tEOUxaTWFLK0Z4NjN4S3UzNTBHM3dr?=
 =?utf-8?B?bm9kdmNpNm9tVXVyOGdScXVGRVM1TjlLUXNod3VTWXdGT1dpNDR6QTdjME1T?=
 =?utf-8?B?V25Wb1MxbFhMMVIrYWhPK3Z2LzVZYzdGOVVoRVFqYXk0aFEvMi9nYk1LY0VN?=
 =?utf-8?B?OUFianM1bXkxb00venZ6aVIvSmsxTExJRDFSa3VHb2htWTZZeW1SWlBzOVZO?=
 =?utf-8?B?MVpsc0J1SWVCaFNoRXhhMGJXekZvMzEwcnVVaU9YdWNJWUlTMi9lTXdzV04r?=
 =?utf-8?B?OWY3TFc5bVk3dGYzM1J2MmJyWTgyZWV4K3EwYVlqdEhmT2tXdkVlSlFLajl4?=
 =?utf-8?B?QVpENkpqV2FvdytabU05L2VnL2R3UEJ4NHZUMWVTb1JJdmVvTU1IQ0FXUkF2?=
 =?utf-8?B?M0g5NmE2ZDAxVytPL2tmVEhldnFTTFd6TkpNRjFlOXZpTWZjRU80N3A5ckQr?=
 =?utf-8?B?aWt5NlpoWWRrWHlmVXJxVXhqMUhyNjFZcW5IWi9haEJCaTNPU3E2c3dFYnZl?=
 =?utf-8?B?L2JSTFBJajFkaVVjSTJUWnA0TDE3cVhtQlJ0c3dWcnpNV2IrTC85UFYrZWF2?=
 =?utf-8?B?eERmdmUxeUp6K3dIamlLNmFKakRDYWM5RERkWFpMRkc3TnNwUnlnWTIvL005?=
 =?utf-8?B?RTlzVTAveEY3bjdDell6ZkJSelhDbldDRnIvZjhSbXphMzBqSFAvSkpEYmNF?=
 =?utf-8?B?OWRRU0NZOWpPL3Bxc09KTFlrRzEzUXA4NHFQdWVhUGJkTlRmeG9VZjA3cXRu?=
 =?utf-8?B?dzV2OXVPd1RqYWxEbTdYVHFsZlZoOElpWGoxOENKZUFobEZtWElCSEluTXBn?=
 =?utf-8?B?K3d4bFBPcG01djNURXR5em1WSXBGREQrcEdSRlNkaldvd3oxWk9xU2ZaQWxy?=
 =?utf-8?B?TWNWL0tQU3JXL2hMeDZ4bWZnUjlkVVA4enB1VWVZNVJmbjAxcEQwZXhnQisx?=
 =?utf-8?B?aEdaZ3FwMkxHbXRjaVg2K3l0MWVTN3gzSTFaMk04SkZMS05TOEZuak1tOUZl?=
 =?utf-8?B?U3BXSkxSYWFGdjNmcmhLcEZ2Tm9XQklPNFNNK1BDZmx5YkhwVis5ZlgrN2xI?=
 =?utf-8?B?RTEwY2NsT2d0MjM5Y2RHTDVYMmxXbk4yL1ZTY1pNR1hTWVcxZ2IvWmF1N21h?=
 =?utf-8?B?TFBTd0xXaWZ2TUpwOVJuRWIyOVZScUtwRlFiVnhXVDRha2ZORkY1dU5tZGR2?=
 =?utf-8?B?akhqU29WalBxcWpmS3JoWkovZ1hoTjBaUU5LNXFGSWtIL0RLL0RsWkdsZnQx?=
 =?utf-8?B?ZWxDWWkyL2o4bU80M2ptOGp0NWdJYmcxNThLcnhkK3VrOVdTajZVS09ZZWFt?=
 =?utf-8?B?Y09BMzR5Y214cWZpSTR4Uk9Ea3dkNG9GMmU1TXZRMENXc1pOZU51akZ3RUlt?=
 =?utf-8?B?cU5EUjFCczZUc3dNMkc3K2VWRVZGa3QvZkxkc3d2RnRWYUpISTdKc09FSGxP?=
 =?utf-8?B?YWNad1R2a2NBdksyVzdZN1p1RlEvZEg1R3E1NUhSdFpnWHRQVlNwdjdBUEQr?=
 =?utf-8?B?dWtCMlJsZHpvN29JbDFrb0VscTl5UjFDcWRQTXV5Q0gybS9CZjJQQ1VuNDNp?=
 =?utf-8?B?c25QZVhDbHRDVHBDTVdRekFvcGVFdGUra1IxWEFFVnVtd1A3YTVRQjd5Smx4?=
 =?utf-8?B?bXdEeE11QkdMSUtQODNCRkJqMUM3QmJCYy8ydDZaZktkdzFEMThQc1ltM08x?=
 =?utf-8?Q?u27zcoGzhPTBcHi/V6WvQvikR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6262e47-9ca8-4042-06e9-08de15d0cf20
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 03:19:31.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka4hd4VQJ9ZEpki4X0q7XsZ0K3573Iho53Z8zLqIhPjdWSMKnO5IkuYtbGV7zWHJM0tax6TSqfLH/Vkgt7QBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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


On 10/27/2025 8:39 PM, Sharma, Swati2 wrote:
>
>
> On 27-10-2025 08:33 pm, Karthik B S wrote:
>> Remove fbdev tests from display blocklist.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>
> Patch LGTM
>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Thanks Swati for the RB. Pushed this patch although i915 full results 
aren't there yet, as this is only a blocklist change

Regards,
Karthik.B.S
>
>> ---
>>   tests/intel-ci/xe.lnl.display.blocklist.txt | 3 +--
>>   tests/intel-ci/xe.ptl.display.blocklist.txt | 2 +-
>>   2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt 
>> b/tests/intel-ci/xe.lnl.display.blocklist.txt
>> index edde67d75..fd2065659 100644
>> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
>> @@ -1,8 +1,7 @@
>>   #########################################
>>   # non-KMS tests
>>   #########################################
>> -igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
>> -
>> +igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
>>   #########################################
>>   # Valid skip :- Y and Yf-Tiling are not supported
>>   #########################################
>> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt 
>> b/tests/intel-ci/xe.ptl.display.blocklist.txt
>> index 12219f89a..4c3803235 100644
>> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
>> @@ -1,7 +1,7 @@
>> ##############################################################################
>>   # non-KMS tests
>> ##############################################################################
>> -igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
>> +igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
>> ##############################################################################
>>   # Valid skip :- HDMI not enabled in VBT
>> ##############################################################################
>
