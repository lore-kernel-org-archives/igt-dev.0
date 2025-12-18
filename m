Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CD2D711C4
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 22:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415F10E83B;
	Thu, 18 Dec 2025 22:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RI84Aj1G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE45310E83B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766095641; x=1797631641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=POdobVNmMQdRTS6l0KQerkRN5LjIhxzjHNDkVe39zPU=;
 b=RI84Aj1GnTccGOfZFnXZZFdKHX3v43noXgWitfInFHwK8gHFXs9MFDkt
 ktTWzFuKw48PZEpfMO8hxE++YCTOiGi//gZNuf3PXNsVq2HKjTVp6HMa7
 7z/0w6pb8CBsZV8/vF5nH3CoR+uawrXdsI5CiSLdHpeaDFFbljQqCIYgh
 ZLjnVsizLyWhTAfBusoXeXkmrMbQO7+WKi2Ib9dtwNczD4CfZKlhuIKvQ
 J9HWP9s5EJYEZY7hWmluk7IXgXiTfnYz1xssOpDzL5qztUL88geq9SV+D
 8SCupPYbU8DqkX/La7HWqyD4kVh/zFMZmvUw3KOPvBnpfcgGE6JrEp3uB g==;
X-CSE-ConnectionGUID: qAWsORyaT1Oa9t2iuoWtrA==
X-CSE-MsgGUID: PUKHQJJcQYO3WbTbNjHSzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71920457"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71920457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:07:21 -0800
X-CSE-ConnectionGUID: 6ziaw7UeTCmNyUKv7wYcoQ==
X-CSE-MsgGUID: 5y9mx6BPS72MOyYl+BYIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197956451"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:07:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:07:19 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:07:19 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:07:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0VsEqahwJinH0/qFPDoBhctrPsM9QdJRPRTHZHttw1iHeqp+xiwBn/6pkYcADUgZ3a48IAnyTmjR7Ty1PeTTnUzUmWR8ubs8L+4pFEgxK9DIrCAfGjH55ETjLOMB1EL6QfeV2xr3cWicqAjqa9gRU/DxHLjUxqw83XD0t7E77bAQr+WiEb8/CvtvI0P7IEwsQldGujyKmoA0qAMbEoWkiipGddGij+a4/2tFuOnwG5f3k8ojkf2esww1VH7wKfswDrLc8/qjApf3zbbotz6fGxJICkoHdRSfYqeTeX7RBxDWwLSq8CRoyU7hvI4LoJw3AEuPr+Rb6o0XxmiALRYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd19rDPJ+8RUhrJV2BXtpw3M02p4NJgwhwKsF3v5v4M=;
 b=o55IuA1J8LztmMrg/UTzOAXcylUY6f5urK/IZyGrcUb/OuLJ3IXDEqLJunFTMM6Zj+ytmuwOqyFXGBMDW7R4mQ5oFB1OwkTVEDn5XEnf34ri2ccm8Q0ovpvGknmkC9BhtV6fzpiHqjTKsF+HuXsF3+khaTBonoNbJnDi3lbgoodE0YjoHHFGxifmUh4+kbXP1F980HSjPot7BEMtImtJRqd1FX779PFWBuESViuvPhmIQYeY4BoGJZdtiIw+OkWqJlWWN/iMAOCZMsbcwiAupQvD8P/dJ1yUAJr/AxTHoT/x6TBXPCqv85D1QZf3xTtpzQQcZmarUhWczepZoVw67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 22:07:11 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:07:11 +0000
