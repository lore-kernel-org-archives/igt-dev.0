Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789BCC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 08:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77B10E198;
	Mon, 20 May 2024 08:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXCZmOvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F26D10E198
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716195122; x=1747731122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0U8nxxikEGKCoCqT8ULehEV5ye7YbUWMloSvr/iw/MI=;
 b=YXCZmOvBOoFZa4nPokXQBEiXHZxo/YlJ0A6n9YAGvB06qLXF+VZ5shfV
 PV2SvOUbsPiJYDb5EezCZTcXh3fb6qeyugu8nr8oPHm0UEf/07wXBzs3K
 5R/pLSjEqpjgUFiWbIbbX0YgweSnycHgzB+hRvmN94hcR/mcEezFagIgY
 5HFicmRmaSBeqzHUoa8mobetPYCOrcf097fTbBkFnVEhaNdYC/CdoanUj
 QPiXe0gUJVRXQXOqkleXkBQk5vukik/6iKPEi+KCOvHy59fEUsDUXECsD
 71Beku95yn2GHY61AsvRWCc35n6Gjjppo9C+1ynWjJb5Nfa007uGC6dLB g==;
X-CSE-ConnectionGUID: jHqpqt1eTXuDgn8UhPIE1A==
X-CSE-MsgGUID: HOSKFSbKS6auEnZYEtg01A==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12109086"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12109086"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 01:52:02 -0700
X-CSE-ConnectionGUID: KN2Ra2tkTb+JbBZwip5l6g==
X-CSE-MsgGUID: /HoqZ12dQz64jDw+sUrwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63689364"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 01:52:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 01:52:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 01:52:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 01:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4E8+2WEnYWEfd5WyJyFlOs6Ta6130q/rSLgIBYrv8VpzB4E6vLFd8CHB3buk0ZhND6fh3vRv/7G+iwyvJTsEMVSvPHco2d2zXOODZ+SPzeZ2oEL6ydVX60YHZ6qAtx/iHYKTuE23hCBt66iB1XVGN2+TIzC1nGkvn67xan/6kXahLPuYJAhqcCWxvElS75hzQa6X8K2oMskgeZb86YwK+TM23bZ1Q2nqkY72NsEqDTeueLWhAyYXrJqe8jqbJ0RI1jguPHo7OM0AygEhxZnhJwzOp28bujYp29CnagWrpwE+AgIaKThaneL72UDtLENqXRQXTRSN1MTGAn0Lr6vYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U8nxxikEGKCoCqT8ULehEV5ye7YbUWMloSvr/iw/MI=;
 b=M8ixt+cNKtdt3PkgjXk1RHokCD4RZUS/DhczrkTw2JzROvKmdyWxjujHkOt2jVJkeUVHwFrh2tEEA285aGqhzuNSFOAjodBQeVrW9VlGsvKWEb8koQ1PO5FT+DrTIIjI16nPQIsPAzy6Otad/L4GoANtdDo9245vnZp3+l6MRDe/NqyIHCey4J2lGJuYYdA6bqnbVEriQfM8eRb9XWwsXQm9kx3PRD7P8oR1LLH0GxATgx0zNJOv3gSEuYC4kvPy83cdpSs7JXxtcBLaZHR+fyKFevLXr/hWuKSJL/Wu3t3TM4sBoxGJ2ROuKODgJe3US2QbOzzeFErHl/nGj6Ue1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH7PR11MB5960.namprd11.prod.outlook.com (2603:10b6:510:1e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:51:59 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 08:51:59 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 02/10] tests/intel/xe_svm: basic xe-basic test
Thread-Topic: [PATCH i-g-t v3 02/10] tests/intel/xe_svm: basic xe-basic test
Thread-Index: AQHaqE/p7Hb16dOc5kKbiXgsY1KYb7Gbev2AgARZg7A=
Date: Mon, 20 May 2024 08:51:58 +0000
Message-ID: <IA1PR11MB6097DEC2A1D045C5036DB27086E92@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-3-krishnaiah.bommu@intel.com>
 <SA1PR11MB6991D36936EC476EE0140DA592EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB6991D36936EC476EE0140DA592EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH7PR11MB5960:EE_
