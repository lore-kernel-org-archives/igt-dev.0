Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAEFC61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 05:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2166210E1AA;
	Fri, 13 Jun 2025 05:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGn6qIsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56AC10E1CC
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 05:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749792577; x=1781328577;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=AtPHxINBZbm2yUYCbv9WOGspDNhxftZs1+LO4c1hdvc=;
 b=AGn6qIsHdw3/JBqLAB68cYNNXgblRkVWZ6reAx0dDGLPb7zSVMuCWjy0
 pcGkrFOuGHkgY7wKMFr4vk3ybAs/PJxaAXt7qBOkOclvRHBEWrQyAxX4y
 RIdCfpOhJ0cjTjEiHraCXinCYgfVEVFf2U20OmHMoMJzvuiQjY9TJ5V1R
 nwr8Xql50P2rmC43gkdA34juZBW3dgoOv8Du4au2lyaR0O8yxcfOGdLp6
 N0x/qeG7w0/TdHu9iz2nYcTJw1VyzNlgzij1U4j+Mrdxv5pgpL9y/DvxI
 7qtJhatyMrRGCCltB+uMXB/WvlHnqzwqicetEItfgYNtHBtwYy5b/4yTU g==;
X-CSE-ConnectionGUID: iHy3G+A8SjOmy/kYobPrwg==
X-CSE-MsgGUID: NxgnLTMwQJK9+nQJE/1wFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62606116"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208,217";a="62606116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:29:37 -0700
X-CSE-ConnectionGUID: TL25NuCCTKq5ipGGKaX+CA==
X-CSE-MsgGUID: PqHDUWuuSxCj9uxNOS/FXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
 d="scan'208,217";a="152886213"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:29:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:29:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 22:29:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFE2ea5JR5CzQb7xUTUDeDmSxhJ9Gbe9Bqi1uEcJ9wb5oAcRhb+LT7LlF+K0up4BYjBYgdvCOv43qblJ4aZixGlZtFg1C2QW5sAqq1umxU2w09RHhdN4gu2VZv02scVf4gjs7NLxMIaqiQM5/bpFsLMsnoneccAMy9P8e8oSMUfJcEonyoEnyKP5UCba6SkDYJbUBoi6eaiolEspKtIe0k+ySLvQi9gBmcbVzWhJte29unMgTp3hrHuC7bBJH3An1pm4BUpIjEBJaTcal0DY64y2dtDm/ioIa6hLRV7840QNR9goE2rmvmv+b/uoEWsL8suh9E3BXHesYEg5B8etJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf2zTzEF7BU6VLZiCGKAvzf5Y5xxHRv0YaUWoBVEhIw=;
 b=mEpTKLiw1kAjxtmZOkhHdtZm19xrEPI+zJo90bSA0Jjjq/D/8GNYig9cWPaaBPcGoiAUiMPk4/HhnFXhBZZF8klPyNg15Zr87Z/xo63P9KJWF5QID84J+Z4jfO1Bu3gaevVGsxO/0kOpXkxzi6SLW1VmZLbjClhxXHLSnQXBz3qifMqJlSvjbFhLP0dpn7C1NWcAoH9vdsQlSEyZxvj7TxKd23CZVwBnA+lY8WZCIa4NkooSpbfQHEY3VpfHXsSRmgZIk/HgCbtm7Dv6262LNnvlrHVV4KSxqM5iSOJPrg56MaEYcpmJe6YCTXZrON0ZUcWTbOYVGOrGk2EcfBgaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d) by CO1PR11MB4899.namprd11.prod.outlook.com
 (2603:10b6:303:6e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.23; Fri, 13 Jun
 2025 05:29:16 +0000
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e]) by DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e%4]) with mapi id 15.20.8769.025; Fri, 13 Jun 2025
 05:29:15 +0000
Content-Type: multipart/alternative;
 boundary="------------0jODaM1lBlhE2Jh0OBR7Y0AD"
