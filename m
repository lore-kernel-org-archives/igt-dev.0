Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D708BC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 21:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EBC10E1E0;
	Thu, 20 Jun 2024 21:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxsAAPjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8DC10E1E0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718920456; x=1750456456;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B8h78h0AkpAjDrvaCxThJmcExpIqSOPFl1Pfi/7Vsdk=;
 b=OxsAAPjWjXImTSrCSyjVOFvzQH5ZC1Q+oxBSPLu0GpSWAEi2UuLkhTg0
 XWugGbSjENBoUX27NaXPyC/O+nPj75PI/tLEoM3JAWeIUiPNnpNpUN2Ft
 Tzvu/hsvD7j8QQvxYmbJYoNzRfP6PqsM6DnSyycbbarkyfXGFNMFMFXhY
 SNBnVABJReNeubcfl6cikNYKsonWFJOkZeil8pI66YvtPflk+Nk2V0cUN
 PyBaSdu2/pttL4u90EaTvXV0P5xM3nvzYCh90F2rOiYFtwzozwTPBoPvh
 O9m+2w5cDfM+ZKo4Q16bh8w7NKfR7A+CbmNVKccpov8dolAdrHXV6k0bL w==;
X-CSE-ConnectionGUID: 0bHdJtBlQUSRSyBfiAPaFA==
X-CSE-MsgGUID: MIxQz8HFRtiYZWHaMysoBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41339182"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41339182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:54:15 -0700
X-CSE-ConnectionGUID: keAyBFRkQTWmY8jfwrXaQQ==
X-CSE-MsgGUID: BRGxsEXkRT++cJrVNwhdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="43065920"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 14:54:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 14:54:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 14:54:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 14:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/M0v/ZepAZw7MoayFbvQZPPcnSFtVR6UM02p5SQS5v70hgh8yd3eA0dpIWjwAN6/XvVQHU15rpVr4MrzGlNMnT2Ukff9+AO7WweFjLJGw7dBp06sq6NK7WTBNiv4cXhB8rF6tMIV56M06xYoUnk16oyOdJsrrPPEz4CC58nqTym5VNJ4Xzmm/S1gI+Ok398BYPO+4q691z+u5T+7jK4VC+EzTHWEf4r3A97DgkVO38OA+2yFTjxjc/eXnoF3LVlh15Mr7KDuN7On+a4l385sh91doTFRCmWKQ1/BaO1ocwb55ZLkKEHFisBhiVFvC3sjdAs2zEaZW97wqXuElR9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPCecxqF+Vq2fmF4J+akqPJ9CG1nSpeDV8Kxc+VmQ4I=;
 b=d2axJEA1OISqo6G49TTQ4XHt6+FS3KKbPfy7AMuS29kS7vmWGEYqZ3uWVMy/kLN7Umwb1B5VpPYmHrvk8hGfhULqHHcDtV/l59D2PmoeWIl6WfiAnxG+DQBN7WpX8de+y02o7nlzEMUIzvuITD9rd6Qfu0ioX2lU3kFJIsHW8bx+YTBmXST06a2hShhvE8QR8zxW+CXLfgXLoILxZCl/DwS1SftANTPSFXZwt7F0/ebPtbCeWhLgK+c0Z/Kw9MjjmyqYF5KPG3Z3I+bZv7qxNQTHG5pWKxGMICQahOmROMhE6X7m8A//SZz6meNzfVscvt8VfrQqjWXT0at/bz20Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Thu, 20 Jun
 2024 21:54:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 21:54:12 +0000
Date: Thu, 20 Jun 2024 14:54:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/28] lib/xe/oa: Import OA metric generation files
 from i915