x-ms-office365-filtering-correlation-id: d5dc2d46-9498-4ead-b7cc-08dc78aa1c06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Y0o0cnQ5cWdOc1lMMllmMWY0bk9PdS8wVjZyVGJjS3M4dGM2MXlTQ2ZRWGRS?=
 =?utf-8?B?cW4rUmdlNHNrYUoxUHpxVi9jQWZqaFNxKzR5MXIxTnk4SmRQb1lIdWY2U0ZW?=
 =?utf-8?B?bjRUV1F1aVg2UFRGSDVKM25rSU1BdFcwS0ZranEzUEp3S25tSFpyMFRranZy?=
 =?utf-8?B?SVZvK0xCTVFITU5OZ0cvaCtQVlBBNkMzQ3FmNzE3cTR6YjZ5VEIxd3dTNWc3?=
 =?utf-8?B?WjQ3ZjJnN0tBcjlsRGZXYXp2d01Ca3Z1MzNibEhPUUhQbWp3ODkycVFqYUpi?=
 =?utf-8?B?UDNXbmtMUTBQWEpUQ0t1c2ExeDZNb3lKWEZtVGtZQlBKbkJKLzdVeVpCODFC?=
 =?utf-8?B?SWdiWGR5OVNyZTlJVkRNbHRkd2ZvdDBiUUUrWVpxdTRlTk9BUE5KUVNMUlBH?=
 =?utf-8?B?NTZVbWNNSXRBNW5ROXR4ZHQvMEFaakM2WkFyeFdLeDZRSm82QnNIQ1dNakhX?=
 =?utf-8?B?RjhEQ1FxQ2IxcUtvTDBDdUx1NXloK0I1S0tINDlpM1ZYdzJYYmRsQWwwdzFE?=
 =?utf-8?B?ZkVjeDQrWnhYSHllSXBQL0VLVk9zOFVRS1VKTHpMNGs1WmQ1SUl2WEo2U1h5?=
 =?utf-8?B?aVpZU09RamtyTkhZSkpiRWhBQTltUnNmbVJnZGh3Zk91dTlZSFY2d2NBQ0ZL?=
 =?utf-8?B?Q0draDAwR0x0TzFNYzZ1ZjJPMXYxR0NvdjVHVEpGWEtjSHNhZjNaeXBOSldZ?=
 =?utf-8?B?TDlkTEhqUC9Hc2pKYzZrV3VJZ0krSTBLLzdGTGV0WGFWcE03OTdVc3NRaG02?=
 =?utf-8?B?ZTY2bXN5YkFrbVRldEc5Z2xJZWdIZDZDa05rejhRbEdtNEdRY3lJOUcwendJ?=
 =?utf-8?B?Vlhidk56QXU5ZTZUWXBvSUFXUWRvV2FMWWpOVlNzTXNBY05Mdks3VG5FVW4x?=
 =?utf-8?B?bTlHcUJ0NktNc2x0QlJJQ3hyTjdrUTBqYVUwQ1VIZmF1U3BPdUNQeFMrZ3JU?=
 =?utf-8?B?bW0rRWYybEJqSUxLcEo5NmxnVi80MzdITGV1enhNWnFxYmR5Y0NiUVlSdDRG?=
 =?utf-8?B?VWZZNWlhNjRFemxrZVZUSzI0UVFqampLY2hCa09QM0JpdHdJWmw5VWljdGtj?=
 =?utf-8?B?cWh1cjAvYlUrbmE3dEI5QWc0TkxPajBURFk3OVBHamo3azdReUtFcFdFd2Ix?=
 =?utf-8?B?d3g2eUJGVmhFY0lHZjJKdXFqdEdnNVg2OTRocXVRRXYyeWRsK3crZXhEOU8w?=
 =?utf-8?B?eXhobUFxSEs3TTFXajhIdHFTb05nTnB3YWloelZrekVyVmtQajU4Vk9meXpE?=
 =?utf-8?B?WDQwTEN3OVQyQkJRTWpNVjRpckFucUk4MjBQc2JhdEs0UldSMEV0Sko0SnQr?=
 =?utf-8?B?WFhPdUtBbWpNTFZ2OFVvNFdTMzFSd1VXUjh2QXFMMi9WUUdFc3Rzdk1nRHdE?=
 =?utf-8?B?dlVwa2dVSVdWbUxOZjdnaDdRc0M1TTRZRWRBNUlVekdTZ2ZxNGp6VytHYnpE?=
 =?utf-8?B?RVU5ajN6M2FYRU1GYUdUenp3QnNDUE5rL3l1b3NMRGpXMjR4bmROUkJiNjU1?=
 =?utf-8?B?aTNxbzdaNE9kbkZCTEhJbXVUaEJEUTNQMVlQWDZlT2NqTXBJaDA5MEVXUlNW?=
 =?utf-8?B?N2xUNUdTOWJYQUw1WWxxQ3VLc2hqdGlST09SNm8vc1U4OEZxUSt3UGh5Z2Zy?=
 =?utf-8?B?a0E4eTMwaE5GV0t5d2t1NjhpVnllUE0xSzkvRlNpcUVXLzB4NElOVGFIVGZO?=
 =?utf-8?B?c2RGK2FhYi9sM1lBQTZ0NjRNMXBqZGN2ZE9abWhNNzdpb0pSODlVRHBTZ21X?=
 =?utf-8?B?MEVmNnNQOUFDWGdLVjZHNnBxWkFMV2Z2VjlqYWRpYmFxM0FCNXcrNzhtcFEy?=
 =?utf-8?B?SzVSdWN3NEE5cmRqR2xwUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cklIMEg4dU1tK245dDNXOGlFd3NKNHNkSG9zcmY2bWpVOElhc0xFbHduUkRK?=
 =?utf-8?B?Yk5nZVlqY0lGdnd2QzdRV2F2cm1QYVJJOTRMRXc1TzlmbjByc3VTeTd0bll2?=
 =?utf-8?B?Qk40K3FvTkZlZkRjOTZuTEJtS1d4Mmp1SlVBcFJ1d3lFT09xRlgreWtvbHFW?=
 =?utf-8?B?dUpMNmx2RUtRVEpkZnJGZGJwS0ZxMEd6K3ZaaE1GVEhEb3pBSmp5aGRXTDFx?=
 =?utf-8?B?ZXpwVi9WNkR4TTJOV1RDb2FxYXZacnNtMXFDYmVOQzJidW1SeWJlZlRVdDNF?=
 =?utf-8?B?YUg0ZzNCT09MSG44OFZRQUQ3V1k0d1gyS0h5LytteWc3THFEdHBCSjNEaE82?=
 =?utf-8?B?K2RmUmsyZjdaRkcxVVdJUWRaNnhjYnByU1NIMFZTbllHWnl3TGJIcHlJY3hE?=
 =?utf-8?B?MktuOUNBbmRFYUh3azkwZVVyK2pzMi8vVWRhZHY5djAybmZzSm84Z1NJeVlR?=
 =?utf-8?B?cS8yMmdVYS9YaTMrdGxqMjV2L0ZlSlVmRnkvcU5RSndXbW9BeXlyS3pLK2RS?=
 =?utf-8?B?ZGNEUERRTGpEaDRzdmovM0xRbFZrT3lLNXlhUTg1OWVzSmswdEVReWY2ZCt2?=
 =?utf-8?B?a01kb2VsU041OTl0WXl3ZlRTM0RyVVB1TmplOXk0TVdReWhtZEVxaVJIejhX?=
 =?utf-8?B?Z2dxeUlvblVhZ1cwQ3A5OUlQVS94U3pUVjVCSkV6SmF6d0xWYlRmSUsxVXR2?=
 =?utf-8?B?cUJBNVVQSHdkdHhvbTNiWTkwSmRSeXk5Zjh2VjU4T1JmSzJXS0lKK1VBV01l?=
 =?utf-8?B?aGRaMzBqZThRd0Mva1htV2p0OTAySGZSb3ptYjZZWFVEbXhVMmliU1VOYTZ2?=
 =?utf-8?B?bnNhVTNqekU1RXRXWWxaeXYzZWFzcVRZMlhKQ282T05hQUErVCtJNEE4WWFJ?=
 =?utf-8?B?QXd1YjVXdVFMVVNjSmNyMC91Q0RLbnczU3NmeTRObkJvVjhtbS94a0EzakMr?=
 =?utf-8?B?d2I4M3Y3NmE2Q2lnOFh0NTdmenB3MG5ralRLVFJ5M0NHc0tlb3RwYlg4QTF4?=
 =?utf-8?B?Z1NDZ3JCQ0cxcExTUnJ5dU5EQVFtajBOSEs1R082Y2NVSHJMZUphT3MvYUFM?=
 =?utf-8?B?WUFHTStDT3JwdS9MZVVTYitmVE9sek0vem8xV01aRUhDam1KSnBNeU5ZWllL?=
 =?utf-8?B?WlR1aExUcmNXWjFwRWQwWGVvVjY1SmRIZk5DblZyQWdvaExVODRZUHlidXZG?=
 =?utf-8?B?ZVl4eWc4M0tTU0pGNzkvVWRneWM4QVBPNjdyV3lRWU9OVHdIeXh2cE9kaFBR?=
 =?utf-8?B?UHg1Y0xMVFUwUzEwZEI2RVphMkpsRHRXTWl0dVVwMDU2NDROeE9yL0NjdzU1?=
 =?utf-8?B?cG1wTEpPMUdoZVZhclUrdjFNTXFxcVk2a0oyQk1aK1pCcEtHY0h2ekhCOXFn?=
 =?utf-8?B?ZVBnZm5JYmNtNzh6d1U2VzVJdE9mTjA2OEhNalpaL0J6UVhkZ2h5bXJLUmtM?=
 =?utf-8?B?QUJ6L3FzaXBhbGw4S05wV3dSczliZmRzWUpTRG80OXJEdWZsOWdOZnhXOWFG?=
 =?utf-8?B?d2h1SEdsTVhGRzdOaXV0RkltcFAxd2JFRlRpdmg4Qmo0NnNYSlhLRGlWZEcx?=
 =?utf-8?B?WTBYV1F6T0VVRWtwUGNBdGdsYnFlTHUzdjZ3TG9zRzdqalpvWXdWNnlSdFBq?=
 =?utf-8?B?S3RHNDBLanB3bWU5WkFqMUlXOHJQS3FxT3hneDkyLzlaVWpvQnVaeXVtOGFv?=
 =?utf-8?B?ck1TdHdEcVd6Q1VYZUhZUTNQeW15dSsxeVZhSEJTd1RrMVpIUHZNSUlDWHVz?=
 =?utf-8?B?MXJ6TUtvQ0p1dFBEazNYc3JKaVhNaHpVWlY5ZUwvME54R1BZVzNxcTV5QWRR?=
 =?utf-8?B?cnRiTTc2eFFIaWNxNkZYUnBNM3NtbTVVY3EvWDJ1M09TTlF4QklXeWgrdHh4?=
 =?utf-8?B?N3ZScWZGcmx2SDBWcTQ3Ry9kZUtMK0pRNXZRYnlod2RWcjBZZFpranBEd1ZW?=
 =?utf-8?B?Z1dXb0UwdWhhZnQvblV4Q2FrSzhSZFJzcHFIK1ovVWhKK3lhOGJOY0w4L0pq?=
 =?utf-8?B?L1NTUGxOL2RQRVhIMDlyOU11d1k5VlZQWVFyWUJxS3NTUXcrZU9LbnZEYkdB?=
 =?utf-8?B?ejAxMXlQWmNtRmlpSS95OGM5bFpWbGtBR2FQQ0NhWE9oSkVEemhSdmRYVk1O?=
 =?utf-8?B?Ry9NRFBnazZBSWlCTmw3QjJMei9yUE9BRGFEMkVMdW9sWWtzeVl0Q25ib2VE?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dc2d46-9498-4ead-b7cc-08dc78aa1c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 08:51:58.9446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CTEDeeC64nP+ryTcsgmiv8WUrL4ky9Y0BF9XYIfIIH649bOYYH3Wv0bRCe4us7ZumrJ/Acj3AJQLqfc5sTMf2JYEELEN21gTHZEVafMhsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5960
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