Message-ID: <8c31e4a0-9e8c-4ae7-ad29-6239fed8d027@intel.com>
Date: Thu, 18 Dec 2025 14:07:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.zuo@intel.com>, <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
 <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
 <zdagolp4fkoklgy3uq5h25f33t3hmhfkb63d55wpycdvoxcqc7@ikyi44pkfsgg>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <zdagolp4fkoklgy3uq5h25f33t3hmhfkb63d55wpycdvoxcqc7@ikyi44pkfsgg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee24216-2fb3-495b-3c78-08de3e81cb37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVppeEZkMEtEK2MxNjU1cDhId0x2WURqOFVPZzZJNkFDK2VTckJtRjZRcmFL?=
 =?utf-8?B?eTFtTk9ZemlROXFUbnBXMUpQVmEzTEVya2krMXB1RE01YzdOdzlGamd3MENY?=
 =?utf-8?B?WjlwcFBPdnNzZjBaaGtYYTNNZzZtQUZ5cEE1aUVGWjZ1MHhGeWRtOS9aYmhY?=
 =?utf-8?B?NWorVXUwWFpjRXFsYVI2NDJFRUI2cXdJQ1dkVUk1VU9XRThxUHN3c28vQ1dF?=
 =?utf-8?B?MmViVlFmZE91RWQzL3E2N2lNdlMraHlUc3lKMk9WQWpQQ3JwcWVaLzBTOS8z?=
 =?utf-8?B?SGFIelNhRUxjdEQ1YzZSSVh5ck44TEx6aG01bElNVnMySXFjU3hlV2dyUzdU?=
 =?utf-8?B?YUtzRGltYVVEQXpOUTlmVTBBREhzckpkbXlTczJTbzNBZE5oRW9kbnhuU2lW?=
 =?utf-8?B?VTdvSkI4NGcwTHdpcnF0bi9lS3FocE9vQ3dFVmM0cHZ3bWorMFBjazVxdWlP?=
 =?utf-8?B?QzhWYzFuWlZnb2Ftc1lwYjNWV1V4OC9oTG5UTTA1eXpnTlZTTVcrckFEdEVl?=
 =?utf-8?B?OUt4NjY1K0FqK0F3M2xENGpJcStqcTF2Um9xbncrQzdMYmQxUTlQUDNaL0N3?=
 =?utf-8?B?MnpjQ213ZlVvUVlqU1NaZjNNa0FZaXVJZEVhSWc0alA5WjcvQ1NBMmpPbTl1?=
 =?utf-8?B?dkcvK25qbmZQRlBSK1JvNDZTNkNUUWQxOVNneHNJa3krbm8zVDN5VW81NVJM?=
 =?utf-8?B?dGViRkg5OWw2ZjBQTTlpZ0hkNGVGTXNreng2dDZpUlpJQlJQL0xvRVpwTGVS?=
 =?utf-8?B?V2I4VEdma2dyWGdTZ251VGhYdzdlNk5laWczSHZ1eERSamZmbm5COFVYRWtV?=
 =?utf-8?B?WnZvbVdMZW96WDV5TWhPckU3Q0xINHkvcWY1Z2t0TmtiQm5mL3lZN3pYY2d1?=
 =?utf-8?B?K1lhUEY5c3VLY2NDY0ZPT2cvV00wTG5qYnE2Z2VCL0hIVTJqb1dRRjhTV2xD?=
 =?utf-8?B?RXlpNlRUMGhzOXhDUXF2clNJVFp1T1JNVlFTV0ZIQmdxNEVaRWFFQjMreE1a?=
 =?utf-8?B?SHlxNkdyL1gxTE9nKzIxL1pKeGh2Mm9FSzF5TzBlazFDUGVvdTdvOFcza3Uy?=
 =?utf-8?B?ZDl5MUpnMjdiaXdmTU9Dc0ZVOVBsdTdvQXAzT3RoSUgxbFI0VW1KYjVNMGhn?=
 =?utf-8?B?TmlQSnl2cFJ4WHdiSTdJcGEybThvcFdMYnEzaUZWVlBxeFpCeWRYWTdNai9Y?=
 =?utf-8?B?Vm00K2Rzc3hWUGZQeWxZUTBzUjVnM0pCdHFHOTVrNjBlelFVVXBqZVl4NVNy?=
 =?utf-8?B?OWhESThlSXRtNFhwbGlib1FGZFBDbGpSaElpQnoyVGtYTzVPbTFXbmlXOWVQ?=
 =?utf-8?B?TnJPQWJNRGN6bitWSGRYcStUd1dtY0FRUndsVmNDWEhlTlFqV0gvRHNScFFD?=
 =?utf-8?B?d1MzL0luUEFMKzBsTm5YRmwwUXdpbHQ5TjN4NEhFeldtVXVjSFVQcXlnbkhu?=
 =?utf-8?B?Znp1YjhZUGNIWWRwemdyZzJIQzRXSFNwU2dpUjMzZEVTSFRsRW8vTWoxNFlI?=
 =?utf-8?B?ZWQzYTQwWXRrN0d1WU9hd3pVL0NvSS9rNTUxaDFHMXo3Z216MFYvSGN4U2ov?=
 =?utf-8?B?WGlYSzh3WTlPdGtlV3JWN3g3aG9lSXVBR3puamVzTWVRakFwNXNTemFIMWZy?=
 =?utf-8?B?QWJLQ1dHVGQ4WU1kVEJITWo3RGRyYTQxWXBXM3l5cWV6VFBiUXpRa3dXa1VX?=
 =?utf-8?B?UU5RMEQvbERwNzBWNGhlQ215MW8wRng0eFJrekM2d1I0STdDKytlY0YvNHQy?=
 =?utf-8?B?MVlWOTFvcTRIY1VQZEpMSzVRVTFQdHphc2EySmFlN3IrcWhjVE16MXN2ckxU?=
 =?utf-8?B?emtydzdlMm1ENXNXbG5CbVF5cHFpZFU3aUlGeld5UWNiVEl1VFBjR2p0UFVO?=
 =?utf-8?B?R2pJMTZBNXphR0FiUXZZVk9rZUFzYnVudmpYUlpWR21MQWhJMFZsWjJMMnBH?=
 =?utf-8?Q?lbQgOJntJsfVgdLTPHMXgJnZdof+QXUe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldBNDQ0NHo4SzFZR1UxVHJDbjF5b2hpdTh6MEEzVG1nNEc2U1NtOVpJdXh1?=
 =?utf-8?B?ZkdWSk13SGFiaDlTcTREQmE2b0JycjV3a3BWQm9VWFRsc0w4Y1VnTjdFckd4?=
 =?utf-8?B?bCsybFJySUQ2cVpZTTdGTUFhcHVLODJwQjJhZHhNRTFKRDNKVHBqRm04dmFN?=
 =?utf-8?B?QTdCQ3ZpYlhUaHZHbG93UjU5aHZXV0pISCt4a3E5OStEYXBXblA3Y2w0UEZC?=
 =?utf-8?B?MksrVHNHV0o3RUQ2TUJXeWtmRmJQY1hCbUdqWXR3Rkc1WkNWa2xUY2hwWlND?=
 =?utf-8?B?bnRvRmJQWVhHMW93dEhjcVlUY1ZlMWJEelVkbTdxVDQvU0N2TE1BUzljdHNx?=
 =?utf-8?B?ZjlhQ21ZaGhtMUJCU3VLY2FscmFpc09WYlNmK1N5SXdnSitwUEZtS3gvZjJT?=
 =?utf-8?B?TEtsSHVxU2V0M0UvRHBpTmVEdXRkMDdVaWN0WjlVdjZPQ2ljMVB0YzRDRWFj?=
 =?utf-8?B?bXVLUUcwTUw4eWc3UjlIWTJ4anRCMFdtWnVzM3FSaVJjWEVyaTlZNjVoS1Jy?=
 =?utf-8?B?K052bXR6ZTVJaDQrWisvSXBQdFdWOFYvWkRjblV0WXlDLzVaK3lvdkFYb3lE?=
 =?utf-8?B?bU1OYlVmY0NnSW1XY29QQml4ejZ2bnpySFBOZHo2TDlranMybWJDMEZsd1Vr?=
 =?utf-8?B?QkJNQ3c1eEtCMExUdCs0aTFEZ3hweTBwTnc5WkM5OFczTXJXcGtFZHNObjFr?=
 =?utf-8?B?aVVXcExJbzlka3h2Q0dkQkVtWGVqVEQ3ZS93eEk2Tkk0ZHZJRWV1WmNHdFh1?=
 =?utf-8?B?UVJySnFDcytiRm9US25vVG9RaytYTFlMbGFUYWtHRDJibHZtQVZMYW9mZHFI?=
 =?utf-8?B?YVhZamQxU1RzTXlFa3JwYks3a0lLdjRpczRJTXh6MEEwSHE5ZHhkaU80ZmNH?=
 =?utf-8?B?QSsvcVhnTjVxWXFyZnpiRXNKdTV1anp4bTFaMHJMaXA1QURiZHNHVE1Lemhi?=
 =?utf-8?B?M1Vqam1POWNiNlZRT1MydjE1c1hHRk1NUGRLTjI2TUIxQmc0QzRXcUFnbTNu?=
 =?utf-8?B?OVoySURPWmZSUlY2NVZINmhWZHJxK2ZMdkh5dDIwOGRQSXVsODNidjZ6UVMy?=
 =?utf-8?B?dUtwV3RIOFU1alp4TlU4RE5yeFJCOGhRTmRkVlkzMlhTU1ZiSnFvUlRlQXk1?=
 =?utf-8?B?dWMrNzdrbm9uUjFNUVNrdEJjS0hqVUFwbmFGNlJESXVzK1RtYmhCaXc3RWZh?=
 =?utf-8?B?dTBiYVE2UEV4ZEMxdWNlTVptNjYyUzQveUlKNzFIR2Vncnhxb2VzaTZpaDhC?=
 =?utf-8?B?QmRrSmMyRXZVL2lBeGw4YndyVWo4UENRb1lDVzIxOEpRendNVFY5bktnVHBS?=
 =?utf-8?B?V2I0aHF0QVRvZ0haNjVRNWxzb3BHdERTeWNaUDd4dTJIcHRGSE85eWZITGhx?=
 =?utf-8?B?WUI0MExyVHZDempEWXdYT3laU3ZJT2s1NXlrVko5b0JuQ3Y4bDhvNXRxQ2xG?=
 =?utf-8?B?VTlnTGZXeENvYXVUaGVOTU4zLzM2VnFhdTRPaFZLd2pra1RGczBxYlZ5c3Bz?=
 =?utf-8?B?cE0zNzVMQ1lhSlIxWTNsR1RwMTAzVGd6Sk16Qnhjb0h6ZU12cXVDZXJhd2Rp?=
 =?utf-8?B?S3dtWTVvVTN1NXI4MlhkbWFvTmdEdXNNWC9XQnJIRU91OTFWalJlWW5ubVdS?=
 =?utf-8?B?MTJURHI0VFExTkUwamxTaDdMQ1o3clIya2RaSzFJMy9KcHJHRDh3MUwxVTd0?=
 =?utf-8?B?VmFnNzkrd0pPWUN5RHhHeFZZZTFJd080bVRWZTdHU3dYWnRqWXpQMnlxcWFG?=
 =?utf-8?B?TE5mOHZibG9OaDZrWS9DNHN3ZnJSOVBHY01aTmF1eWpCWjJVSlFETEJTN0tS?=
 =?utf-8?B?eFAzTlRHeERZN2R6a3dmNDZXcE9FN08rU1dZK0gzR2Q2RXdaZmV5eGFnbHFQ?=
 =?utf-8?B?ZWhaOUIwZVlmai83eE1Na1d3MWRPczBUcWM4Z1VlL3hqZlE1ZkQvb2ZrRmtR?=
 =?utf-8?B?U2JCby9OdjFSQTRPQUF0THNOZ0FRaDBSblBnSlkyZzVFU1lrOXRFVHNlVENC?=
 =?utf-8?B?am5YMG1mbGRQaE51dHUzbmZJUlhaVnRTZzNML0taWHYrQ2p0Z21YSitmczN5?=
 =?utf-8?B?NEh4MStlVlFDT3k0MjFCSnhpNDN0Z3dqQ3JJdWNTWnF5enhpMWNzYUJaNUlE?=
 =?utf-8?Q?dgzUV3wftPwzl7RWPpQB4iKRV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee24216-2fb3-495b-3c78-08de3e81cb37
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:07:11.6292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hr6MJ1Y3qwpvsiu6Xvv4kD4c9Ne9SZR/kJjbUsIGk/aPXYvAVch+yOLfZlqwlgT23p4LV5hBaevKc2/Ie3NbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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


