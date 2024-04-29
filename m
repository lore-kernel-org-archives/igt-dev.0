Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE8C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 12:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8417A10E174;
	Mon, 29 Apr 2024 12:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtypAI1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD0C10E699
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714394278; x=1745930278;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0/FoYIqAdKaOWNp9kIZHYN4/56aAKPj9tI6lCaufFac=;
 b=DtypAI1wBQRmdSm1LFZ2641/IrO3J+UXJlvwSzBwJSvNNKcvnKQyA6jq
 D10QTIToPaf0ejIny/KiYp1te+azcr+WEKnWxBuDFbSWVLUHWCHA2Snuw
 3n6llXjh9LzS84oFBB9Hpm7WE8XMT/TQfnscs34nMmxhVnkCv5kTpjAd2
 opMGhTTkhqQwae0aOF61J4+LEvXPAeSoxePJEHW9f7RXQJmWfr62xJNfa
 tcdM0LkpAYRL3tn60IC/lzjxcF7Wn65ynVT6DrQA/qXGCCT/jvBKlqf1e
 uviUHwqaYBnB1swiE9wtmJyGtDjHdZkRahidx9QKIFc3S/9pp8D9A/AGY A==;
X-CSE-ConnectionGUID: I8TASsy5QVejI1u4rZhkVw==
X-CSE-MsgGUID: VUij7xB9R468KTnJjJ0qUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12983956"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="12983956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:37:57 -0700
X-CSE-ConnectionGUID: owbVk6AAQIm1qWmNVjeCdw==
X-CSE-MsgGUID: qjnibjyzRjmxBqExbHSCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26605621"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 05:37:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:37:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:37:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 05:37:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 05:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPtYUMx8528vSi7d+mrUsYrMHppBztvX3Uv/G1VZLJbRKC5vT5U1KAbCPtckl80Ylgcl8LlZDGQrs4InpICOPHJrwWUWVFzBHhz5Feh1qowBZCO/mb1RK5nF5LJNACp06mWDwBL31dmZOSItxDeQmH6pe7+LAZ6UOA8+Y7jB4MvpuGz6wPReUGghPfQEYuCwAJjjd1hMc+tJuAKvYr6IIHCEf8skC28gLxjynmutc1MjH5zNisq4xDqThlGN14dP/RTrIz6kAGHRmJWGFAn8nqQ8mM3PLR+jXIhU7hy1cY1QpAf29ExmzOws8rXBP9FgvF02Kh477r1pUV/g4X+xVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/FoYIqAdKaOWNp9kIZHYN4/56aAKPj9tI6lCaufFac=;
 b=QUYbwKOQJ9inX2XUfrQquLXG2olAdrOqg7OPUMy3aN8EjkzDdMvZXHPtrYs5mLCCQF4wdJJfQho0VIoCLYbkI5hb6kSzASXkRYbwGXu/wngIXoMyJT8B7kpXgRiTYO9scWLRAtb0ki33xqnW1s+QHNj8So7mcyNRDGLlaTOaHnTw72i88J5j7fD+R/0HkPATrzkEsE+CjXyqHIa18+5qGYSnMRCsb2leE5/ryUdRL1CUZHu+RK9vOGIMuNHMI0CXWZuKKhvfERfh72gJsBqKilOA/4BZhssBNXJeNOd2w5xwSTbru2gD/0/M/+eH9pUmi6zfPzlHjohLlRhMVx4aqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 12:37:52 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::1124:dd10:9706:3784]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::1124:dd10:9706:3784%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 12:37:52 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 1/4] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
Thread-Topic: [PATCH 1/4] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
Thread-Index: AQHami4Af7nes/Ni7k64hpzGFG9TxLF/L7kA
Date: Mon, 29 Apr 2024 12:37:52 +0000
Message-ID: <9f77a7c9b73024327d3ac43895554a5c328e2d42.camel@intel.com>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
 <20240429-iga64_inline_ups-v1-1-2e9ac46cf6ba@intel.com>