SGVsbG8sDQpJIHNlZSByLWIgZm9yIHRoaXMgdGVzdCBhbmQgdGhhdCBpcyBvay4gQmVmb3JlIG1l
cmdpbmcgdGhpcyBzZXJpZXMgcGxlYXNlIG1ha2Ugc3VyZSB0aGF0IHlvdSBoYXZlIE1lZ2EgZmVh
dHVyZSBpbiB0ZXN0IGRvY3VtZW50YXRpb24gKGl0IHdhcyBhZGRlZCB0byBJR1QgdXBzdHJlYW0g
bGFzdCB3ZWVrKS4NClNvIGl0IHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPiArICog
VEVTVDogeGUtc3ZtDQo+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCBzaGFyZWQgdmlydHVhbCBtZW1v
cnkNCk1lZ2EgZmVhdHVyZTogR2VuZXJhbCBDb3JlIGZlYXR1cmVzDQpTdWItY2F0ZWdvcnk6IE1l
bW9yeSBtYW5hZ2VtZW50IHRlc3RzDQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBzdm0NCg0KVGhhbmtz
LA0KS2FzaWENCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWmVuZywgT2Fr
DQpTZW50OiBGcmlkYXksIE1heSAxNywgMjAyNCA0OjI0IFBNDQpUbzogQm9tbXUsIEtyaXNobmFp
YWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlA
aW50ZWwuY29tPg0KU3ViamVjdDogUkU6IFtQQVRDSCBpLWctdCB2MyAwMi8xMF0gdGVzdHMvaW50
ZWwveGVfc3ZtOiBiYXNpYyB4ZS1iYXNpYyB0ZXN0DQoNClJldmlld2VkLWJ5OiBPYWsgWmVuZyA8
b2FrLnplbmdAaW50ZWwuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEJvbW11LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gU2Vu
dDogRnJpZGF5LCBNYXkgMTcsIDIwMjQgNzo0NyBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IEJvbW11LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGlu
dGVsLmNvbT47IFplbmcsIE9hayANCj4gPG9hay56ZW5nQGludGVsLmNvbT47IEdoaW1pcmF5LCBI
aW1hbCBQcmFzYWQgDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggaS1nLXQgdjMgMDIvMTBdIHRlc3RzL2ludGVsL3hlX3N2bTogYmFzaWMgeGUt
YmFzaWMgDQo+IHRlc3QNCj4gDQo+IEFkZCBiYXNpYyB0ZXN0IHRvIHZhbGlkYXRlIGhlbHBlciBm
dW5jdGlvbnMgaW50cm9kdWNlZCBpbg0KPiAnbGliL3hlL3hlX3V0aWw6IGhlbHBlciBmdW5jdGlv
bicuIFRoaXMgdGVzdCB3cml0ZXMgdmFsdWVzIHRvIHRoZSANCj4gZGVzdGluYXRpb24gYnVmZmVy
IHVzaW5nIEdQVSAoTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQpLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQm9tbXUgS3Jpc2huYWlhaCA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+DQo+IENjOiBP
YWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVs
L3hlX3N2bS5jIHwgOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gIHRlc3RzL21lc29uLmJ1aWxkICAgIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MDAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3N2
bS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3ZtLmMgYi90ZXN0cy9pbnRl
bC94ZV9zdm0uYyBuZXcgZmlsZSBtb2RlIA0KPiAxMDA2NDQgaW5kZXggMDAwMDAwMDAwLi42MzAy
YWY5NWINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9zdm0uYw0KPiBA
QCAtMCwwICsxLDk5IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsg
LyoNCj4gKyAgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICAqLw0K
PiArDQo+ICsvKiogQGZpbGUgeGVfc3ZtLmMNCj4gKyAqDQo+ICsgKiBUZXN0IHNoYXJlZCB2aXJ0
dWFsIG1lbW9yeS4NCj4gKyAqDQo+ICsgKiBTaGFyZWQgdmlydHVhbCBtZW1vcnkgKFNWTSkgaXMg
YSB4ZSBkcml2ZXIgZmVhdHVyZQ0KPiArICogd2hpY2ggcHJvdmlkZSBzaGFyZWQgdmlydHVhbCBh
ZGRyZXNzIHNwYWNlIGIvdCBDUFUgYW5kIEdQVQ0KPiArICogcHJvZ3JhbS4gVGhpcyBtZWFucyBh
cHBsaWNhdGlvbiB3cml0ZXIgY2FuIGp1c3QgbWFsbG9jIG9yIG1tYXAsDQo+ICsgKiBhbmQgdXNl
IHRoZSByZXR1cm5lZCBwdHIgZm9yIGJvdGggQ1BVIGFuZCBHUFUgcHJvZ3JhbS4NCj4gKyAqLw0K
PiArDQo+ICsvKioNCj4gKyAqIFRFU1Q6IHhlLXN2bQ0KPiArICogRGVzY3JpcHRpb246IFRlc3Qg
c2hhcmVkIHZpcnR1YWwgbWVtb3J5DQo+ICsgKiBTdWItY2F0ZWdvcnk6IE1lbW9yeSBtYW5hZ2Vt
ZW50DQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBzdm0NCj4gKyAqDQo+ICsgKiBTVUJURVNUOiB4ZS1i
YXNpYw0KPiArICogRGVzY3JpcHRpb246IEJhc2ljIHRlc3QgdG8gdmVyaWZ5IHN0b3JlIGR3b3Jk
IGZ1bmN0aW9uYWxpdHkgdXNpbmcgDQo+ICtoZWxwZXINCj4gZnVuY3Rpb25zDQo+ICsgKi8NCj4g
Kw0KPiArI2luY2x1ZGUgPGZjbnRsLmg+DQo+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ICsNCj4g
KyNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJsaWIvaWd0X3N5bmNvYmouaCINCj4gKyNp
bmNsdWRlICJsaWIvaW50ZWxfcmVnLmgiDQo+ICsjaW5jbHVkZSAibGliL3hlL3hlX3V0aWwuaCIN
Cj4gKyNpbmNsdWRlICJ4ZV9kcm0uaCINCj4gKw0KPiArI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgi
DQo+ICsjaW5jbHVkZSAieGUveGVfcXVlcnkuaCINCj4gKw0KPiArLyoqDQo+ICsgKiAgQGJyaWVm
IFZlcmlmaWVzIGJhc2ljIHdvcmtsb2FkIGV4ZWN1dGlvbiBvbiB0aGUgR1BVLg0KPiArICoNCj4g
KyAqIFRoaXMgZnVuY3Rpb24gdGVzdHMgd3JpdGluZyBhIHZhbHVlIHRvIGEgR1BVIGJ1ZmZlciB1
c2luZyB0aGUgDQo+ICtoZWxwZXIgZnVuY3Rpb25zDQo+ICsgKiBmb3IgY29tbWFuZCBzdWJtaXNz
aW9uIGFuZCBidWZmZXIgbWFuYWdlbWVudC4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgeGVfYmFz
aWMoaW50IGZkLCB1aW50MzJfdCB2bSwgc3RydWN0IA0KPiArZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZQ0KPiAqZWNpKQ0KPiArew0KPiArCXVpbnQ2NF90IGdwdV92YSA9IDB4MWEwMDAwOw0K
PiArCXVpbnQzMl90IHZhbCA9IDB4YzBmZmVlOw0KPiArCXNpemVfdCBib19zaXplID0geGVfYmJf
c2l6ZShmZCwgUEFHRV9BTElHTl9VRkVOQ0UpOw0KPiArDQo+ICsJc3RydWN0IHhlX2J1ZmZlciBk
c3RfYnVmID0gew0KPiArCQkuZmQgPSBmZCwNCj4gKwkJLmdwdV9hZGRyID0gKHZvaWQgKikodWlu
dHB0cl90KWdwdV92YSwNCj4gKwkJLnZtID0gdm0sDQo+ICsJCS5zaXplID0gYm9fc2l6ZSwNCj4g
KwkJLnBsYWNlbWVudCA9IHZyYW1faWZfcG9zc2libGUoZmQsIGVjaS0+Z3RfaWQpLA0KPiArCQku
ZmxhZyA9IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiArCX07
DQo+ICsNCj4gKwlzdHJ1Y3QgeGVfYnVmZmVyIGNtZF9idWYgPSB7DQo+ICsJCS5mZCA9IGZkLA0K
PiArCQkuZ3B1X2FkZHIgPSAodm9pZCAqKSh1aW50cHRyX3QpZ3B1X3ZhICsgYm9fc2l6ZSwNCj4g
KwkJLnZtID0gdm0sDQo+ICsJCS5zaXplID0gYm9fc2l6ZSwNCj4gKwkJLnBsYWNlbWVudCA9IHZy
YW1faWZfcG9zc2libGUoZmQsIGVjaS0+Z3RfaWQpLA0KPiArCQkuZmxhZyA9IERSTV9YRV9HRU1f
Q1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiArCX07DQo+ICsNCj4gKwl4ZV9jcmVh
dGVfYnVmZmVyKCZkc3RfYnVmKTsNCj4gKwl4ZV9jcmVhdGVfY21kYnVmKCZjbWRfYnVmLCBpbnNl
cnRfc3RvcmUsICh1aW50NjRfdClkc3RfYnVmLmdwdV9hZGRyLA0KPiB2YWwsIGVjaSk7DQo+ICsJ
eGVfc3VibWl0X2NtZCgmY21kX2J1Zik7DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0X2VxKCoodWludDMy
X3QgKilkc3RfYnVmLmNwdV9hZGRyLCB2YWwpOw0KPiArDQo+ICsJeGVfZGVzdHJveV9jbWRidWYo
JmNtZF9idWYpOw0KPiArCXhlX2Rlc3Ryb3lfYnVmZmVyKCZkc3RfYnVmKTsNCj4gK30NCj4gKw0K
PiAraWd0X21haW4NCj4gK3sNCj4gKwlpbnQgZmQ7DQo+ICsJdWludDMyX3Qgdm07DQo+ICsJc3Ry
dWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZTsNCj4gKw0KPiArCWlndF9maXh0
dXJlIHsNCj4gKwkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwkJaWd0X3Jl
cXVpcmUoeGVfc3VwcG9ydHNfZmF1bHRzKGZkKSk7DQo+ICsJCXZtID0geGVfdm1fY3JlYXRlKGZk
LCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERQ0KPiB8IERSTV9YRV9WTV9DUkVBVEVfRkxB
R19GQVVMVF9NT0RFLCAwKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdF9mKCJ4ZS1iYXNp
YyIpDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKQ0KPiArCQkJeGVfYmFzaWMoZmQs
IHZtLCBod2UpOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQl4ZV92bV9kZXN0cm95KGZk
LCB2bSk7DQo+ICsJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArCX0NCj4gK30NCj4gKw0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZCBpbmRleCAN
Cj4gNzU4YWUwOTBjLi5iZTc5MmE0ZmQgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL21lc29uLmJ1aWxk
DQo+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+IEBAIC0zMTQsNiArMzE0LDcgQEAgaW50ZWxf
eGVfcHJvZ3MgPSBbDQo+ICAJJ3hlX3ZtJywNCj4gIAkneGVfd2FpdGZlbmNlJywNCj4gIAkneGVf
c3Bpbl9iYXRjaCcsDQo+ICsJJ3hlX3N2bScsDQo+ICAJJ3hlX3N5c2ZzX2RlZmF1bHRzJywNCj4g
IAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCj4gIF0NCj4gLS0NCj4gMi4yNS4xDQoNCg==