Message-ID: <e0c75458-d68a-4e59-bb97-5bbab8c5fdf1@intel.com>
Date: Fri, 13 Jun 2025 10:59:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel-ci: Blocklist unsupported Xe scaling
 tests
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
 <2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com>
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFEF920636F:EE_|CO1PR11MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: b6269d50-6ac0-401e-dae4-08ddaa3b3cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVVjMG9NSUJSOURGVlhFS2J0N0dORmRmSUd1NGdYUEQrQ3oyUTNXWE9NdHc4?=
 =?utf-8?B?SUVNS3FSK3hVa1Vnd3NoaU1ldUFjQWpmZXhIMUlQUURCR0UvL3hkRElIN0c2?=
 =?utf-8?B?QTY1ZVQxNUhiY2lJTkMrdFlyL08wTEJDRDUrdGtCZEdsM29KdkFKZkYyU1dm?=
 =?utf-8?B?T0gzR2xaWS9oNmx5cDNSN2RtMEdXMGhTMlBqV0RMSTBmaExCaGpXbksrWUZP?=
 =?utf-8?B?Y3VGdW5RQ0tEY3I3Tk9abU1GSXVvSTQvRXNSVkpJMUV0TWpCaHJzMExlRUFm?=
 =?utf-8?B?TVF6bGxjK1d5ZGdxeSs0eHJmSlQ3NmVVRlAxWDJFeldjVGxoaWlOaCtkK0RR?=
 =?utf-8?B?cXJCcy9keVg5Qjd4RXQ4YUVyUUg3STNpVlZyMGd3aW14YkJIeWNJRTJIU1Ft?=
 =?utf-8?B?NWM0bk01eXM0aTYzQXkxRnY5UGg5UmdxTkZ1VlJxOTYzMnBZRzhFZjljNEZ0?=
 =?utf-8?B?ZUtkZ1BjNEJQTXYweFYvTnB0TzAvTTB6STMwR0UxMDlqb0ZibnVLeGNCQUo3?=
 =?utf-8?B?Ym00cjdVaExORWlMZjVxalgzdSs4Ukp2MnhSTjJCb3U3Z3I0Vll3amNQNnVh?=
 =?utf-8?B?QVpJbVdUdmpSdU9raXNBYWJYUXJyZ0JKL01nbXRDMTRmOWczUGFEdm9BQmVV?=
 =?utf-8?B?SDF6ekRwRDRvdU0vZGZvYUFoY1AzeTVoU25OQzlmSG0rSzgzK3RxMWpNcGJG?=
 =?utf-8?B?eGdxZHJVK3BlYWdRVnpqZFlQWkhNbFNUdE9rb2xNTzNKTVA3eXlqT0laU2RD?=
 =?utf-8?B?WWN0dkZQcElpVndlODRWYUxXK29GRmtjSGRucTdsLzB5T3BYWThJUEVVZjVT?=
 =?utf-8?B?K2hLTjAzZTEwWVdqVURuMHVNbEFLc2xBM2grb2Z1ZVFQSFZHYmhHeE5DeGlY?=
 =?utf-8?B?ZWRpQStONStkbjhndmdsamI4ZERkbFIzRC9TRy80SU0wT2hKT3hDZ0lJVlcz?=
 =?utf-8?B?RzVoSC9CSWdjQjRiR2EyK0hBanJNTzFWa2ZTdGYxbjhMdmNacTROOFUxc0JI?=
 =?utf-8?B?N1o0eTVOckExcmFxK0U5V2k3NzQ3MlRDUXlXbFkxZzlWR0c1LzFITFcxYS8r?=
 =?utf-8?B?cTZ5L3ZTQVhDU25oalZ2SGhVNTNEZmpBanpKeHZmZDZneFd4bTdkYlVoT2RI?=
 =?utf-8?B?WHg0ZWZlNjN2SXhmaE9TSDUyeklKcnBkUGJsOTNBeDJuYWt5dXVPSHVLd1E0?=
 =?utf-8?B?Q0hzVEdKM2JKRy9RL3h6ZUY1bjA4NlBXeTBRWWxPWkhqeE52OGYzTG9vZXIr?=
 =?utf-8?B?SXFIaHNJeXhKNVBhSEIxMmVSZTdVQjgwVzRIYlFwY281cUFhTzFuSjhkTmZm?=
 =?utf-8?B?ajNtemVRZVJsbXdMeVBRVGUvQnJMelJEUVcwU3dNT1RlNWRPVy9TT1BLQnNB?=
 =?utf-8?B?aXU0ZWtQQURWSmhMOWs0OXBKTnExL1MxdXMveVBDajFWbkFRWEVKWHZEQkxn?=
 =?utf-8?B?RksxOFJFa3VIcC9TVkxpeDN1RVhHSm8xNnRIN3FKdHp6MDBHV0lDbEk3TStH?=
 =?utf-8?B?MkJGekFNVGE5WlRJczI5bWdpRzZ0ODd0N2Y0MHVBMUc2aVZOdmd1NFJxcVdh?=
 =?utf-8?B?WWJNUnZuYXEzV0lxYU5nTjFuNmtzYldqcEVWeWdKSmdsRlVxeGgxalJsaitj?=
 =?utf-8?B?aWc0Q0NKcnRJYTNwUFdSb0ptaTlZV2l2Qm5ITkJmaGViZXNEQitTWnVXTHZz?=
 =?utf-8?B?RDF1QUszSE1LOGxvTlFtcEtUL0I1cG0zZ1hWbDIvZDh3WGZjMGY4cU54bFJt?=
 =?utf-8?B?RkcvL0xZSUN0YmZVbzJhZ2cvaGN2VHpxeC8rZXVpbXljQmlaZ3E1Nk05WmJ6?=
 =?utf-8?B?N1ZOUy9ob3pxa2JEOE1RdFVscUdQSUpYeDZqSEZ0dGNxa0traVhFRU1DUm9x?=
 =?utf-8?B?REFSaVJiWFdUbm9IZGZEcUJnY04zdVZHaldMSlV5dUIvUGNoeDgyLzNyb2pF?=
 =?utf-8?Q?AWcULoyolgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPFEF920636F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3dMWW5xelhCaTBHbjJXMkV2cUVnSXJ1ckVMMDFEbTQyZmVuQ0J1SEx4Z1Y4?=
 =?utf-8?B?S1BaZHhQQ3U2WG43WWovZWdRdDBFUWtDRWFlZWwrR0djSk5jNDZocVB2bkt6?=
 =?utf-8?B?Snlqdk9BTzZKek9RYzgyR0kzN0EvRDlLZGNlaHhuUmIxT2g3N3hMZmF5RHFu?=
 =?utf-8?B?NVA3US9hdlZqZVEyOEE1bHZLSWxvQ2t0a21VOVRhazZQUHpoR2RoMTFRQXAy?=
 =?utf-8?B?TGlWOWt1UFRQNGE1R0t6Tkk1RDM3d056OHp5ZkFFVEhkTmRWVFpnMlBZa0Fj?=
 =?utf-8?B?Z3BxK0xaV09yR01CZ2ppMzg4R1ZKSHRZcW5Mc2J4djZROGNvQjVHVXFZcTJn?=
 =?utf-8?B?SHEzMmxVcC9VSkVWbVJzMDVJdUE0bDZLRW5GNzNNRjM0dWs0SlJnbFJKUlNI?=
 =?utf-8?B?dTIyM0U0c3FvamRoaFVvWGR1d1pBUXhZVDZvVXlQYTVnbGViZDJEN0Z1VHQr?=
 =?utf-8?B?UWNSUTdmcFlBNDlaYlJOV0oxYk1uQmxlaVJaRWhRazRrYkcvakdnTEFvdmsx?=
 =?utf-8?B?eE9HcERZU0NPNFBxRStuaGdBaUI5a2lsOFFmQUpIQUNzSW9TS0N2dThRTURE?=
 =?utf-8?B?RGxBVy81U2lXZGtPbjhMeC9kYkpjRjZaaEQ3dmRkOTVGaTR5UkVpV2o2SlV2?=
 =?utf-8?B?SE5ON0YxVFdDdXh3QVZGNlJGeThMdytrUXk5dEljTUErN2VvOHpodTRiYW1R?=
 =?utf-8?B?K2lCaCs4VjVTSDFNcjFSaE8zaXBMeEhZR1cxNGd6NTY2M2NtdytmK05MR3pa?=
 =?utf-8?B?bkY3YXU4MVU2cU5RWHVXVW9xcVlKZG8rNitpTGhvNTRETGZQRmFBWGhsVnI2?=
 =?utf-8?B?L1NPZSs5MldlblRJc3J2cU8ydUhoMjEvSk40SmFGcWd0Uks0aVhESmVjVHd1?=
 =?utf-8?B?MWhFcmRkb2lpKzc0dlp6ZitiNnJ6aTNXTzI3SjNoRWZXa1FIR3N3RExUUDQr?=
 =?utf-8?B?V2lWS0NxQzA4Wm1UYVFjaStSSFdBbldxZzg4aS9tZWFNaXBTRUZNSzRmc1Qz?=
 =?utf-8?B?RlVXMDlrdzY1VnFTeHg4Z3J0Q0VXT2tPRXJTWG92UnJjWHNIYVJaK2YrbHov?=
 =?utf-8?B?SHB4VWU2VVhoL2doSWpNZXp0K0pSdHFpMnRoVFRkNUpQRVcrMjY5cThPbVA3?=
 =?utf-8?B?M3VSTWY2MGQvOElDb2Z2STVRbmU3dmUwTDRQVkM0ZUo3UFRCZDUweUFrU2pp?=
 =?utf-8?B?UWJxemkrL2psRUhTQnRiT0tKbTF3OU9UUEdKeTBuTm1PaW5vQi9mbGI3WjAw?=
 =?utf-8?B?VXJLRjY4NnZSLzJPb1JJVnBOc0tqd050cTJBVDhvc01hQVZXdVRIT1lpaEV6?=
 =?utf-8?B?VHA5dUlMeTRDK2pEdjRxbm1UcHNMZTIrM2c1UUVHbjBTaUFLL2ZmK0liZVNk?=
 =?utf-8?B?K0FlbFI1UjQxRnpEeEVlY1c2SlhZZloybEhtSzBYR29nQWNldEtEd1dNYjgw?=
 =?utf-8?B?UGdHK0gvZDRqVVhEakk0Y1BMR2MyTExvT3czcHNYUUlDNlE5Q0FjT01QMUYv?=
 =?utf-8?B?aVYreVNKK3lDb3VlWlpVR3NteDlkaG1QQlg0eUlJNmJreEt6RGoyTGlGN0Fz?=
 =?utf-8?B?ZE9qdWdhdEN2eVFiTGszd1JJTzZjcnJTNUQwakF3L1ZBcElrMWR0VFpIVlFZ?=
 =?utf-8?B?MHp3b1NicUk0SkJyc0lFYzBuclA3TlJXeDkxdWpIYkxibTJSM1RDa3d1ck5J?=
 =?utf-8?B?RE9SODRZR3B5Nk16ZWJVSkFYMzhFQkZXVkVRZHpadFFOYUloaUhIQ3pqK3VZ?=
 =?utf-8?B?RUg0L0RkZ3RyS0M2TFpoTjBiUEUxd3BsWVZWUTBDb2puRllaRnQzS2xVdEFQ?=
 =?utf-8?B?SkoyNUVyOFJ5RzkrZEUzbi9GSDNYKzQrTndtbnR0TW43K0Naa0V5RC92N0dt?=
 =?utf-8?B?MVpoeFR4ZUxjdmxlRWtjSXh5UFVlb1BZSXovbVMzMlRnT2RCZ3h1ZldHUDIv?=
 =?utf-8?B?MXR4cVZOcHlxTFlnVjF2b3JkTHhEc0VIRWVIaUpRSHpCVnRGSDZaK2dNVTda?=
 =?utf-8?B?a1dtK0swbklPaDFKVE5WYmt6SDMzUzhScTZIMDJZMFVBeDNETGhzMDBPbWJ6?=
 =?utf-8?B?WVpSeVZoRCtLakpqZ3hjSkJoZGV1OHVqNjJldnlVNWhtRHA1WEZWRis2RkVO?=
 =?utf-8?B?d0N2MnRZMnRBZEhFNXBlT3VKQlhJdGRNZnptSzRMZVJEemROWU1ocFRsTkRI?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6269d50-6ac0-401e-dae4-08ddaa3b3cbb
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFEF920636F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:29:15.9006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6qdihgi/RjO30gIu/KSsMjJwKkZnurioCah/lyi21V+nRS4hvOffkYvbzIxVZTf3k1mD9ZG6ioPu3g2NM5N5FFn9monDDI+/m4oAfB5s+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
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

