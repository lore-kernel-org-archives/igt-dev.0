Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8D1D64084
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 07:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D74110E287;
	Wed, 17 Dec 2025 07:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxA9jq+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93E210E287
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765955320; x=1797491320;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hDGl84UWzcEPw4Td7XW/43nDFzOblqUSKS8AJVbRmuk=;
 b=BxA9jq+E1cRTHfMRNVWAv0XRBO9vOJS4JdHX+U4Yc6njH3R5bAnLEwvX
 UKt7SH+vu34PBU8/tGcqRefuMZzHgtGxtAETabhEG6QFjx1nb62qTfAdK
 np5ZrH01xYNS4I7+d87ITzhQdD/fqbKoU8Cjs155AzLHPEQcKmcqu6fet
 fXnFdzEucFqHPm63zPETA3xP0jqEHcriMWWu2VnV6rJFvOTJzu8iWGEgP
 iZ8U0EDYdjyAdWroJWq+i2dgmwIamXCoSDBCP5K+6VzbpMJVgnBoU8CbI
 vf2omCdRqbun0x4Ix+32bJlUbyENnuvVJ1NM/mCcLvTDT6Hwtkun13Tyt g==;
X-CSE-ConnectionGUID: Ol6f+z8gRlanG6FGhSWwlg==
X-CSE-MsgGUID: MbRP9lnkTM+ucI4c17QcCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78526117"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="78526117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:08:37 -0800
X-CSE-ConnectionGUID: gqYcCDPST/6w6nASlIrcVQ==
X-CSE-MsgGUID: YRtbVyQrSluur5Qg/b/BRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="203336975"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:08:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:08:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 23:08:36 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:08:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajrlN1UgBUYCxME7oIC26VCJGym1lv1JierIF6qBRmFT6N2tZCbvl+gl7c5DELdGQLeVfcdRFku64505PB2n8BAxsrUuN1NVn2k/5S1Le4ThESc+886P7U0kkmBEF5pdwNtM0L2FCcXG3LcB17VnnXiUOedMzDGrRMJFRKrNvFqaZvjgyt+bMYfMtYTUt7amC/tHQwL7YGTkXyDoUDyq2iNm8bWB2soT/hKfkAo30hCMVZRNQDnzURfCv7hHdPPs1UMphdt9dH+tmBeUZoFMPX4lk0lJ/M3UpqwN7n76++02naw2WGl8j5FAP58jTEp4bpyrPkvbtmazkxUVfuChMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ww7MGFjM/mfClKNm8lS6EI20m/NRaz2bj+K8C7LCooE=;
 b=inE7yKa8EQ7U1HC7kUTKWrWH2eu8qq8hAlnTmJGKhxLLbBqDQkClx0v001AoZThC0IzEEhZwQDmliq/Qj0wC0H10k4DwSBKdf3qLAUixlF4ItCu+nA/KE9vUeByB3DW4Tu56fULfdae5rEcKsvEVLcGTRK6qjH/z0xwEpOaN8QZq/BfCf6PeiXMj2FfKei6oRW3uf2NEARf+bZ9JXlX9kOXaQrXHZiq6IlkFO2e7YIv7gtAwf+RtdA5swYDAkmmxBXLWE1XVPcPYUZ/NAYtPZ6AMknsDriLL/wfDyCrLRPDX1aG2iJVJ/eeRdn6U1z433PIG6bzQGk6S1HA4RTxUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 07:08:29 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 07:08:29 +0000
Message-ID: <2609d739-b38d-4bab-bc46-7c0d9d706cb7@intel.com>
Date: Wed, 17 Dec 2025 12:38:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <alex.zuo@intel.com>, <shuicheng.lin@intel.com>,
 <stuart.summers@intel.com>, <kamil.konieczny@intel.com>,
 <matthew.d.roper@intel.com>