On 12/18/2025 01:16, Zbigniew Kempczyński wrote:

> On Wed, Dec 17, 2025 at 06:43:42PM -0800, Wang, X wrote:
>
> <cut>
>
>>>> +	static __thread struct intel_pat_cache cached_pat;
>>>> +
>>>> +	/* Return cached value if already read for this thread */
>>>> +	if (cached_pat.max_index != 0) {
>>>> +		*xe_pat_cache = cached_pat;
>>>> +		return cached_pat.max_index + 1;
>>>> +	}
>>> I'm not sure we really need to worry about caching the results here.  Is
>>> this getting re-called repeatedly in a single test to the point where
>>> it's creating a real performance problem for our tests?  If not, we can
>>> probably just keep it simple and re-read the debugfs if this function
>>> gets called multiple times.
>> The main reason for caching in xe_get_pat_sw_config() is not performance,
>> but
>> correctness in the presence of privilege changes. In
>>
>> igt@xe_oa@unprivileged-single-ctx-counters
>> igt@xe_oa@mmio-triggered-reports
>> igt@xe_oa@mmio-triggered-reports-read
>>
>> these tests drop root privileges mid-run; after that, accessing debugfs can
>> legitimately fail, and without caching the PAT layout we can end up
>> re-parsing
>> (or failing to parse) the table later in the same test run even though it
>> was
>> available earlier.
> Using static in library code also generates the problem using in
> multigpu scenarios. If you need to cache the result, do this before
> dropping root privileges. IMO xe_get_pat_sw_config() should assert
> if it can't get the PAT table. So whole responsibility of handling
> this will be on the test owner, who will have no other choice than
> caching the result before dropping privileges.

Thanks Zbigniew — agreed that using a static cache inside the PAT
library is problematic, especially for multi-GPU scenarios where
a single cached copy can easily become the wrong answer.

--
Xin

> --
> Zbigniew
>