--------------0jODaM1lBlhE2Jh0OBR7Y0AD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Karthik,

Thanks for reviewing my patch.

On 6/13/2025 9:05 AM, Karthik B S wrote:
>
> Hi,
>
> On 6/13/2025 1:47 AM, Naladala Ramanaidu wrote:
>> The second scaler does not support downscaling in either
>> vertical or horizontal dimensions. Blocklist the affected IGT
>> kms_plane_scaling tests that involve downscaling scenarios
>> unsupported by the second scaler.
>>
>> Bspec: 69901
>>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> ---
>>   tests/intel-ci/xe.blocklist.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
>> index ebe1ff006..8e43c217d 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -82,6 +82,10 @@igt@kms_pm_rpm@cursor.*
>>   ##################################################################
>>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
>> +igt@kms_plane_scaling@planes-downscale-factor-.*5
> I see few of the tests passing with this filter where we've upscale on 
> the second plane. We need a more specific filter here.
Agree. i will fix and float in next rev.
>> +igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-.*
>> +igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-.*
> Could the above 2 can be combined into one? 
> 'igt@kms_plane_scaling@planes-upscale-.*-downscale-factor-.*'
Yes we can combine. i will fix and float next rev.
>> +igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-.*
>
> This I see is mostly passing other than 0.25 which is blocklisted 
> already. Do we need this?
>
It is not required.  I will remove this in next rev.
> Thanks,
> Karthik.B.S
>>   igt@kms_prime@.*
>>   igt@kms_scaling_modes@scaling-mode-none
>>   igt@kms_writeback@writeback.*
--------------0jODaM1lBlhE2Jh0OBR7Y0AD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Karthik,</p>
    <p>Thanks for reviewing my patch.&nbsp;</p>
    <div class="moz-cite-prefix">On 6/13/2025 9:05 AM, Karthik B S
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com">
      
      <p>Hi,</p>
      <div class="moz-cite-prefix">On 6/13/2025 1:47 AM, Naladala
        Ramanaidu wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
        <pre wrap="" class="moz-quote-pre">The second scaler does not support downscaling in either