References: <20251217043450.241761-1-x.wang@intel.com>
 <20251217043450.241761-2-x.wang@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20251217043450.241761-2-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c4d455-b98a-4087-b59a-08de3d3b1459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW9rMGZNU3pWY2ZTbzVJRmU3aS8renFDbDhHaDBSTVA0S3Q2bnBOT1k5VTVB?=
 =?utf-8?B?ZjVEWWVYL05BcUpsNTdEbzZmRmtpQ1htMml1WjBKc0xUYnMvTTBXdWdXTkRF?=
 =?utf-8?B?ZCtsbmZESmUxenNXZXUwRDRSSTR4aHorSUtWK2J0U0FrdmwxUnJUc01CMGZy?=
 =?utf-8?B?QTZGTUE5Z2tvTmtIeFYwTXZQblI3Y3JTYUJ2eVp1QndUM0RhWTZSNDB2MlNS?=
 =?utf-8?B?cDRVdm1kSjdVQ1BOVlFDSDROL1Q5VWlxU1hhaDBDYUswd3VqVmNTZ0Z2SWNu?=
 =?utf-8?B?S2JWY1RJYnJKWWxTb2U4cVBWZStHT3czbmhIci9iczlFL05XWWFYVHNwLzNj?=
 =?utf-8?B?ZXk4QS9tcU1aZVk3dk9RbVZuLzFNVjEzRGNyTUdweFBDWUtUQXY3TysxbEx1?=
 =?utf-8?B?MlFPUjBHWjZ5WWdZZEpMUVEwTUxDTE9ZOUpHWlQ3OFdzTmtzbHBHZkdiamVM?=
 =?utf-8?B?NThPR0kxVkR1dmsyNVBNdkFveG5XbU5yRHUrWm8rQjdqNHh6YlZMVFh0NHZJ?=
 =?utf-8?B?NGxndnVxVTgvbFhkR2RVU05CVjRUMlVTaE0yRlc4ZUlBVEY5a2lIdTdOQkE2?=
 =?utf-8?B?OVZkb1pEdDltY3Y5U0twQXEzN0ZQNHNqblBkWStyVEhKV3Q1TWNudlBocnVR?=
 =?utf-8?B?TnkzTXhJRzVab2ZFdWh4SnYzS3VlaW1GZG13VlRMK1VUV0NEdE02R0h0U05C?=
 =?utf-8?B?TGtDeFFyakhSQ0s0WEdYQjJ2STZiNWxFK2NhVU9jRktzVXNXbEdoVTlrMlhQ?=
 =?utf-8?B?dFE5SGxoc095ajcwOVdDWDVZNThXWWl2Nkk4WUFLUnVYUHI0NHQ1c2lnUWxM?=
 =?utf-8?B?UDFtbnJ2NHp4RXhqRk1FREtFQlh2d1RvYUl3Z1Jud3k5MXRLS1hrOGNOUEFM?=
 =?utf-8?B?dEJZb2FjNG8relExZE1BUUNoc1Y0cUJ0Smw1RUF6SDN5UmZIenlRRFhOS1lJ?=
 =?utf-8?B?VnppOTVpQ1RkMGlPQnBRME1USm1XaUZCZWdHZE0zMmgxRzRIVzRvVGlWcGFD?=
 =?utf-8?B?VmltbFZZQTdoTTdMQU9Ia3ZZbnhITUUyZ1gvQUZtMnRHL1ZnVllKSi93b29w?=
 =?utf-8?B?RDZyUUpaNjZ5ekF5ZzB2SjdhUWRsTWlyRkZZejVQTGJIQW1SNDdkQ2Qrdngw?=
 =?utf-8?B?c0gxMlFJNURmUEVaOG5oRkxuZ3dKTmhyd3pydVhKL0lDNUM4QStGTUppOHFs?=
 =?utf-8?B?bk16L3pRMDhMa1lheDVtcnBQVTE1NHFJandFTWN6VXhTbUQrZXBQY1l1U1FH?=
 =?utf-8?B?djk5SHdFWnVNUWZpaW4yTjhVWWEyMUkzVkZzV3htZnZWRXlxSVZJbUpldFlO?=
 =?utf-8?B?THJmczJjSWxsa3R2SkVLMUtINVcrSXBUa2NpNjJTVEtoOHFsb1gvd1lCc0pD?=
 =?utf-8?B?VDBGcG9wUlhJdmkyVnQxL0hOU1JJaVhTcjZVVEUvQkRtL05QMTNPeHh2V0hZ?=
 =?utf-8?B?UDJEU05oRWVjVkNxOTkxbmVoRTF3SVBLWDVteTlkOFNyenVLL1dnVkQ3bXRP?=
 =?utf-8?B?UFBFcnpIQ0dWTEVqTGNuU1BYMWhDcEJHZnBON3hQUk84YnpEK0F4Mm1KaVRY?=
 =?utf-8?B?MzdYK29sMjM1OVFrVlE3MGxFc3pkVWg0d05mSkhuRjl2UldyNGlPdzlubGNU?=
 =?utf-8?B?S1g2L3NVbTE3SDdqdklLeUs0UWNnaWtMRXY0TVZmYmd0eTBSd2UrYzBUZEla?=
 =?utf-8?B?QndxV3RnY1FlTWFndmcwOWZpOHduVUhFRHptMCt1TnczNkNJU0RwNmhPRjBU?=
 =?utf-8?B?dWtRajE5T3ZhZWpQZXVTa1Zmcm45d1hvRVhTbDd6VUcwZVNVVUx4aDNGUmtx?=
 =?utf-8?B?ZTZSZnl0eStVVnUxTVRQQzBhcnBaNmRscWNwY3VmVEtLZktqdEI5WHJZczVk?=
 =?utf-8?B?M0xqdHl0T0VKTTBqWU5YakN1SDFsN3JpVExOeFNGVURjRDVLUlN1NjFTL3N4?=
 =?utf-8?Q?PMCX8bv0gYN/DC+U+KuNpwy7qjexALIq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWpvMjZla0lqakhTVUJrN3dSK1pJQkVUUjdabHppZVUrdHN3YlZSdmdxQTE1?=
 =?utf-8?B?b0VRbE5yL2J1dkJuYUNwNk05bk1XYklRdUN0ZDFaVnlmWm13NHVlSHY2bEVn?=
 =?utf-8?B?ck9kUWU5L2p1SzU5cS9HbnE4OGF4cmg2a094VFdUaWtRVTNnUmw2VnNnVGZC?=
 =?utf-8?B?dHlucVRYbGVqaDExMUpqazRtU0RjZTZSNS9NWmF6d2ZYNlE3dytuRmVXZHRX?=
 =?utf-8?B?KzV0VnN1WXpKRWREL2hLRXkrL01ZcktTRk1IMTFIcHgvcDVGM3Exa1hDVkE1?=
 =?utf-8?B?WUNwdTcvSEliODJRYlVMRzZ1Z0x2dDlRa0p0N0gxNElQaUllL2JvQVYzYzAv?=
 =?utf-8?B?RitjMXlleHBRR2V6aGIzUHJwZ1V2cHJLdWRZRnp5aDgrVkIwRGlSNDFPQWxP?=
 =?utf-8?B?L0sxL3V4NzMwek0xM1RXbUpxWjVjSHcvdytuRjQ3TW5rL3RvOTUzZ3J1NHBi?=
 =?utf-8?B?Q3h6dHkyUEpUYXYyZkVIUFpTbjNHaXZOY2JaWlFoSVdtbXhJLzIydkIxenF3?=
 =?utf-8?B?ZHBYOEl1aWxlZ3paYitxZlBTSmFuOG1JMmJmZk4wNWtkdDUvQTFrV3JFbzFL?=
 =?utf-8?B?QlBLOWFuL290Um9JeTExbDFlQXNEby9HRlpEWERwbWJ1ZFh0TU91MWFOeC84?=
 =?utf-8?B?RTJ3Ui9GRGlVZDhWbFM3Undnald6TjNLZDlIb2pUSTNkbHhqaU5UclNEZ3V6?=
 =?utf-8?B?dDNYUWhmZTZHN3doWXVVb0V2a2h3UkhvczhZbWRkR2NWYzNORDNiZW0rWmZG?=
 =?utf-8?B?T3ZxZXNPeWVkNlNxNFhRTGViZGxQak0yTnhPRGZ3Z3V4bDVuL0tZK2t6Q2cv?=
 =?utf-8?B?c25EOFJiaTZsN1hZUXIrVjc4TGNBWUhCbHZuOGpGNSs3VnBaVjdCK1JFQkoz?=
 =?utf-8?B?dXpXbE14TktrVDkrYjZDYnlMc3lQNVpYR05UdEZZbitFQ1I0Ymw1cVViQ2hO?=
 =?utf-8?B?QzJLY3lSMXFhZjUrcUVJU3BqQzFOb0hIRUtQaXh3dTNpQVpaaWVJdGJHYkp3?=
 =?utf-8?B?cHNmSEYzSXRsQ2x6dk0vaXQ0dWhSSnlIbkF2NzFVZ0FmNjFKWlliL1YyTlND?=
 =?utf-8?B?YndtM0gzU09wcWd1bWp4QitRRUd5M1I4ZDQ1RUo3dldJSWV5TTM2dmRsRXZr?=
 =?utf-8?B?S2wzekoxRng2VTBpaEZ2NmM5L0FONiszRC8xd2JGdEt2ZEJLbnRWSlgyTStY?=
 =?utf-8?B?aUxKT1ZZdjB6aENCTXVkNjYvWmYzUTRKQm9JbCtURXhDQ1VCTS81N0hzRjRz?=
 =?utf-8?B?S2JnMXBLa3JHc3gxZ0xNL2dKamh5SkhRYTA2L29ZZkJ6bkxMK1ZoTFRqOEhI?=
 =?utf-8?B?RXcwTnEvYk14L2k0K0ZSZ3ZNcjhLUndqK3dnaXRFeWVPaWdCejdmY2R2SjlZ?=
 =?utf-8?B?by80UnF2K2ZXckhwdWNpdUdEQkNoeDVUSUtRLzhDZG5LYUNzUGthR3ZXU21r?=
 =?utf-8?B?d1hDaWFWVm0wYlFLUmR1MkNhY2o0YnJLeFN6QWpxOHdHeU52d3lFbzBJckVl?=
 =?utf-8?B?Y1orUUJZYlFGaEJCbmVBZjduaGZEbml1L25vN2JQa052dksxamlSMkEyME5z?=
 =?utf-8?B?K1ZmZUFMZkF0c0dIbzNhcm9qakUwU3NOTTRaTTRINUl0bFlhdGtRSW0xbmUz?=
 =?utf-8?B?ajFaZEFQTktQZFZndFAyeUNUdjZGM1I5ejZBSHZ1QlVqZ0YxdlZOSWp3WmF2?=
 =?utf-8?B?K29vYVpwN2pIOVJtRUx0dnZtM0xkTUhQTjI2YTZITWZ6K2pVZ1pkSGU5RkR5?=
 =?utf-8?B?S21GdWljbnBLTjFrdkExUGlnTGdid3J6bWk0Q05VQ3FsTDZ3RzNIYUorQTJh?=
 =?utf-8?B?MGZMK3ZtRzR1QXdWQlc1KzFLT1ViWXhIQWJWSDlmeTFlNGtVeGo2K2cwbndB?=
 =?utf-8?B?RHNDanVUZEdVSitaVVVHVkkyWTNJOW1TczFVT05hM3lKaVVQb1lkTnVjOUpm?=
 =?utf-8?B?Y3RXYXZBWWhJVWVaaDllSVppaDd1amFJVXR1cXRPVnZIU2VsS0FKeTBlT1pj?=
 =?utf-8?B?b1dURjk2UjhORlVyZDQycXNxb2FFOThTNkUwbmF6OWNueHNZQ0krcXY2MEFp?=
 =?utf-8?B?d3NoL3l0UEFBZUJ1bG0vZi90U0dBUDI4ckxtUE9iRUNIanJHTmlxYnJFa1JZ?=
 =?utf-8?B?RFZkQlhXUm1nR0NHWDgxempoL0h0N1gvZ212WWcyYnBnNXhBeW5FSmhhUzUy?=
 =?utf-8?Q?zzQFAKi7lj4R/aF+MoOhb8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c4d455-b98a-4087-b59a-08de3d3b1459
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:08:29.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+IPJYgWiSaS+kKT5D+k7J9q3U9AGJxTonqHZrl3fEIrXdnZr+uASygzVXe2UjWcfd18FxrDFYYNEYyzy5sXlB3Ol3rnmCUUJTYOL1NxWJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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