In-Reply-To: <20240429-iga64_inline_ups-v1-1-2e9ac46cf6ba@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CY5PR11MB6305:EE_
x-ms-office365-filtering-correlation-id: 0d285e0c-8f99-460f-a3ef-08dc68492fe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?N29ndndmVFo1SUoyK3FveHZjSTFGM3UvYVVVWUtMTjBkSVNuN2JBU2FJbWMy?=
 =?utf-8?B?bk9YNENoZ0Q4WWd2eWpaVDlPc000NmVKQVZFcnVGQ0lDTi9UdGd2d29ZK0tu?=
 =?utf-8?B?ZUZUcjRlaUdqdjdtL3NtWTVnSkVtYXRpMTJYcU5iMFBQYWs5L0JaV01DcVg1?=
 =?utf-8?B?SGZ1WEsrQ1BSTVN3MHNiWXRvdFJVbm4zODd5QjBwYktzUEk5L3hjVjI2S0E4?=
 =?utf-8?B?OE9CRjdPaEZxblBhTFJrYVlHdENoNWowWGdPRVpCMDZmN29LMjZiWGNBbkl4?=
 =?utf-8?B?YnJLR2FIS3h0S1FCRDUrdmxHSjBTRlUzUFZVZGxaM2txY2dZUzNDTG1GVWxN?=
 =?utf-8?B?dDQ0Zm1lTDVaYkd4SWJzNDVPWDdNV285NUpHRVNVelpsSks3Sy9kOTZwYmRz?=
 =?utf-8?B?NWVNc1l0US92UDZFa3g1MVUwdFcxMGFXbVVBZ2JkRFllVXdWS1VoUnpGRVFm?=
 =?utf-8?B?eldxa0dFaTdyNTBxZXRXdGtaRHM1NGtsb09vZXpuQXFEZEpRSkVHdmFmTVE3?=
 =?utf-8?B?YmZ5bkR4WndaL0NrOEI4QnY4ZU83Sjl3KzI2T0tNOGtJNi9yNEpsVDRia1Jo?=
 =?utf-8?B?MUdSdUpEdFRqZ0cvVjdRM3ZVY29aL1poZ0M1L21PSjcyZHBzaVcrTVRpSTM1?=
 =?utf-8?B?TUxYNEcvRHNiYzhyaG8rN1BHZ1E0c3MreTRJTkNvSG1POWp3cGF5RWRHc2ZM?=
 =?utf-8?B?YndZVmxaZHArUjVCd3c2THBoMHFiTnRvcU92NE9qRUp1cXg0V1pMU2Y5U3Vi?=
 =?utf-8?B?eFlHZHNYYmUwbTVkMjBPVndjaW9taE9DcEw1VVJOVkdUdFBKSlptaDZBNndQ?=
 =?utf-8?B?dkFyTTljM0dpQmdyQUw4SFpMckg4Z1NPYXBSQ2llcEhoblZ6bmc5eFFOcjZY?=
 =?utf-8?B?TTV3R215TU0wNlU0czNRTVBOeFJVM3BhRjVGSjJsU1NVYm9zb2srbEdmTHRo?=
 =?utf-8?B?WFhKZTgvV1JBWFVvT2R3RDYxenYrU3hwRVRQck43TjRZSVJFb0hPczBDVEFH?=
 =?utf-8?B?NGIwYjBZQ3c2YithNDY4VlNBLzFwMlBwWndLZDJ1QVZjR2xpaDlac2FxaEEr?=
 =?utf-8?B?TS9zTUtoKzZZNnROVk16SkFpbkUwZUY3bjBOMFExRjN0Z2M4WTNNNStzb3Q0?=
 =?utf-8?B?OU9GZzFzc29LakJzTi9ubFMwUXBBRll3UWRZdWt4VFBlVlVVNk90Z3paQU5s?=
 =?utf-8?B?ZEZXN1VGYzY4SG5qbkxZQllZMm5kSEtUSllhaWhsNHl1aU5HR290R2w1azJT?=
 =?utf-8?B?MW5lSEZmdlJjWkk1cHVGS1c0cndrK0JJQU50dytKV0prRjZYdXdOUnRyZSs4?=
 =?utf-8?B?MUUrYS9jTDI3UmtkZjNUaVRxSmxkV2Fuc0xnWjR4TXo5UFRmZTNrSTdlZjBY?=
 =?utf-8?B?TVZHeFdZaUJCREQyYk9FRUJHcGNGY3p5bFVyR1JoZ1NHVDZXQlNXZnJWYjEz?=
 =?utf-8?B?NVVySUpTdFZaNzZlakxFcDdoUlBlNHU1Yzk2cWRvV0hkaitSREhIclZyZmZ3?=
 =?utf-8?B?aWU0YXhrOENFYjhYVVdsa0tBWndmT3VoUmRzOWd4NFp2Ykw4T2M5WGJhS1NK?=
 =?utf-8?B?WWh0Zkltd2NvSWNjd0IrN2lQZm9VOG5XNGFJK1hHUlE5RUREcEdQM2EvZFRu?=
 =?utf-8?B?UEEwWWJ3eGE4Um5DN2cwQnQ3a2ZKSW16OUNLbXBoOWRicnEySERyZDluMmpJ?=
 =?utf-8?B?U0ViOUFGYTRKNUMyNUwwYzlJRVRyYmhRLzN1YUN5b2pmZVUzK3BSWDA4dGtp?=
 =?utf-8?B?S1VGOVEzTjUyVXhBYVZLaU5vbXdtUmdVV1gzZVdEV2YxQXV5eFJtNGdDQ3FQ?=
 =?utf-8?B?TlJYQkR6VDJhOU5QU0Rodz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3dVRmFUTXlHeU5hVTVERUJSNGNuTW02cmoyczJoc0NOVUlHYitJN1UxSDdE?=
 =?utf-8?B?L0YrZ3lCbWtRWW5ESENGMkxrRmhZN0NXZjU2UEQzeUhCc2VkMHpuWERzaEpa?=
 =?utf-8?B?bElvQ3FkTWFOV3NlNGpkYXFoVkRiQjBiUVcrYXFsYkJkRDBBRlNLbWJkVmxQ?=
 =?utf-8?B?bzdRZUV5MGF5SVExRHJvWkx5YnduaUY4RU56NXNMdWYyS2FUL1hTb2psTTZC?=
 =?utf-8?B?c3hpVEE4Y2lvMFZ5aXJsNFJuWmZFK285MGpYclZGajRHSlZYMU9OaVk4RzFw?=
 =?utf-8?B?b05kNW1vZmptRjl2QjVjWTFmU3F6SjFLZkx1YWcrTURjL3daa2dXcXd3K29u?=
 =?utf-8?B?U1lvdjhDYm9Qblk1ajF1Kzlpb0xxZlpkbU5mWTVrb0RyMmJ2NEt6U3AzVjJQ?=
 =?utf-8?B?OVdBRGVrQ2YyVjhBRnRaMWg0TUxucUFZVmVpV3Myemg2aDBUajNucm9kY0pH?=
 =?utf-8?B?M0k4ZGRyTmRydlliS1k5YWRKT01XcVh6YW1hS2F2WERaTmZRNExsd1pVME1W?=
 =?utf-8?B?WHN2WVRSL08zRzZPOVRrYU5tSUZodktKNnFLRU1xTnloQmVVRWJrbDFQcnQr?=
 =?utf-8?B?c0lOM3ZUQzRtSlBWMU9UMWl5VmlMK0R3YVFmV1dMM0xuTmFmd1N3NXBCSnh0?=
 =?utf-8?B?emVaZmdDV3NZTGdTUVpTdXVQdWlLMktCY3RwSDZkVk1tQzMzUWRtWnlPUzJH?=
 =?utf-8?B?UDJWRVU1WmRJQWY3TTJCK2g0Um9rZVVDZmllamwvUk5WbVNmbzEzaUNuM3VR?=
 =?utf-8?B?VElVRE1NQWZ0a1VIUUQ0MUVSaUVMTTlMQWc0K0IzZSswemtPeE5Xb1VrdkRx?=
 =?utf-8?B?Z0hTSHdjc1d5M3lRcWgzMFJUL0ZWWGFVb0Y1c2dLV2h1Ync3STFhZWhabUU4?=
 =?utf-8?B?S1FwZE1MWmlPdERsTFRyemlGM3dsWjNES0dydlJQZ3pDYmxYa0NTRXc3MUR0?=
 =?utf-8?B?N0szQ1BnZVpCRDFaT2ZaSHRoR1U3djgzQUYxODE2Ymx2UjJZa0p6ZW9GYmtR?=
 =?utf-8?B?Tk9aMW01a3NoNFBlUVpaWVRURHlzTTU0aGU5TlpBSVBqZStNS1NOWTBLVlBk?=
 =?utf-8?B?bXRpSTV1ZnYwYnAyQ0Rmbkk2cjBmMVhzVHMzMUtKbWNELzBLa3Q0RUZ5MDQ5?=
 =?utf-8?B?ekc2OHRadXV0cEpwcHF5bDVCYlZVM1pRcEh3WE9kdkhWcmVLUnltbWxmL2I1?=
 =?utf-8?B?eXJvL3QvWGk1MlpSY1pyYTRhZzUyTUVyWTd6b1dWODI3RlVRd3NKQWVudVN0?=
 =?utf-8?B?NTIvTkYraW5uMnhhMEFDeGRyS0ZjUGdwK2QwdnNRRk13VG5rSUJUd1NVWjZD?=
 =?utf-8?B?eSt5RnBiL0EvRGpSSzNBNWlkSHVqL0JYZXNTcmdRSEtQZldiRlBHUVpISWVk?=
 =?utf-8?B?dWF2bk5TWmFiUGNvOFRVdTVxakQyYUFrSk1teFJseWZkNnhXdlYvbDVyTXFQ?=
 =?utf-8?B?Z3NUVVVObEhucUFXT0JkUHg1amNSVVZuZ2Y0c3hvdkpvN3RLajg3WElmRGxq?=
 =?utf-8?B?T1RUSDlCWXJkNzJqQnJycXYwZ0pjMFNWdUJLSm5QT1pwMkJlUU0rYjkzQUdK?=
 =?utf-8?B?S0tTN1gvZzNzSTlKRjBObVQwNTFiYWJoaUlCRWJna2RUbEZnbE5XTmZkTURp?=
 =?utf-8?B?Qm93MUw1QmV0YytLZ0RDNmxSK29LTHBPQUZia0NRL0FyYjNaY0tnd0NZd0tn?=
 =?utf-8?B?Nk1hOVQrcFpnczJEZjE1Wm9vTkMvcEt4ZWRCOFltR1RKbExGeklFUWxSSlJE?=
 =?utf-8?B?aktGTHRLSFJIckJHeTlqWVFXbm5STVZVU2VpWEtTTDZPdlVNQXQ4emIwZk1X?=
 =?utf-8?B?alBpOUFsT2NaaDZaMjM1Wkc3WERFZWlYYkpoZ1RTOU9YUHFNYzU0eHFOQmo2?=
 =?utf-8?B?R01Ic28rT1RNUEp6ajZ2VWorUlkwa3J3NVlrQnNlbXN2NDJiL2dCb3hZU2FL?=
 =?utf-8?B?clhieXJpSXhYb2NpazF3azJybHB0S2VMNnc2TTh4RXZqa3pCNmF3Z0xzMDJ4?=
 =?utf-8?B?bGVGdUlzRXJsd084U2R1TThjbGl2VXd0bVNSem5STTl2MjJmblJRTWJBSVVv?=
 =?utf-8?B?U0JrVHNIdDhKWmtadTVJRDRrYm9GTEhET0hDZWRJMlN2RlFwWU1HOU1TNGZH?=
 =?utf-8?B?QnNodXh1SlNkU1NQOVNPbkEwVFpHdmxpOU9PTjVzNEpONkdnUlgxVERPa2s0?=
 =?utf-8?Q?rAyrDNbD2Mn3bGOePl9zbiM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9F3EB13FE74C4409D8633C3769B85DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d285e0c-8f99-460f-a3ef-08dc68492fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 12:37:52.4943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xwBEKiygvMT5qk5X05nlPx3pSGIcojvZgT9kQrvt2OtQXdpq+U4g70R8oyyP33kyXilly985JLhv2cbZUseALBVvYaJsI7oG2xKb7zE0zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
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

