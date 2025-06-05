Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63523C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 16:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F1B10E2A5;
	Thu,  5 Jun 2025 16:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVjxjupB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C517C10E8B7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749139404; x=1780675404;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XzD15UxLqV0FqQM7LQtJ4K6kmK8wrrsdB6kwaNW2jqE=;
 b=CVjxjupBtIRcIJdNrhuLdmlaO1ZvkxuDN+4nzqax1pYdxPkXrWvUeShI
 iD1uH8kZADc5+Y2t7YjuY0NTzRnC1Uy7oF9cviZ1/fTkAEL9Z3icq1XSU
 8QHLiWZ0UNCSxDQ3gRGnF1O4tlScdD7BvrixLQDLG3ZoGfK8rqf+JViCP
 1pDaSqiLkcE4nfDEZn71ePI+LH6DIMaVsUdJBvp6h+jywZq7VFyClfU7r
 XCf8nxp7I5mCmHGPWXnGTsO3KmSec67OAyoxuY+auYtXActC+tH8tKyqF
 XLkN1sclN5ib7PH1+ITh++bjnnMtO7tIwEdIfN5VkmSXzfOFeIyKKLjes Q==;
X-CSE-ConnectionGUID: BLecTd35Sre5DelE0gwIaw==
X-CSE-MsgGUID: g5P5aAA6QSGljSxXdXCy1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68703859"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="68703859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:03:24 -0700
X-CSE-ConnectionGUID: nHN40C80QT6czC75pEQj6A==
X-CSE-MsgGUID: HbCMpCsISOqxLLI+UJO2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146535692"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:03:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:03:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:03:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.51)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 09:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnTxm66WyS3Aw00fX6Q641JIVLbqDtdumXyg1uggoRIS13pY5GQ0tVW86Wz3/w04DdXlu7hQLSA7RiT9HCVBpzv8Yu/PqNB2w0eSfnjx9O9t0srl44XoSgQxRy9OyrWEylES4WSPPP4bw/Eo+HbsQmIJRoAQg7buLBPCIt/dUibyvEcv/8XBA5421iXCbi7Yh1g3ELmbby01swwVzUdssSYQhic52dAZnmNZUiVZfYgMwMTZ+3UNqQmUaSPdJKaobyFk1vlhnTDdK9kJJFyDtf8Swfj/LO0dzdRX430Hcqb9qo8gVnoo7+2Atbi0dGAZWkRhzlTKyMm0IdBK7q/PCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMuVq5JWGuro9yV3fDPPkHsD7UyRtEl07rRAWo2QrQM=;
 b=jtqNRXvyLfh5P1sd71ZM+iiBFM+bheEZtaqgAN66RbmyRux9Y5dlhmV5l+rlsiOH4nXu9Kd6DZ6qHNd6mB5AAmTrCS7BohynnZmBPn0aluo+UmPVGcrPOiQfe6euLAzrieGfOul8G5Ww0nl61OqrFWgFuPDtUQRINmvA2alAN/NIIbAFjsKajVsuLaBIDUEYX95D02gyBacJYuP/uMtRoi2hK+L8tF8zgw8ImSzfNLVRBdtndqmoDvkqUe7UXYOycUxHbWNIVLOMu6hFrBkXx0/wklM1XoP5CKb313HJ/OjIsU1Qb5429urAevSJmT4HEdE2cELNfxUWuDyYVxE2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8382.namprd11.prod.outlook.com (2603:10b6:610:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 16:03:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Thu, 5 Jun 2025
 16:03:18 +0000
Date: Thu, 5 Jun 2025 09:03:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lure?= for
 tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
Message-ID: <aEG_xEsVgg_DIpHB@unerlige-desk.amr.corp.intel.com>
References: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
 <174907895227.49780.14102748567395808454@1538d3639d33>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174907895227.49780.14102748567395808454@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 333fbdc4-9149-43c4-7cba-08dda44a7c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTU2QUpSMkFScWtxZG94ZHkzbjUxZTYyaXJrVVBQZ3JhVWkvdjVqVlVac0V1?=
 =?utf-8?B?N2lKL05WUzlTMG1NOWc5NFpBSmsyQnJ4R1EzQzJMVmplWXlkT2x2b1ZZd0pC?=
 =?utf-8?B?QVFmZ2lZUDh3WUQ2MXhYWFY0blFlUDJtZE9aaWpPL2F0TXBIZ1FENm4zMHBx?=
 =?utf-8?B?Y3V1WG5NYmU4Uzc1OHBFTUoyN204MGJXUDZFTlcwNGloTXV5Y2VXbDFwNHJR?=
 =?utf-8?B?VlB2V0cyTEdNeWtsM0FIcHdKdWIyRWdYYS9ISTVZa1B4TUtFa3Zqa2NxUDZT?=
 =?utf-8?B?Uzg5RmpDeHkxc3JBaGczZGc0ZHI3eEtYd1NPaS9wUmVuNUJSNVdoNFh3Vkd5?=
 =?utf-8?B?M0VuS2FWcUpGeEpsS2RjR1A3WmNBUzZ0Y2ZOZDE0Vmo2b1M2ZEM4QVlPVEJH?=
 =?utf-8?B?akVMWkNiRHBqT0p4dkE0WmFKVzBvbWd6b2U3cVJYVnl0L0luZHhtMVRCclRh?=
 =?utf-8?B?eWVWWTQ0UTE5SUNrZTZCNUs1cnlDVGI5WEtma0JLQXBlcW9KR1VvRS9aWit6?=
 =?utf-8?B?bENHMllDb0NoclNZOXpoTVdJS3Y2MVhNMTFqOXFuY0pUamtFa0s4d1FaUHp4?=
 =?utf-8?B?elQ5Z1YrWHRSY3dZRm9jaW9yNWRPMHpOVTQ3d3NMSzJNMXQ2T3JZY2ZOeDFE?=
 =?utf-8?B?MzNZOENXR1VHcHVVb1YxK082ajRpZithc3d2U0JTQnRSSmMvV3JpT1o1TXdr?=
 =?utf-8?B?eDkxS0pQV254dW5EUjZ4YmlkSnJZeGFEbDRBN252UFV0OTlDTXh1SGdLRk5K?=
 =?utf-8?B?T0VCVnpzN2E0Z2Z1a2hib0IreFIvbE1UZ3R5WmJPVUlEYkhjVVdtVmZjMVdV?=
 =?utf-8?B?N0pDdzV3YkgvMFRINUVNeGt6UkgycUJjRTJSWHdYWDJmR0ZMTmZqZWt4dlV1?=
 =?utf-8?B?aHZoSmVIaGJycEhuZEZjNVRDcHVvdmRRclRvdlUvV3lGMkNOUXl6U1g2dTdQ?=
 =?utf-8?B?ZSthS2I5R1Jvb045Nm40Y2EzMFlLUUh4NDU2UTB4WHFNa3Vndkx1ckJLVzJm?=
 =?utf-8?B?ZnE2QklNVlRYZzNOTjcyR3BBY0FIeHhVRitRcXFzMWlCNUpqa2xJdDhxamUv?=
 =?utf-8?B?TGxoTGV2OHdWZ3V4cFJnbnBiMFE2bEVGdW9RR0NGZi9QZXBpU1hPYzduYmZ1?=
 =?utf-8?B?ME12ZEZCcVZYTGNpTmRnVVlETGRONk1qc25EWE5QcVNYMnFoSWR5d2tpeXNL?=
 =?utf-8?B?MzA3bFRzdUpyQVR2b3ZrUlhyeDUySTFaeGFQY0MvM21XN2NySndWMGdCbWM3?=
 =?utf-8?B?MUU2eVVzdE1zdmN1MXlMelNzYWkrdjZEQ1dDL2xQNW9Oblp3SmlveFdPTldF?=
 =?utf-8?B?UnFuTWl2V1dTM3FCUDhWckV2K3lGY1Z4WHQybmxXb01IbTBhRkk3VmI3VnVu?=
 =?utf-8?B?ekVOK1RMV29Jakh5QW02cUhBbGhoQlJmemk3WnJlU2VFTUVlcmE3NmNDUlhI?=
 =?utf-8?B?SzhGblNXWWtOL0pHanFHT1lsNkRMWG82RndLM0c2ZWpkcnVYSXQ3U1lSVndT?=
 =?utf-8?B?a3c3UmZJTmlGSm05WXhRK3VuaUxOYThUUThWU1VvUk9ieDB1ZzdrS0RhdGJK?=
 =?utf-8?B?bVZKSWpRa09wU2l4MXBIbExSWnhOb2VkbWJMZ2xnTVFQVlRTTkxFamtnTDFm?=
 =?utf-8?B?d3VDVkNOeFBZUzVmQ2sxa3ZIdEYydFhPamRMRUZxeWFiZmw4cHloUCtmRzNQ?=
 =?utf-8?B?Y1UrNzczR1RZZkVkMGR1K2V1R0o4UUtrVkFMTXMwQzJBSmw0THplbWJlM1BD?=
 =?utf-8?B?SGJsaXpDd29oaW0vNkpCcTN4c1FmMzRqNFpLeTRlUk5pYjFsenFqaDdGZmxX?=
 =?utf-8?Q?F/z7yPM4kygDDZWPoB1DZploeWnfVoXkguixc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elU3aWM2TW5BQjY3VHdhbzdpWEtQelErOVZ3WXNJVlp4SG5QazRxc1YxeUlE?=
 =?utf-8?B?L1o3eVR6Z1VvKzNzSndQLzBkYnBtOUM0WE5JNjRiYVduTHlOLzhFMU83Y2pE?=
 =?utf-8?B?dEw1aWJMZFpNUHFoYjZaWXRvdERkSis4eDE0b1RVb0hlRHFzYWpqKzlMUkxs?=
 =?utf-8?B?OHp1Nzc2TUZKQVlEUXZzMm40a1Ixa1JFUHRCTnFNalJwSUZ3eEZDSnkvVVFs?=
 =?utf-8?B?cTBYcHVjbWJPbkl5MzMxNXcwWjIrVmx5dmwwUmhicWZpdGRQL0FCcVJscmQ3?=
 =?utf-8?B?QTAwQmZnbnRmejFwaW9LaHNGWUd6blNRVkxyQ2ZjNlNkbkhwVGtRTGE0SzFZ?=
 =?utf-8?B?bGREOHJKbWhlNEtWL1pHSmcrd1lnNC9NMW1McVBXeTZuM3IxZlJUTGlMMUUy?=
 =?utf-8?B?QngyQWhkRDhkbVdDWndHejFrTzZudVNDV25ibUZmeVVKKzZvR0N6Vk9NVU1s?=
 =?utf-8?B?eWdCY2VSaFpsNjd4VDVxbTVCQ0ZuZGZtcUZTKzgwclNPaUFxZlJqbFdiYjdC?=
 =?utf-8?B?ZGtocTJqM0JwZHNlc2VTUWZaZHVKZ1c4V2VjRmVXYURwYmNBVEYrY3d6K0N6?=
 =?utf-8?B?aE5ZdFQyZkpGVGoyUnpsSTNnVmFwY0h4L0t5RjZoSHNLTHNxeXoyOFBFYktH?=
 =?utf-8?B?QkI1UTYrNGRSYUFCbFVvU0JMVHczeGtObm5HMTRyK2ZWTUM1TnNmTkdRODlW?=
 =?utf-8?B?U1ZtRVFWeVZGaDd2R0FxOWd3VC82bEZIYzJvdHQyR2pzMFVBa21mOUxUdU5S?=
 =?utf-8?B?NGlEN2lFWWdUZ282blYzY0JraHBkSmlxd1J5TmRjWkdIanBsOHVwZ3F1a200?=
 =?utf-8?B?RG8zekZhaHdXZ080OXBuMW81b2E1VnRsVUFCT0dwdGNnNStVTzlDWTdvbXJG?=
 =?utf-8?B?RzZNRldsUVE4SGx2R0tUZHE1SUdLTHF2MTI0azZZTWdBSzYvRG01cVVLcnBV?=
 =?utf-8?B?bFpnK2xtQlNSaFM2QkdyaWxoUExQVlJoVjlNMXBoKzJMNUVhSjVUYmhuczRn?=
 =?utf-8?B?WTlIQ0tadm5BVWxMaVBMQTJnd1NFd0VmVkxUZTJsWGk1bzRNMEVZTHlXNEZV?=
 =?utf-8?B?bDQrZDB3SzFYb1Q5VzNBaklGQ2hkU3hGbC9jbGtRMnU1Q3FvZHdVaHRsN2wy?=
 =?utf-8?B?ZXNSR2J5TEdRZGVFT0h1aWZPMm41LzdkY002MmFHTTNpMmhrdG96TlJTbVpk?=
 =?utf-8?B?RlhTci8yZEU2WkxuWjJiQVU1RG1KYUhJcmRFQTF6dmk5Mkd5UGtFbzdEUWVv?=
 =?utf-8?B?QnpGZzdxaDczUnllVDhPbEJUdUp1Vm1DT3o5d3FJOTEvczBzMkk2N2xVVGFT?=
 =?utf-8?B?NUN4bjd4cHJYaG5jOEpWTVVhbmlrSlBLRGovb3JIS1AzWms2QmRCbFF5bUdQ?=
 =?utf-8?B?UmZld0pzSW04Y2IzT1JEWTVucWFBN05SeGdmdGVBa1lUNmRFb2hZbGhOZm11?=
 =?utf-8?B?QlVQekpGbmg1Y1dodUNFSWVCV0VUT3pOZUpxU09NRjFUVWJmN0JGSS9GcXNW?=
 =?utf-8?B?QWlqY0puT1ZjeWZuMkNNMDY0WTg1b3kyRXBYVlRRMnZxd1RtQVNkRmZaVGhI?=
 =?utf-8?B?TUc4U1oxMjNrSlFUaG5LMXArNmZVTnFLd0hjQlpYMnp2K2N1aXhPUTE4Uk83?=
 =?utf-8?B?OFl4bzZyNm1nRjBJOHZXUy9vRVh2OExjTlVuR0lhZTEyWGZja09zeDkwL1dt?=
 =?utf-8?B?MmdJY3A5YURNS010c1ZFS1pWSDhjd1VTdDN2Mm1ac0lhQUFtbXRIVHRLVXJM?=
 =?utf-8?B?UnFuNllwYWh4azRhUWU4WXBqdjdOaXcyZ2VEZytFem1GWndPYWF1ajJQMHJl?=
 =?utf-8?B?STM2VHB3cE1FTWtPaFMzQVljVTRMdUI1R1RNcStqdHd5anlzWU16Sk93YVJE?=
 =?utf-8?B?V3d0ZVQ5MS9LeVFtcFkwNU9DNW0wZG9Ya1VXbDE4dGtiZkdVQllMZ2krYXJy?=
 =?utf-8?B?OVNUWThmcklndi8wdUw2VXhqM0UvUWNMem1SUlRIQ1dpYUh5eFlubVB0OWg2?=
 =?utf-8?B?ZEVvNGhUUHZXNldXRzM3NEpjRFpPM3lhQWluK3RYWUxpanVrcmtmVWtkM0lS?=
 =?utf-8?B?c2s1V2ZuTmVXNTcwK0U2OWRRdU0zUnk3NzE5dHhsbTVQRUhaUS9xSGxEa3Av?=
 =?utf-8?B?b2R4K2E0L2xYUmtyWWhrbnU3ZjBQeVNEM3RJWTdUUjNBMFNGUFVTWEpaZTR5?=
 =?utf-8?Q?KpwC62+wZMs9XWxW+ru0x7M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333fbdc4-9149-43c4-7cba-08dda44a7c95
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:03:18.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNnGBjMKj+nMI38z7DdxnI6607N3z8qUvVR4Vb7/nE+ZyZY2xRib/XQEgxKjyNNeSzgoihiHo0uigCILhlm75VpEjnCMM+mwoTZE+mg0qRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8382
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

On Wed, Jun 04, 2025 at 11:15:52PM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
>   URL:     [1]https://patchwork.freedesktop.org/series/149848/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13245/index.html
>
>          CI Bug Log - changes from IGT_8396_full -> IGTPW_13245_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_13245_full absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13245_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13245/index.html
>
>Participating hosts (10 -> 10)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   IGTPW_13245_full:
>
>  IGT changes
>
>    Possible regressions
>
>     • igt@i915_selftest@mock@vma:
>
>          • shard-snb: [3]PASS -> [4]INCOMPLETE
>     • igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
>
>          • shard-rkl: [5]PASS -> [6]INCOMPLETE
>     • igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1:
>
>          • shard-tglu: [7]PASS -> [8]FAIL +1 other test fail
>     • igt@kms_psr@psr2-dpms:
>
>          • shard-mtlp: [9]PASS -> [10]FAIL +1 other test fail

Unrelated to this patch.

Thanks,
Umesh
>
>Known issues
>
>   Here are the changes found in IGTPW_13245_full that come from known
>   issues:
>