Message-ID: <ZnSlAfepDlBT/Tcl@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0301.namprd03.prod.outlook.com
 (2603:10b6:303:dd::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 890be6b3-172e-416e-2083-08dc9173852f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emd5QnNUdkRDcmlvZnRLQ1kwYjF2aVc1OGJEV0E3dmdFL3dNajl1bUd6a2ts?=
 =?utf-8?B?MW5FS1B5K3phakgvN2daVjBEYWVPc2ZGbXpsS1QwczR5dXcyT3RZT0xQdGxo?=
 =?utf-8?B?YTRhcjlIMzRXQkQweDlReVRpUGQxditXZlhZSTNtbmsxMElMYmxLZzg3TXdL?=
 =?utf-8?B?VXVBOEhqMC9EbkM5bUdJVFJ3cytoUTVreXBLdGtZQ2hMekVZbDJYZDY4azE5?=
 =?utf-8?B?RHJIYWVDWjNBY0hpZE4ra29SNDVrQTErMHBoem91YVFaek5JOWo0ZEdGOUJh?=
 =?utf-8?B?K09WM0JRalhrd2t4SnVYVU5ycG9hVnN4ancvaG5lOUlyazAzb2NXbkV6c3h6?=
 =?utf-8?B?T1d3a2thQmFobU1OamYxOURFQy9XOENGSzdockovdG4yN3FCU1IyL1ZuZ0t2?=
 =?utf-8?B?eUtaa0VzTnIybDlmSWduOTlQaGorQVFUZ3lhTGgxdjFLdHMzSk1BSzNlOElo?=
 =?utf-8?B?Slc3Z2NZN2lSYWU0ZXYvanV1dzcwMDhsUFZaSmViTm1xbzRjQ0VxclpkMGly?=
 =?utf-8?B?YkdCMENqTU01TEQvVVFpR0s5Z0NBc29GSnBGK1BKZHcyUGZFRFArTWgxVm5v?=
 =?utf-8?B?Qi9kbm00ajNOWUFEOEhSR2VoSGdEKy9iYjJ1T3VxWEVieFlLM052V3k4bjJI?=
 =?utf-8?B?d3VXQW9aYjl2bjRQTlNxWE04TWtYTjlvZytnSW4xazI1T0MyWjZUV1J6YnVU?=
 =?utf-8?B?OWMxY21xZHN3YUJqcWxHUUZwNVF3Z3Fsamd2MU9PZHF1WDhzQ0NGNThnTjNk?=
 =?utf-8?B?eGl1bnZIWkswVWt5MVN1Z1p6WVk4QTdSbVlYRTVMTHFmdFpTZ0NsYU1NQUUy?=
 =?utf-8?B?Z1pQZUdMOFd2N1F2QThsOVRUaHpMZGxwYThhRXgvWUhJQ095WGpJbmJtVkNZ?=
 =?utf-8?B?RXNma2xHN0pmMWtobE4vZFJkSnZzVGtCcGdnM0ZxbkIzdW5Cc2p6cDVZL1k2?=
 =?utf-8?B?NU1rUThMUGc3TC81TlZkQ0dLSXU2TkZ4d2o3dEplNVRMaUsyK3VMaU1rdXV6?=
 =?utf-8?B?Q1BCdTNmVFBYeW9UKzVHWHoxL3FPRVdLMjhVbnQrWG9FaVczVkRxdDRpZTFW?=
 =?utf-8?B?RFRiTEdHamJ4UWNheGxkZDF6UWNjN1orYmRtMklSNW52UEtOTDVXajR1SEUx?=
 =?utf-8?B?Q2k0cGlsMGgydlMzRGtJb3ljMDZZaVNpSUJmaUh5T01acVFkamo3OHR5VUFI?=
 =?utf-8?B?REYySU94UUVEencxZWh6RDh3QVlWdkJmdXdyS0dGN3dxSFV5bUxPMVdiTWlP?=
 =?utf-8?B?YXZSbWtrMmtYbVpUdzJ1dGhyU09zTVRoanNYbERCZDRNdTFYWWpnaTRqNDBh?=
 =?utf-8?B?WGtKeDN2eHJzMk96eUhrSkxMZDE3SUFMNzFHdzh2ckxUcDhGYVp5dGNVaXNZ?=
 =?utf-8?B?YitTTG5hYlVCSG5yV1NhbS8vWlcyVjdncHRHYjJPZHRkMUwybHBNSG5TbWJL?=
 =?utf-8?B?dGY2UWgvbFU0TXJQZEhWdlFYUGVDTElrK1E3OWZQVDdRcVk3ZnQ1THJ1N0FL?=
 =?utf-8?B?SXNRV3VWM0FmMjQ0ZVc4VGczbm1UbkZCcWQ1T1EzYWpQZnlnWHBpTVhrbXNX?=
 =?utf-8?B?N2ZtTi9oeVdzYXVMcUVSbTcxYmtJUkkrclQxZ2NUNmxlaUtDaTYyRXR4bWZU?=
 =?utf-8?B?MERDOVFrT1JHdzVqVGpZN29nWXBjWTcxYkhweFpqcmlVNmxBT1JRNkc3MGZY?=
 =?utf-8?B?N0cxV0pKeWtYQmNTczFxQjExenl1aTc2WW1lV3BaazJYdTEveTY5bmZXMjVl?=
 =?utf-8?Q?IZBxxIO61/kZr/r+hNK5246oy4Wegi5Wr980tGR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snl6VG9aR1RiZ3lkaHNSUnBLUzRyQWhGRFJPS01uN0xqQ1MwUTZzSndDNHl5?=
 =?utf-8?B?cmZKczYzZkIzZmsrWjhRcUFrREtoOWwrK2lKZW1nVmVwUEhrTzh3RUhUTU8x?=
 =?utf-8?B?NnB5NEZXYzRyL29zT1JuOFdhcC9nVTVvRU5HZGVGZkx0U0I3dktTQVRXdis1?=
 =?utf-8?B?ZzdmU1h3NFJtZExnenhaRWJ3YlZFMDRpcWd2dkMxeFU3Yy8rbkUzeUUwSmdX?=
 =?utf-8?B?b2E4eS9JWEJrbW1jMXJ1dWdVVUtPWTdPMXBac3YvR21hRUlIck1CcHgxRGh2?=
 =?utf-8?B?dHVnTFZmbUVBelpnRHZmSVV5RUZpbnB1Zks2YkdZdUJlT0x0SDBROFFxOHIy?=
 =?utf-8?B?Q2FMbXR6Y0NTOXlqVTBiUk5hR3A5K1M0Z25NbFFhN0tVbm0xd3dwazZKZWE1?=
 =?utf-8?B?c01jVXM4bmhuaVhCdUxxUVZlOHdRaHZuYm9GNVo5OFAyQlBteTRGK0NsNzcy?=
 =?utf-8?B?NzVSZWg4TXdaMHpZVDgxM2Nsa0lOUkZqU3RXKzdoWU43Z0QyQm9HWGpZa0VP?=
 =?utf-8?B?eGR5TDF6SVJJNy9tT0x4SXVIVVI3Ky9kMXRLNEIySCt3WHdYVzQ4cTRHOHFM?=
 =?utf-8?B?ZVpRRitkZlNNUGxoRW80SnVhSlBRMVlDMnVuK3dUY1Erck9nOWNKTXJoZDFW?=
 =?utf-8?B?VFRldDdlYXcrWVlsclN4aDF5czIrL3ZhTDFZYndDemdvQk9xTFpEeUhWaXBX?=
 =?utf-8?B?S2RJZ1FOaDczTm1GZ05oUkNXNlBVTldhSUF4a2pOanlNM0xRVG5tU3RtS09l?=
 =?utf-8?B?elNJY1hmRHFXWUsra3hoNTA2MlpzaG9hekZXNi9lQmxmanpRUk4yVkYwMURm?=
 =?utf-8?B?YVM3TkZIYWxQRGUwTkJoemZpZWhGa2dQU05QNi9TL0lMSlkzRkRSOExGd2NT?=
 =?utf-8?B?MlNKMjFkbjRKUUlnTHViT3M2YUZvS2VVUGhmdXBhbm1OTExGVXVua3BreTE1?=
 =?utf-8?B?Q1BqZDNva3ljNGVVQWRncmhhUTRDZ2ExVkdmMmRhRXBGUFpITC9tS1VCRG9M?=
 =?utf-8?B?aUh5WVFRcnRiMUZraFN1V1NxeFFYZTBMdEh5bjZlL2N6WEVpTmEycmt0dEdv?=
 =?utf-8?B?RHVYa0JRblVrYkl1Y2JsRnlRZVJKaTgrVjhkQ3VIZFgvRmpjU0ZtTWJmdW9t?=
 =?utf-8?B?WUlyR3pLZUNLRE1vYmZLWmF4K2pjTW1sMEF5QmZHaTl6V3VYU0NxNThReDFv?=
 =?utf-8?B?RTI3MUdkMFMwV1VacTR5czB5VVd2aG5weEVxVkpleE01L09BUXJTanU3Mldm?=
 =?utf-8?B?d0lGMkQ0V2Y3ZE9qUnoxMDRQQXptb0J3a0syODV4ejBoMlFqeklvcy9rNlEw?=
 =?utf-8?B?ZlRwMzEwZnU0a1dmSHR3Z0dWTG0wNHFHUkZqTExGcE13cGRvUDhINGh4TUph?=
 =?utf-8?B?MmdDRW5oUDdMNzZxU0QzcEVWbnZ2R2NiZS9IYkJBSU9kOVhBbW5aN2tYWTZR?=
 =?utf-8?B?VlA1bEk5RTRTejdnamhYWS9XVlVUc1N1YkF4a3N4cGVhM3BhTTdqWWl2Y3Br?=
 =?utf-8?B?aGR1VHRHZVpMZ3RTZXNYeC9nczVvZFJrclRubThaVTFydG5STlFFOVpqN0Nn?=
 =?utf-8?B?cUwzcm5rVkpkTmlGcm9ZV2Eyc0E5WWtyOWxhUE9yZWV1QitKTVdDSFRscFhR?=
 =?utf-8?B?MElacVVkYVBsR082ems0OFp0bUZiWDRLVDhybXdoanRObHNJSTVTU3Bjayt1?=
 =?utf-8?B?WDdqamxUblYvNnFGcmdLTks0T0hUTzBaOERxNk12UzVyVUVWMTl0VkhpOXE0?=
 =?utf-8?B?a1VLZG1NODU5SzBRVjArSlFqZDdKNmZKT1JaOGswYWV0QVp5Mlc3MlhZSDRV?=
 =?utf-8?B?b1U2b3I4d1lYd1RMRS9IUEZsa3FlN2Zqc1RYNEkzYnQ2VWZQeHNEVlZkWWtO?=
 =?utf-8?B?L0hjWWt1YTF3bWRlQzFNRDRZeGdaSmlJckdBOW0rY0tseEJ4MUhhb3hDbGFZ?=
 =?utf-8?B?d1gwSm1GbW1OR2ZKM3pvS2RBenNNc0ZlN24xTjBsVmZFeXYvVEtlUGJ4cVBo?=
 =?utf-8?B?aHRlREpSOEIra3oxcUxyUnlGTUpySXN4NjJxQVRnQVpSNTVjbjEwTkJ5RlpB?=
 =?utf-8?B?MVVKaGtPZlFBNWF5WEpSU3MrcVNva0NGTXpBRHJyeHUvWXcvbXVaTlV5UThZ?=
 =?utf-8?B?R1VONlVmSmxFQlRZcENKNGxyWjFvNWJVSjkrRUtNVG90dmp1QS9DUXZBcDF1?=
 =?utf-8?Q?4BoTDs1ViEjFfYAvfkG/Jkw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 890be6b3-172e-416e-2083-08dc9173852f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 21:54:12.2865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58rHEWJ6VQ5/OSgMbQade/npEq+adgrAl3PtLBk5Nf0zhj1WiGMrjnKmFBaYaKLAYVRDX4uj7fROFXFuOzEjAST9JKGqlwQhp0QioQmkUSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Thu, Jun 20, 2024 at 01:00:26PM -0700, Ashutosh Dixit wrote:
>Import OA metric generation files from i915 to provide a starting point for
>Xe OA XML processing code.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I think it is indeed better to have lib/xe than try to fit it in 
lib/i915, so this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/xe/oa-configs/README.md               |  115 +
> lib/xe/oa-configs/codegen.py              |  444 ++++
> lib/xe/oa-configs/guids.xml               | 2749 +++++++++++++++++++++
> lib/xe/oa-configs/mdapi-xml-convert.py    | 1196 +++++++++
> lib/xe/oa-configs/oa-equations-codegen.py |  261 ++
> lib/xe/oa-configs/oa-metricset-codegen.py |  257 ++
> lib/xe/oa-configs/oa-registers-codegen.py |  118 +
> lib/xe/oa-configs/oa_guid_registry.py     |  117 +
> lib/xe/oa-configs/update-guids.py         |  222 ++
> 9 files changed, 5479 insertions(+)
> create mode 100644 lib/xe/oa-configs/README.md
> create mode 100644 lib/xe/oa-configs/codegen.py
> create mode 100644 lib/xe/oa-configs/guids.xml
> create mode 100755 lib/xe/oa-configs/mdapi-xml-convert.py
> create mode 100644 lib/xe/oa-configs/oa-equations-codegen.py
> create mode 100644 lib/xe/oa-configs/oa-metricset-codegen.py
> create mode 100644 lib/xe/oa-configs/oa-registers-codegen.py
> create mode 100644 lib/xe/oa-configs/oa_guid_registry.py
> create mode 100755 lib/xe/oa-configs/update-guids.py
>