On 12/17/2025 10:04 AM, Xin Wang wrote:
> This allows IGT to query the exact IP version for xe platforms.
>
> Key changes:
> - Add xe_device_ipver field to xe_device structure
> - set the graphics versions based on the GMD_ID
> - Cache device ipver in global map indexed by devid for efficient lookup
> - Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
> - Clean up cached device ipver when xe_device is released
>
> V2:
> - add new struct xe_device_ipver to hold the ipver info
> - separate cache map to eliminate collision (Roper, Matthew D)
> - changed function name to xe_ipver_cache_lookup() to avoid
>    confusion (Roper, Matthew D)
>
> V3:
> - optimize the coding style. (Summers, Stuart)
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>

Regards,
Ravi Kumar V
> ---
>   lib/intel_chipset.h |  6 +++++
>   lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
>   lib/xe/xe_query.h   |  4 ++++
>   3 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index cc2225110..424811f7c 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -100,6 +100,12 @@ struct intel_device_info {
>   	const char *codename;
>   };
>   
> +struct xe_device_ipver {
> +	uint32_t devid;
> +	uint16_t graphics_ver;
> +	uint16_t graphics_rel;
> +};
> +
>   const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
>   
>   const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 981d76948..823a29f2d 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -210,6 +210,22 @@ static struct xe_device_cache {
>   	struct igt_map *map;
>   } cache;
>   
> +static struct xe_ipver_cache {
> +	pthread_mutex_t mutex;
> +	struct igt_map *map;
> +} xe_ipver;
> +
> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
> +{
> +	struct xe_device_ipver *ipver;
> +
> +	pthread_mutex_lock(&xe_ipver.mutex);
> +	ipver = igt_map_search(xe_ipver.map, &devid);
> +	pthread_mutex_unlock(&xe_ipver.mutex);
> +
> +	return ipver;
> +}
> +
>   static struct xe_device *find_in_cache_unlocked(int fd)
>   {
>   	return igt_map_search(cache.map, &fd);
> @@ -270,6 +286,24 @@ struct xe_device *xe_device_get(int fd)
>   	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>   		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
>   
> +	/*
> +	 * Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
> +	 * We should use the hardcoded value for the non-GMD_ID platforms (ip_ver_major == 0)
> +	 */
> +	xe_dev->ipver.devid = 0;
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
> +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> +			xe_dev->ipver.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
> +			xe_dev->ipver.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
> +			xe_dev->ipver.devid = xe_dev->dev_id;
> +			break;
> +		}
> +	}
> +
>   	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
>   	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>   		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> @@ -304,6 +338,11 @@ struct xe_device *xe_device_get(int fd)
>   	prev = find_in_cache_unlocked(fd);
>   	if (!prev) {
>   		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> +		if (xe_dev->ipver.devid) {
> +			pthread_mutex_lock(&xe_ipver.mutex);
> +			igt_map_insert(xe_ipver.map, &xe_dev->ipver.devid, &xe_dev->ipver);
> +			pthread_mutex_unlock(&xe_ipver.mutex);
> +		}
>   	} else {
>   		xe_device_free(xe_dev);
>   		xe_dev = prev;
> @@ -315,7 +354,15 @@ struct xe_device *xe_device_get(int fd)
>   
>   static void delete_in_cache(struct igt_map_entry *entry)
>   {
> -	xe_device_free((struct xe_device *)entry->data);
> +	struct xe_device *xe_dev = (struct xe_device *)entry->data;
> +
> +	if (xe_dev->ipver.devid) {
> +		pthread_mutex_lock(&xe_ipver.mutex);
> +		igt_map_remove(xe_ipver.map, &xe_dev->ipver.devid, NULL);
> +		pthread_mutex_unlock(&xe_ipver.mutex);
> +	}
> +
> +	xe_device_free(xe_dev);
>   }
>   
>   /**
> @@ -365,13 +412,18 @@ static void xe_device_destroy_cache(void)
>   	pthread_mutex_lock(&cache.cache_mutex);
>   	igt_map_destroy(cache.map, delete_in_cache);
>   	pthread_mutex_unlock(&cache.cache_mutex);
> +	pthread_mutex_lock(&xe_ipver.mutex);
> +	igt_map_destroy(xe_ipver.map, NULL);
> +	pthread_mutex_unlock(&xe_ipver.mutex);
>   }
>   
>   static void xe_device_cache_init(void)
>   {
>   	pthread_mutex_init(&cache.cache_mutex, NULL);
> +	pthread_mutex_init(&xe_ipver.mutex, NULL);
>   	xe_device_destroy_cache();
>   	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> +	xe_ipver.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>   }
>   
>   #define xe_dev_FN(_NAME, _FIELD, _TYPE) \
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index d7a9f95f9..19690cff3 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -74,6 +74,9 @@ struct xe_device {
>   
>   	/** @dev_id: Device id of xe device */
>   	uint16_t dev_id;
> +
> +	/** @ipver: Device ip version */
> +	struct xe_device_ipver ipver;
>   };
>   
>   #define xe_for_each_engine(__fd, __hwe) \
> @@ -181,6 +184,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
>   }
>   
>   struct xe_device *xe_device_get(int fd);
> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
>   void xe_device_put(int fd);
>   
>   int xe_query_eu_count(int fd, int gt);