vertical or horizontal dimensions. Blocklist the affected IGT
kms_plane_scaling tests that involve downscaling scenarios
unsupported by the second scaler.

Bspec: 69901

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com" moz-do-not-send="true">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ebe1ff006..8e43c217d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,6 +82,10 @@ <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt@kms_pm_rpm@cursor.*" moz-do-not-send="true">igt@kms_pm_rpm@cursor.*</a>
 ##################################################################
 igt@kms_atomic@plane-primary-overlay-mutable-zpos
 <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt@kms_plane_scaling@.*downscale-factor-0-25.*" moz-do-not-send="true">igt@kms_plane_scaling@.*downscale-factor-0-25.*</a>
+igt@kms_plane_scaling@planes-downscale-factor-.*5</pre>
      </blockquote>
      I see few of the tests passing with this filter where we've
      upscale on the second plane. We need a more specific filter here.</blockquote>
    Agree. i will fix and float in next rev.
    <blockquote type="cite" cite="mid:2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com">
      <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
        <pre wrap="" class="moz-quote-pre">+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-.*
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-.*</pre>
      </blockquote>
      Could the above 2 can be combined into one? '<span style="white-space: pre-wrap"><a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt@kms_plane_scaling@planes-upscale-.*-downscale-factor-.*" moz-do-not-send="true">igt@kms_plane_scaling@planes-upscale-.*-downscale-factor-.*</a></span>'</blockquote>
    Yes we can combine. i will fix and float next rev.
    <blockquote type="cite" cite="mid:2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com">
      <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
        <pre wrap="" class="moz-quote-pre">+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-.*</pre>
      </blockquote>
      <p>This I see is mostly passing other than 0.25 which is
        blocklisted already. Do we need this?</p>
    </blockquote>
    It is not required.&nbsp; I will remove this in next rev.
    <blockquote type="cite" cite="mid:2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com"> Thanks,<br>
      Karthik.B.S
      <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
        <pre wrap="" class="moz-quote-pre"> <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt@kms_prime@.*" moz-do-not-send="true">igt@kms_prime@.*</a>
 igt@kms_scaling_modes@scaling-mode-none
 <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt@kms_writeback@writeback.*" moz-do-not-send="true">igt@kms_writeback@writeback.*</a>
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0jODaM1lBlhE2Jh0OBR7Y0AD--