T24gTW9uLCAyMDI0LTA0LTI5IGF0IDE0OjA4ICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4N
Cg0KV2l0aCBzb21lIGNvbW1pdCBtYXNzYWdlIGV4cGxhaW5pbmcgdGhhdCBpdCBpcyBuZWVkZWQg
aW4gb3JkZXIgdG8gZGlzYWJsZSBFVSBmdXNpb24gaXQgaXM6DQoNClJldmlld2VkLWJ5OiBEb21p
bmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
bGliL2dwdV9jbWRzLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiAgbGli
L2dwdV9jbWRzLmggfCAgNiArKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvZ3B1X2NtZHMuYyBi
L2xpYi9ncHVfY21kcy5jDQo+IGluZGV4IGRhNDExMjFjZTk0NS4uYzczZDU2Y2MzZjhjIDEwMDY0
NA0KPiAtLS0gYS9saWIvZ3B1X2NtZHMuYw0KPiArKysgYi9saWIvZ3B1X2NtZHMuYw0KPiBAQCAt
NjUxLDEwICs2NTEsMTAgQEAgZ2VuN19lbWl0X3ZmZV9zdGF0ZShzdHJ1Y3QgaW50ZWxfYmIgKmli
YiwgdWludDMyX3QgdGhyZWFkcywNCj4gIAlpbnRlbF9iYl9vdXQoaWJiLCAwKTsNCj4gIH0NCj4g
IA0KPiAtdm9pZA0KPiAtZ2VuOF9lbWl0X3ZmZV9zdGF0ZShzdHJ1Y3QgaW50ZWxfYmIgKmliYiwg
dWludDMyX3QgdGhyZWFkcywNCj4gLQkJICAgIHVpbnQzMl90IHVyYl9lbnRyaWVzLCB1aW50MzJf
dCB1cmJfc2l6ZSwNCj4gLQkJICAgIHVpbnQzMl90IGN1cmJlX3NpemUpDQo+ICtzdGF0aWMgdm9p
ZA0KPiArX19nZW44X2VtaXRfdmZlX3N0YXRlKHN0cnVjdCBpbnRlbF9iYiAqaWJiLCB1aW50MzJf
dCB0aHJlYWRzLA0KPiArCQkgICAgICB1aW50MzJfdCB1cmJfZW50cmllcywgdWludDMyX3QgdXJi
X3NpemUsDQo+ICsJCSAgICAgIHVpbnQzMl90IGN1cmJlX3NpemUsIGJvb2wgbGVnYWN5X21vZGUp
DQo+ICB7DQo+ICAJaW50ZWxfYmJfb3V0KGliYiwgR0VON19NRURJQV9WRkVfU1RBVEUgfCAoOSAt
IDIpKTsNCj4gIA0KPiBAQCAtNjYyLDggKzY2Miw4IEBAIGdlbjhfZW1pdF92ZmVfc3RhdGUoc3Ry
dWN0IGludGVsX2JiICppYmIsIHVpbnQzMl90IHRocmVhZHMsDQo+ICAJaW50ZWxfYmJfb3V0KGli
YiwgMCk7DQo+ICAJaW50ZWxfYmJfb3V0KGliYiwgMCk7DQo+ICANCj4gLQkvKiBudW1iZXIgb2Yg
dGhyZWFkcyAmIHVyYiBlbnRyaWVzICovDQo+IC0JaW50ZWxfYmJfb3V0KGliYiwgdGhyZWFkcyA8
PCAxNiB8IHVyYl9lbnRyaWVzIDw8IDgpOw0KPiArCS8qIG51bWJlciBvZiB0aHJlYWRzICYgdXJi
IGVudHJpZXMgJiBldSBmdXNpb24gKi8NCj4gKwlpbnRlbF9iYl9vdXQoaWJiLCB0aHJlYWRzIDw8
IDE2IHwgdXJiX2VudHJpZXMgPDwgOCB8IGxlZ2FjeV9tb2RlIDw8IDYpOw0KPiAgDQo+ICAJaW50
ZWxfYmJfb3V0KGliYiwgMCk7DQo+ICANCj4gQEAgLTY3Niw2ICs2NzYsMTUgQEAgZ2VuOF9lbWl0
X3ZmZV9zdGF0ZShzdHJ1Y3QgaW50ZWxfYmIgKmliYiwgdWludDMyX3QgdGhyZWFkcywNCj4gIAlp
bnRlbF9iYl9vdXQoaWJiLCAwKTsNCj4gIH0NCj4gIA0KPiArdm9pZA0KPiArZ2VuOF9lbWl0X3Zm
ZV9zdGF0ZShzdHJ1Y3QgaW50ZWxfYmIgKmliYiwgdWludDMyX3QgdGhyZWFkcywNCj4gKwkJICAg
IHVpbnQzMl90IHVyYl9lbnRyaWVzLCB1aW50MzJfdCB1cmJfc2l6ZSwNCj4gKwkJICAgIHVpbnQz
Ml90IGN1cmJlX3NpemUpDQo+ICt7DQo+ICsJX19nZW44X2VtaXRfdmZlX3N0YXRlKGliYiwgdGhy
ZWFkcywgdXJiX2VudHJpZXMsIHVyYl9zaXplLCBjdXJiZV9zaXplLA0KPiArCQkJICAgICAgZmFs
c2UpOw0KPiArfQ0KPiArDQo+ICB2b2lkDQo+ICBnZW43X2VtaXRfY3VyYmVfbG9hZChzdHJ1Y3Qg
aW50ZWxfYmIgKmliYiwgdWludDMyX3QgY3VyYmVfYnVmZmVyKQ0KPiAgew0KPiBAQCAtODY0LDYg
Kzg3MywxNCBAQCBnZW43X2VtaXRfbWVkaWFfb2JqZWN0cyhzdHJ1Y3QgaW50ZWxfYmIgKmliYiwN
Cj4gIAkJCWdlbl9lbWl0X21lZGlhX29iamVjdChpYmIsIHggKyBpICogMTYsIHkgKyBqICogMTYp
Ow0KPiAgfQ0KPiAgDQo+ICt2b2lkIHhlbHBfZW1pdF92ZmVfc3RhdGUoc3RydWN0IGludGVsX2Ji
ICppYmIsIHVpbnQzMl90IHRocmVhZHMsDQo+ICsJCQkgdWludDMyX3QgdXJiX2VudHJpZXMsIHVp
bnQzMl90IHVyYl9zaXplLA0KPiArCQkJIHVpbnQzMl90IGN1cmJlX3NpemUsIGJvb2wgbGVnYWN5
X21vZGUpDQo+ICt7DQo+ICsJcmV0dXJuIF9fZ2VuOF9lbWl0X3ZmZV9zdGF0ZShpYmIsIHRocmVh
ZHMsIHVyYl9lbnRyaWVzLCB1cmJfc2l6ZSwNCj4gKwkJCQkgICAgIGN1cmJlX3NpemUsIGxlZ2Fj
eV9tb2RlKTsNCj4gK30NCj4gKw0KPiAgLyoNCj4gICAqIFhFSFANCj4gICAqLw0KPiBkaWZmIC0t
Z2l0IGEvbGliL2dwdV9jbWRzLmggYi9saWIvZ3B1X2NtZHMuaA0KPiBpbmRleCAzNDhjNmM5NDUz
ZTkuLjFiOTE1NmE4MGM3YyAxMDA2NDQNCj4gLS0tIGEvbGliL2dwdV9jbWRzLmgNCj4gKysrIGIv
bGliL2dwdV9jbWRzLmgNCj4gQEAgLTgxLDYgKzgxLDEyIEBAIHZvaWQNCj4gIGdlbjhfZW1pdF92
ZmVfc3RhdGUoc3RydWN0IGludGVsX2JiICppYmIsIHVpbnQzMl90IHRocmVhZHMsDQo+ICAJCSAg
ICB1aW50MzJfdCB1cmJfZW50cmllcywgdWludDMyX3QgdXJiX3NpemUsDQo+ICAJCSAgICB1aW50
MzJfdCBjdXJiZV9zaXplKTsNCj4gKw0KPiArdm9pZA0KPiAreGVscF9lbWl0X3ZmZV9zdGF0ZShz
dHJ1Y3QgaW50ZWxfYmIgKmliYiwgdWludDMyX3QgdGhyZWFkcywNCj4gKwkJICAgIHVpbnQzMl90
IHVyYl9lbnRyaWVzLCB1aW50MzJfdCB1cmJfc2l6ZSwNCj4gKwkJICAgIHVpbnQzMl90IGN1cmJl
X3NpemUsIGJvb2wgbGVnYWN5X21vZGUpOw0KPiArDQo+ICB2b2lkDQo+ICBnZW43X2VtaXRfY3Vy
YmVfbG9hZChzdHJ1Y3QgaW50ZWxfYmIgKmliYiwgdWludDMyX3QgY3VyYmVfYnVmZmVyKTsNCj4g
IA0KPiANCg0K
