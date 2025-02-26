Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE91C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 15:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352A010E93F;
	Wed, 26 Feb 2025 15:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEVQX0O6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D8410E93D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740584420; x=1772120420;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=2i81KRvftnOKwzJZegCThnymDs0BGPB1e7iC5YZeDpI=;
 b=ZEVQX0O63RY3g146mnIAzjvDpZlQCeJukvROMICHjj+Jzt5gtQwDaszk
 YtFoR38FNeXg2Zk31RMp2vIkUteVTfVuSuLNrfrJJp0r9eQZ6Ad5U5nC7
 +y2vK6AliZfO3aEJu2JzDVLuvdvtxJPHcEnbci+1iA+nW3HP32VU1MpQc
 RP+4Vtd+ZZ6H/i/gF1BnfAMHYSYKhWsNeovksKdgJDp0Ncsv0P+uDeMzb
 Yvv6+D0x+MnGi62OQuSC4zu0H8XJEn2yPzX+dV3FbUiYaTlka/7o4S0Z8
 FfZGyLYerluqUSAUO8ytwf+Ev9NWQhEmtyWMnNZkDd1dWF12njZKT0zQm Q==;
X-CSE-ConnectionGUID: Ie7XnDULR5usU6TJdvKJaQ==
X-CSE-MsgGUID: rm86acNBS1mAWJqusWWOuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63903266"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="63903266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:40:10 -0800
X-CSE-ConnectionGUID: skwaKFO0SkSEfx4RMu9T/g==
X-CSE-MsgGUID: GG7vJQWyQMiHQmt7rin1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="116746439"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 07:40:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 07:40:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 07:40:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 07:40:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpGLCOSxvEH/6NJ4Ymt+/ffC+OAt9f5HjEVNafKumLlRlgAkMrMpI6of6UxZWH8OlvezIPPZUVQ975qqAkf345yF46xoxUl/rh20+J2sLop/R8OpdbzUfBPZMCxvaPy3Xw+J+mZ8YDfUb9PNim09dKrVTwDX4fYyBh9V0JEjyHkS4oMY7UtoC7AzFJTMWMlYtmGwKhOqinyEOtZ5MyVkKPmbqXu8y6AEaaMgbYtgrVDa04tMV+q/KNMu50n7ZUaWsp0fpXGatAk93YG3j2fNVdL77V9RZ67ljwCjzJqjAL5IQaVpcAWSAZHfsx79eMXapb7ek+4K/w7L5zgMg0+4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i81KRvftnOKwzJZegCThnymDs0BGPB1e7iC5YZeDpI=;
 b=UBwxZPfKkv+CYtfLer1rZOZWsESz4ZAzMWwczCj5OMPeJMv5dJRzKFtsL7pVQQe4cjsiTbLa9ZFGLzlV+qyLaRFUfn85MDsghpeb0sq8pUVoWS0q+nr/+Stgfa9RBFY1UDuKFqRqNedyToS+wWRjT+KY00FI7QdNoMG3tiNUo/WgRxW9VGssVMOlk8V0ZceXWP5bNT1tUe0j/Tj/eQfqpzy25zOqLcQiwWK4b+Jk4N25SU1tRXgclmFW1SxhZm66iXGa8ru6nTF10ii2IXg/sV7EYfJx6/fLPSAaF38Z1KU/gwXs9qEl2273XJW5/ed2IBZh1pSbA+nXTspo7qFUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 15:39:22 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:39:22 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 5/5] tools/intel_display_bandwidth: Tool for
 measuring display memory bandwidth utilization
Thread-Topic: [PATCH i-g-t 5/5] tools/intel_display_bandwidth: Tool for
 measuring display memory bandwidth utilization
Thread-Index: AQHbCHWyKUPrcwVTBkGDYl+HrjrpIbKB+6iAgAShLoCA1BtxgA==
Date: Wed, 26 Feb 2025 15:39:21 +0000
Message-ID: <6bc5bfad4b7c5925d158e1a460fc32e395195df1.camel@intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-6-ville.syrjala@linux.intel.com>
 <20241011175207.lzwiaqkj5ah7lmwn@kamilkon-desk.igk.intel.com>
 <Zw1H-xmKtanuPUQw@intel.com>
In-Reply-To: <Zw1H-xmKtanuPUQw@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA3PR11MB8119:EE_
x-ms-office365-filtering-correlation-id: c63b60c7-041a-4211-c269-08dd567bbda9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SnhMSzhma3RBcTcrcXF6RGhDWmtVbCtxMlpaSUFkZm12WGh2cTVlMVUwSVlQ?=
 =?utf-8?B?TmtIcG9TYnl0aXkvYWJWOThSc1Y5QzM3bTVXbTQvazJmUGZ3MDBwRno3UzQv?=
 =?utf-8?B?N01RUS96MDBhcXpWYW9wb3FkUVZMMTRaMXJWdVRjaWtQYlVLRHR6elhEdzdL?=
 =?utf-8?B?V3p1SmhscndudlRXWjFYazQwZEE4ZlpQK3JwUzlVZ0pZQ055Wk14TDYvOGtT?=
 =?utf-8?B?eSt5RGhTQlI3SWhmeWsrek9OQTVmYjJjVjVNRjlLOHYvY05KdWgvNEVNU2I2?=
 =?utf-8?B?bWQ3aWs0NzFHNUg3OTZvK0VTOXkvQjloYy9OYWs2TjdBZnhmejdwNFRHVTEz?=
 =?utf-8?B?b0M4c2pmTDNJWW9tSnRqZFdGc2J1UHVWUGtJTnZ2TlVGTTJIdFE4ZGlaeFRP?=
 =?utf-8?B?OVhrbThCRElOVkhQbzQ5ZCtiU0ozcm95WCt6YlI4UFpERm1jNnczL05xZkxB?=
 =?utf-8?B?Sy9zSFpTYzhtVUZROFJpVnNOOVZxVDFzSmVmYXpCTDcxSHM4TzdSa1kvUEJT?=
 =?utf-8?B?V3A1VzJPcmRhR3FoVXpkdlBHQzJjYStxb3ljRzBsQTdvbVU3eW1lY3Z5Zng4?=
 =?utf-8?B?aVNuY1dpWmlBSllFZXFnWXpZSW9XbnZZTmZuTTg5OFY5Ym9KSjlhaUJYek1l?=
 =?utf-8?B?dnA0MUlPWnVuVlB2QUhMOHJMckI5dUMzUEh6dWRkK0t4clp3c0dqUzVtc1ZE?=
 =?utf-8?B?dGx5ajFza3hlUHNscGlRVnMrKytYV2Z4MnR1aHNsbEtodkxhMnM1b0JpOWxx?=
 =?utf-8?B?UUp1OW5ueEdENXUwcVR5dUNIR0VGMTlPeGsrYkJPblA4OS9sYW9pMVlhRElp?=
 =?utf-8?B?KzhYSUpRblBxMFltUGhSalh1enRIOFZsOWhSVUtNbHpzYWdsSkRLcko3QkNw?=
 =?utf-8?B?Q2RwczZ3S1JIODVudXAyb2RDQWdNYVJ1SVVXdkZMZDIwdUVMaEFPL1hhT1Z1?=
 =?utf-8?B?YWRVc2x5S2ljWWFUanc5RVhtRTJDNVMrb1UvU0o0UHIwK28vQ0hXeHIrT2pt?=
 =?utf-8?B?UmlyditmQ0JMaklXemdBSU56QWJIRWpvS1BaeGNBdHBrUUpHT2Qwa2lqOFVI?=
 =?utf-8?B?aSt0TTJVUWNlbXJnZ3NPbXE5YjN0ZFZ0ZXppMTVUZnZNaFc0eXNEZlZxVlp5?=
 =?utf-8?B?amxVNzg0Y0RjMm5ETTZERGh4c1NwWklBbFVkNmFwaU9STFc0K0tpdVRpcWd3?=
 =?utf-8?B?SW0vVjhFN21PemV0eDFHWEJUTU1wNU0vdWV5ZG9sa2JhUkdWdGd3Um5hVi8z?=
 =?utf-8?B?N1AvTml2TWdCaTNFczFYOGoyWjBUVWZKemRZV0VWTEVGeisxK0d3NWVJL3dz?=
 =?utf-8?B?NFMrSmI2MGZ4WERBWCs5eDRHL1NXdnBocVkxK2F6bEVlUXZpaHJtRWdxUzRr?=
 =?utf-8?B?TW4wL3ZmUGcwbFltT3kyTmE3WHFCcXBEZWExZG50NllkV25WSXNyb2w2bGVi?=
 =?utf-8?B?SDZXV3lwb2JQa1V4ZjhZaldNTFZRUzk3SHB4U3pqdmlLQWFjL3ZTa3pwZ0dR?=
 =?utf-8?B?eUx1OXhZMHJZMy9ZT3F4T1RRV2FqV1JITFlQNGNOZWZOZWtCNUNyTlZQV0Nt?=
 =?utf-8?B?SHB3TjdVdXRkamhYWHRDNXVXOXVkTmtlcndKWEpvN29uZ1ZjenpFWkw2V0gv?=
 =?utf-8?B?VGpPNTJUNjdRQThmUWd1M3hVUTFNSDB2UllLSWJBTWlneFV1dm8xcFlsRjJj?=
 =?utf-8?B?bWx3WjJwRVQ2WkU3VktON1I3NFlDN3R5TjhaaHZLNlFER3dzVytjOCtZL2NZ?=
 =?utf-8?B?VnczRjF0MGllelpjazhWbk1sRmhmNHRiYnJKQzcrdkF1Mzd1U0NYNTU2N0ta?=
 =?utf-8?B?QUNzNW81emFsRDc2RXV5ZElYQ0pCSStyakRQdi9lWitlVzhPay8xOXpSWjVm?=
 =?utf-8?B?TUU2RytBUHE2MFptTDY3UjFNc3NFUThDTThsTS92MFlrZGtmeEt2TExWU3BO?=
 =?utf-8?Q?N1ot3XuQrc3+aFBXizM5lXllCUdXQY/m?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1dhTnU2bmgrOVpUR1ExdXdlbFpGOTc4TlhGbk1DVWtNYWNpZ3pMejBDQUp5?=
 =?utf-8?B?ZzRCd0FZSHRKTHZvbmx4UndKMzBOYi85MnpaTURFaE4vM01LRmNhdXY2RVB6?=
 =?utf-8?B?WnZLN0RoLzd6cjFYVENIczdRa0ZBWVJlVlNGZFZMWUFPWE13NzhBRy9ITjFx?=
 =?utf-8?B?ekVvNmladWt3UTk1TmR2V0ZDVmNjSkNxaTdDWjloVlJSeHpZeG5jZURYWnFy?=
 =?utf-8?B?Zm1kZ2RLQU40UVlWZTd6eHQxWFFwZDg5UkgrVXhzajhIQ1ZncnhQbDBPREhW?=
 =?utf-8?B?QnY3Nk1JL21HWitESzU2T0FKbWVGd3ZjaEJubXByOUxGdll2MUV6bzNiT0Jl?=
 =?utf-8?B?VDJJTXVQQWxOQ0EvVjNXZ1BpV0JCNmxjL0lxSmVxNkdpWGlmRjBhWUorcnFP?=
 =?utf-8?B?ZTlQWHI0TDRTQldIZUZPYTFlNENRT21lSzB3NUhXWU1SYUdaejBGVXlvMElY?=
 =?utf-8?B?TFFKRFlDUkJnMGREK0lnMFdTVXhuUTFCMlp1V2U2eTU3SWs2S2wya2haOS9v?=
 =?utf-8?B?SXFEZHJrMWtsU2pwY0JuUlZhS1VGZzN5M0xwS2dpZjF3ejNyQkRRdlhxNEk4?=
 =?utf-8?B?UlV4dkVBNEFNc0IrTlJNVXoxc1N4NDdjVHJDYUhJTjdqdFlWNVBsOXF2VXlz?=
 =?utf-8?B?elFOQlRUbmlDQ1duRld4YlpxVUJ0elcxaHZ5NGxsTm12RER4U1Q4NGcrKzZ3?=
 =?utf-8?B?Y3hzNkVUMElRSGZsVmNZZHArSW9XR3o1cm9SbzVGOEhGWjQxOEpDMGpJVFhl?=
 =?utf-8?B?UENFaklJdVFNSVliRmRsNnhtTFB1M3NWR0thbi9zSTJvdWNVVVJHMVlyMVkr?=
 =?utf-8?B?VjBSMFhQanlQWlp2eFY3V0VGdjVtUlh4cy85NDBGWEo5ZEQ3VGlYSnFIRzE2?=
 =?utf-8?B?UVhsc3lHSjNpWVd6WVgvTWFXdmxNaWZtOFV3ZEsvc3BkUy85RzUrYlh3eS9v?=
 =?utf-8?B?cW5MYkxDTjVkT0Ntc2dMOFJucFdvYjExc1A1SUhtb0pyVVJKU0swVVZBV2hr?=
 =?utf-8?B?RW1zNEZxdkVXK0tnUlJDRlNlYWFGWjgveHFtcVNvbitxSFJsdENqc2M0bk16?=
 =?utf-8?B?eXRKaVpPVmIzd2Ruc0JyL0JWTlBTNDM0WkZWNTNYMloxWG5BQWIyMHZHaTFP?=
 =?utf-8?B?TkxCZzU4enMvaFFhOFEzSHRhRlRqbzF6MkFSQWYxemFwQ1ZwSHZpWmw0RGlp?=
 =?utf-8?B?OFozV1E5dmxkUHJ6RnZLSkRhc0VaVzF3N2ViVS8zbVgvMmtVZmprdGgzb201?=
 =?utf-8?B?Wks3Mi9FMGdjN0Zsc2NOYjZFQ01wTlRWVjVleEpUS1BybFAwOTdyWVo4TjlP?=
 =?utf-8?B?QUlKMzYwZVFyejNiejZ6UzN4VStwa3dzZ0ZuZU9yY3M5Szh5OUxnZUhNeisv?=
 =?utf-8?B?KzFzM2c4UjMrMk1KY2tMQ2JRdFZaUVl2VCt0M05wQjZvekNBZXpKMitkQmJW?=
 =?utf-8?B?d1d3aDdEUUhUK3haU0V4cm5jdkpSWTBIWC9BeGtYWHpid0k4OFpBQXMyVjYy?=
 =?utf-8?B?cy84Lytib0RXd3NhK2ZJNVROMzY1WlUyczQwL2EwZXVTUm5sNkhlTytlRGJI?=
 =?utf-8?B?QVdISmFZWWpmUmpNVWo4TjJkWDlQVHZpWHNqalpJVVNWVjhWVjR5SVF1ODg5?=
 =?utf-8?B?V0FGZWE5bUordWx2T2JCdDRrKzRUMVNFVzZ1RkRZcTN5cGxQOUhoUFhNL1BJ?=
 =?utf-8?B?dDZWbkRjTi9GVlplVGFsSHJMemlGVDBtRUNPNWdvNmVFUUZMSkQ1OTYxTTJB?=
 =?utf-8?B?bFVUcFVnVUYvMzlhWFFCcThTSHR3azg1RWVQTENCb2lUalZJRFNrWmV2dVhi?=
 =?utf-8?B?TEZSMjUzK09ELzlJVjZlSTdXaVV6ZUQ2MWR3QUU3b2d1ZFRoR1dJZStFWS8z?=
 =?utf-8?B?T1MwWXZ2YWVFZVpFZCs2Y0hHVGwxUG1OZFJhY1ovVUkzUUhnYTBCSTBuamIw?=
 =?utf-8?B?WnRqV09HdlJ3eVViWklMbVhTOFpwMk9FbjBXNXd4M3JydGNhVHNZYklPMW0w?=
 =?utf-8?B?UnQ1RUI4SUVoM2VuelVpSy9RN0JYd0xFL1luaVZGRVNUWjg2eU1mdlAwUkE1?=
 =?utf-8?B?YldxS0t5RDFEbjNPclhYTVA1RGZRVlhVUEYrY2xqVFdtS21kSHlEdXIzUGt6?=
 =?utf-8?B?Vysyd29ZRUFNMlY5L2tCcjdTMERYYWNUVENpbXcrUVF0Nnk3bG40OHEvKzVT?=
 =?utf-8?Q?F7caePZxWag2pWWsxmpCQho=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F714F01523F044187F527E92D54F589@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63b60c7-041a-4211-c269-08dd567bbda9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 15:39:21.9057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxU6p+1QfDOdYitDXdXZ1kKAX509fRO0iyqfwsRY3NDkZSqWGGXdSWC46AawBvEMEEyRsStuOFgfFYHEOhRjQInC7JP6dWrWPwrHI82lRQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

SGkgVmlsbGUsDQoNCkkgdGhpbmsgeW91IG1pc3NlZCBvbmUgY29tbWVudCBmcm9tIEthbWlsLi4u
DQoNCiINCisJaW50ZWxfcmVnaXN0ZXJfYWNjZXNzX2luaXQoJm1taW9fZGF0YSwgaW50ZWxfZ2V0
X3BjaV9kZXZpY2UoKSwgMCwgLTEpOw0KDQpUaGlzIGZ1bmN0aW9uIGNoYW5nZWQgcmVjZW50bHkg
YW5kIG5vdyB0aGlzIGNvZGUgZG8gbm90IGNvbXBpbGUuDQpQbGVhc2UgZml4IGFuZCByZXNlbmQu
DQoiDQoNClRoZSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBpcyBsaWtlIHRoaXMgbm93Li4NCg0KaW50
IGludGVsX3JlZ2lzdGVyX2FjY2Vzc19pbml0KHN0cnVjdCBpbnRlbF9tbWlvX2RhdGEgKm1taW9f
ZGF0YSwNCgkJCSAgICAgICBzdHJ1Y3QgcGNpX2RldmljZSAqcGNpX2RldiwgaW50IHNhZmUpOw0K
DQpCUg0KVmlub2QNCg0KT24gTW9uLCAyMDI0LTEwLTE0IGF0IDE5OjM0ICswMzAwLCBWaWxsZSBT
eXJqw6Rsw6Qgd3JvdGU6DQo+IE9uIEZyaSwgT2N0IDExLCAyMDI0IGF0IDA3OjUyOjA3UE0gKzAy
MDAsIEthbWlsIEtvbmllY3pueSB3cm90ZToNCj4gPiBIaSBWaWxsZSwNCj4gPiBPbiAyMDI0LTA5
LTE2IGF0IDIzOjE4OjQxICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0KPiA+ID4gRnJvbTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IA0K
PiA+ID4gSW50cm9kdWNlIGEgc21hbGwgdG9vbCBmb3IgbWVhc2luZyB0aGUgZGlzcGxheSBlbmdp
bmcNCj4gPiBzL21lYXNpbmcvbWVhc3VyaW5nLw0KPiA+IHMvZW5naW5nL2VuZ2lucy8NCj4gPiAN
Cj4gPiA+IG1lbW9yeSBiYW5kd2lkdGggdXRpbGl6YXRpb24uIEdlbmVyYWxseSB0aGlzIGlzIGF2
YWlsYWJsZQ0KPiA+ID4gb24gU05CKywgZXhjZXB0IG9uIFRHTC9kZXJpdmF0aXZlcyB3aGVyZSB0
aGUgcmVsZXZhbnQNCj4gPiA+IHJlZ2lzdGVycyB3ZXJlbid0IHVwZGF0ZWQgdG8gY29wZSB3aXRo
IHRoZSBuZXcgQUJPWCBsYXlvdXQNCj4gPiA+IGluIHRoZSBoYXJkd2FyZS4NCj4gPiA+IA0KPiA+
ID4gUXVpdGUgaGFuZHkgZm9yIGNvbmZpcm1pbmcgdGhhdCBGQkMvQ0NTL2V0Yy4gYXJlIGRvaW5n
IHRoZWlyDQo+ID4gPiBqb2IuDQo+ID4gPiANCj4gPiA+IE5vdCAxMDAlIHN1cmUgYWJvdXQgdGhl
IHJlcXVpcmVkIHNjYWxpbmcgZmFjdG9yIGJlY2F1c2UNCj4gPiA+IGJzcGVjIGNsYWltcyBpdCdz
IG9ubHkgbmVlZGVkIGZvciBNVEwsIGJ1dCBteSBBREwgZGVmaW5pdGVseQ0KPiA+ID4gbmVlZHMg
aXQgYWxyZWFkeS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBsaWIv
aW50ZWxfcmVnLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICsNCj4g
PiA+IMKgdG9vbHMvaW50ZWxfZGlzcGxheV9iYW5kd2lkdGguYyB8IDE3MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiA+IA0KPiA+IElzIHRoaXMgdG9vbCBkaXNwbGF5IG9ubHk/
DQo+IA0KPiBZZXMuDQo+IA0KPiA+IFdoYXQgYWJvdXQgYncgZm9yIG9wZW5jbCBjb21wdXRhdGlv
bnM/DQo+IA0KPiBJSVJDIHRoZXJlIG1heSBiZSBzb21lIGtpbmQgb2YgdG90YWwgbWVtb3J5IGJh
bmR3aWR0aCBjb3VudGVyDQo+IGV4cG9zZWQgdmlhIHBlcmYuIEknbSBub3QgYXdhcmUgb2YgYW55
dGhpbmcgbW9yZSBzcGVjaWZpYyB0aGFuDQo+IHRoYXQuDQo+IA0KPiBObyBpZGVhIGlmIHRoZXJl
J3MgYW55dGhpbmcgZm9yIGRHUFVzLCBlZy4gbG9jYWwgbWVtIGJ3LCBQQ0llDQo+IGxpbmsgYncs
IGV0Yy4gV291bGQgYmUgbmljZSB0byBoYXZlIEkgc3VwcG9zZS4NCj4gDQo+IEl0IG1pZ2h0IGJl
IGludGVyZXNldGluZyB0byBleHBvc2UgdGhlIGRpc3BsYXkgYmFuZHdpZHRoIGNvdW50ZXINCj4g
dmlhIHBlcmYgYXMgd2VsbCwgYnV0IEkgaGF2ZW4ndCBsb29rZWQgYXQgd2hhdCB0aGF0IHdvdWxk
IHRha2UNCj4gdG8gaW1wbGVtZW50Lg0KPiANCj4gPiBDb3VsZCB3ZSBoYXZlIG1vcmUgZ2VuZXJh
bCB0b29sIGFsc28gZm9yIGNvbXB1dGUgY2FzZT8gVGhlbiBpdCBjb3VsZCBiZQ0KPiA+IG5hbWVk
IGludGVsX2dwdV9iYW5kd2lkdGggb3IgZXZlbiBzaG9ydGVyIGludGVsX2dwdV9idz8NCj4gPiAN
Cj4gPiA+IMKgdG9vbHMvbWVzb24uYnVpbGTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDEgKw0KPiA+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDE3NyBpbnNlcnRpb25zKCspDQo+ID4g
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9pbnRlbF9kaXNwbGF5X2JhbmR3aWR0aC5jDQo+
ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfcmVnLmggYi9saWIvaW50ZWxfcmVn
LmgNCj4gPiA+IGluZGV4IDI2ODMzYzY2ZjhlNy4uNWUwNDlkOGIxNGQ2IDEwMDY0NA0KPiA+ID4g
LS0tIGEvbGliL2ludGVsX3JlZy5oDQo+ID4gPiArKysgYi9saWIvaW50ZWxfcmVnLmgNCj4gPiA+
IEBAIC0xNDEzLDYgKzE0MTMsMTEgQEAgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFM
SU5HUyBJTiBUSEUgU09GVFdBUkUuDQo+ID4gPiDCoCNkZWZpbmUgUENIXzNEUkFNQ0dESVMwCQkw
eDQ2MDI4DQo+ID4gPiDCoCNkZWZpbmUgU09VVEhfRFNQQ0xLX0dBVEVfRAkweGMyMDIwDQo+ID4g
PiDCoA0KPiA+ID4gKyNkZWZpbmUgREVfUE9XRVIxCTB4NDI0MDANCj4gPiA+ICsjZGVmaW5lIERF
X1BPV0VSMgkweDQyNDA0DQo+ID4gPiArI2RlZmluZSBERV9QT1dFUjJfQUJPWDAJMHg0MjQwNA0K
PiA+ID4gKyNkZWZpbmUgREVfUE9XRVIyX0FCT1gxCTB4NDI0MDgNCj4gPiA+ICsNCj4gPiA+IMKg
I2RlZmluZSBDUFVfZURQX0EJCTB4NjQwMDANCj4gPiA+IMKgI2RlZmluZSBQQ0hfRFBfQgkJMHhl
NDEwMA0KPiA+ID4gwqAjZGVmaW5lIFBDSF9EUF9DCQkweGU0MjAwDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvaW50ZWxfZGlzcGxheV9iYW5kd2lkdGguYyBiL3Rvb2xzL2ludGVsX2Rpc3BsYXlf
YmFuZHdpZHRoLmMNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLmM3YmUzYzM5MGQwOA0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIv
dG9vbHMvaW50ZWxfZGlzcGxheV9iYW5kd2lkdGguYw0KPiA+ID4gQEAgLTAsMCArMSwxNzEgQEAN
Cj4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ID4gPiArLyoNCj4gPiA+
ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ID4gKyAqLw0KPiA+
ID4gKw0KPiA+ID4gKyNpbmNsdWRlIDxnZXRvcHQuaD4NCj4gPiA+ICsjaW5jbHVkZSA8aW50dHlw
ZXMuaD4NCj4gPiA+ICsjaW5jbHVkZSA8c3RkYm9vbC5oPg0KPiA+ID4gKyNpbmNsdWRlIDxzdGRp
by5oPg0KPiA+ID4gKyNpbmNsdWRlIDxzdGRsaWIuaD4NCj4gPiA+ICsjaW5jbHVkZSA8dW5pc3Rk
Lmg+DQo+ID4gPiArDQo+ID4gPiArI2luY2x1ZGUgImludGVsX2lvLmgiDQo+ID4gPiArI2luY2x1
ZGUgImludGVsX2NoaXBzZXQuaCINCj4gPiA+ICsjaW5jbHVkZSAiaW50ZWxfcmVnLmgiDQo+ID4g
PiArDQo+ID4gPiArc3RhdGljIGJvb2wgaGFzX2RlX3Bvd2VyMih1aW50MzJfdCBkZXZpZCkNCj4g
PiA+ICt7DQo+ID4gPiArCS8qDQo+ID4gPiArCSAqIFRHTCBoYXMgREVfUE9XRVIyIGJ1dCBpdCBt
ZWFzdXJlcyB0aGUgbG93IHByaW9yaXR5IHRyYWZmaWMNCj4gPiA+ICsJICogb24gQUJPWCwgbm90
IG5vdCBhY3R1YWwgZGlzcGxheSB0cmFmZmljIG9uIEFCT1gwL0FCT1gxLg0KPiA+IA0KPiA+IHMv
bm90IG5vdC9ub3QvDQo+ID4gDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlpZiAoaW50ZWxfZGlzcGxh
eV92ZXIoZGV2aWQpID09IDEyKQ0KPiA+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ID4gKw0KPiA+
ID4gKwlyZXR1cm4gaW50ZWxfZGlzcGxheV92ZXIoZGV2aWQpID49IDYgJiYNCj4gPiA+ICsJCSFJ
U19WQUxMRVlWSUVXKGRldmlkKSAmJiAhSVNfQ0hFUlJZVklFVyhkZXZpZCk7DQo+ID4gPiArfQ0K
PiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBib29sIGhhc19kZV9wb3dlcjJfYWJveDBfYWJveDEodWlu
dDMyX3QgZGV2aWQpDQo+ID4gPiArew0KPiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBEZXNwaXRlIGhh
dmluZyBBQk9YMC9BQk9YMSBUR0wgbGFja3MgdGhlDQo+ID4gPiArCSAqIGFjY29tcGFueWluZyBE
RV9QT1dFUjJfQUJPWCogcmVnaXN0ZXJzLg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJcmV0dXJuIGlu
dGVsX2Rpc3BsYXlfdmVyKGRldmlkKSA+PSAxMzsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAr
c3RhdGljIGludCBkZV9wb3dlcjJfc2NhbGUodWludDMyX3QgZGV2aWQpDQo+ID4gPiArew0KPiA+
ID4gKwkvKg0KPiA+ID4gKwkgKiBGSVhNRSBzaG91bGQgcGVyaGFwcyB1c2Ugc29tZXRoaW5nIGxp
a2UNCj4gPiA+ICsJICogaXNfaW50ZWxfZGdmeCgpIGJ1dCB0aGF0IG9uZSB3YW50cyB0byBvcGVu
IHRoZSBkZXZpY2UgOigNCj4gPiA+ICsJICovDQo+ID4gPiArCXN3aXRjaCAoaW50ZWxfZGlzcGxh
eV92ZXIoZGV2aWQpKSB7DQo+ID4gPiArCWNhc2UgMTM6DQo+ID4gPiArCQlyZXR1cm4gSVNfREcy
KGRldmlkKSA/IDEgOiAyOw0KPiA+ID4gKwljYXNlIDE0Og0KPiA+ID4gKwkJcmV0dXJuIElTX0JB
VFRMRU1BR0UoZGV2aWQpID8gMSA6IDI7DQo+ID4gPiArCWRlZmF1bHQ6DQo+ID4gPiArCQlyZXR1
cm4gMTsNCj4gPiA+ICsJfQ0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgaW50IGRl
X3Bvd2VyMl91bml0KHVpbnQzMl90IGRldmlkKQ0KPiA+ID4gK3sNCj4gPiA+ICsJcmV0dXJuIDY0
ICogZGVfcG93ZXIyX3NjYWxlKGRldmlkKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3Rh
dGljIGZsb2F0IGJhbmR3aWR0aCh1aW50MzJfdCBkZXZpZCwgaW50IGR1cmF0aW9uLA0KPiA+ID4g
KwkJwqDCoMKgwqDCoMKgIHVpbnQzMl90IHByZSwgdWludDMyX3QgcG9zdCkNCj4gPiA+ICt7DQo+
ID4gPiArCXJldHVybiAoZmxvYXQpKHBvc3QgLSBwcmUpICogZGVfcG93ZXIyX3VuaXQoZGV2aWQp
IC8gKGR1cmF0aW9uIDw8IDIwKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZv
aWQgbWVhc3VyZV9kZV9wb3dlcjJfYWJveDBfYWJveDEodWludDMyX3QgZGV2aWQsIHVuc2lnbmVk
IGludCBzbGVlcF9kdXJhdGlvbikNCj4gPiA+ICt7DQo+ID4gPiArCXVpbnQzMl90IHByZV9hYm94
MCwgcG9zdF9hYm94MDsNCj4gPiA+ICsJdWludDMyX3QgcHJlX2Fib3gxLCBwb3N0X2Fib3gxOw0K
PiA+ID4gKw0KPiA+ID4gKwlwcmVfYWJveDAgPSBJTlJFRyhERV9QT1dFUjJfQUJPWDApOw0KPiA+
ID4gKwlwcmVfYWJveDEgPSBJTlJFRyhERV9QT1dFUjJfQUJPWDEpOw0KPiA+ID4gKw0KPiA+ID4g
KwlpZiAoc2xlZXBfZHVyYXRpb24pIHsNCj4gPiA+ICsJCXNsZWVwKHNsZWVwX2R1cmF0aW9uKTsN
Cj4gPiA+ICsNCj4gPiA+ICsJCXBvc3RfYWJveDAgPSBJTlJFRyhERV9QT1dFUjJfQUJPWDApOw0K
PiA+ID4gKwkJcG9zdF9hYm94MSA9IElOUkVHKERFX1BPV0VSMl9BQk9YMSk7DQo+ID4gPiArDQo+
ID4gPiArCQlwcmludGYoIkRFX1BPV0VSMl9BQk9YMDogMHglMDh4LT4weCUwOHhcbiIsDQo+ID4g
PiArCQnCoMKgwqDCoMKgwqAgcHJlX2Fib3gwLCBwb3N0X2Fib3gwKTsNCj4gPiA+ICsJCXByaW50
ZigiREVfUE9XRVIyX0FCT1gxOiAweCUwOHgtPjB4JTA4eFxuIiwNCj4gPiA+ICsJCcKgwqDCoMKg
wqDCoCBwcmVfYWJveDEsIHBvc3RfYWJveDEpOw0KPiA+ID4gKw0KPiA+ID4gKwkJcHJpbnRmKCJB
Qk9YMCBiYW5kd2lkdGg6ICUuMmYgTWlCL3NcbiIsDQo+ID4gPiArCQnCoMKgwqDCoMKgwqAgYmFu
ZHdpZHRoKGRldmlkLCBzbGVlcF9kdXJhdGlvbiwNCj4gPiA+ICsJCQkJIHByZV9hYm94MCwgcG9z
dF9hYm94MCkpOw0KPiA+ID4gKwkJcHJpbnRmKCJBQk9YMSBiYW5kd2lkdGg6ICUuMmYgTWlCL3Nc
biIsDQo+ID4gPiArCQnCoMKgwqDCoMKgwqAgYmFuZHdpZHRoKGRldmlkLCBzbGVlcF9kdXJhdGlv
biwNCj4gPiA+ICsJCQkJIHByZV9hYm94MSwgcG9zdF9hYm94MSkpOw0KPiA+ID4gKwkJcHJpbnRm
KCJUb3RhbCBiYW5kd2lkdGg6ICUuMmYgTWlCL3NcbiIsDQo+ID4gPiArCQnCoMKgwqDCoMKgwqAg
YmFuZHdpZHRoKGRldmlkLCBzbGVlcF9kdXJhdGlvbiwNCj4gPiA+ICsJCQkJIHByZV9hYm94MCAr
IHByZV9hYm94MSwgcG9zdF9hYm94MCArIHBvc3RfYWJveDEpKTsNCj4gPiA+ICsJfSBlbHNlIHsN
Cj4gPiA+ICsJCXByaW50ZigiREVfUE9XRVIyX0FCT1gwOiAweCUwOHhcbiIsIHByZV9hYm94MCk7
DQo+ID4gPiArCQlwcmludGYoIkRFX1BPV0VSMl9BQk9YMTogMHglMDh4XG4iLCBwcmVfYWJveDEp
Ow0KPiA+ID4gKwl9DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB2b2lkIG1lYXN1
cmVfZGVfcG93ZXIyKHVpbnQzMl90IGRldmlkLCB1bnNpZ25lZCBpbnQgc2xlZXBfZHVyYXRpb24p
DQo+ID4gPiArew0KPiA+ID4gKwl1aW50MzJfdCBwcmUsIHBvc3Q7DQo+ID4gPiArDQo+ID4gPiAr
CXByZSA9IElOUkVHKERFX1BPV0VSMik7DQo+ID4gPiArDQo+ID4gPiArCWlmIChzbGVlcF9kdXJh
dGlvbikgew0KPiA+ID4gKwkJc2xlZXAoc2xlZXBfZHVyYXRpb24pOw0KPiA+ID4gKw0KPiA+ID4g
KwkJcG9zdCA9IElOUkVHKERFX1BPV0VSMik7DQo+ID4gPiArDQo+ID4gPiArCQlwcmludGYoIkRF
X1BPV0VSMjogMHglMDh4LT4weCUwOHhcbiIsIHByZSwgcG9zdCk7DQo+ID4gPiArDQo+ID4gPiAr
CQlwcmludGYoIlRvdGFsIGJhbmR3aWR0aDogJS4yZiBNaUIvc1xuIiwNCj4gPiA+ICsJCcKgwqDC
oMKgwqDCoCBiYW5kd2lkdGgoZGV2aWQsIHNsZWVwX2R1cmF0aW9uLCBwcmUsIHBvc3QpKTsNCj4g
PiA+ICsJfSBlbHNlIHsNCj4gPiA+ICsJCXByaW50ZigiREVfUE9XRVIyOiAweCUwOHhcbiIsIHBy
ZSk7DQo+ID4gPiArCX0NCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQgX19h
dHRyaWJ1dGVfXygobm9yZXR1cm4pKSB1c2FnZShjb25zdCBjaGFyICpuYW1lKQ0KPiA+ID4gK3sN
Cj4gPiA+ICsJZnByaW50ZihzdGRlcnIsICJVc2FnZTogJXMgW29wdGlvbnNdXG4iDQo+ID4gPiAr
CQkiIC1zLC0tc2xlZXAgPHNlY29uZHM+XG4iLA0KPiA+IA0KPiA+IENvdWxkIHlvdSBhbHNvIGFk
ZCBjb3VudGVyIC1jIGFuZCByZXBlYXQgbWVhc3VyZW1lbnQgTiB0aW1lcw0KPiA+IGJldHdlZW4g
c2xlZXBzPw0KPiANCj4gU2VlbXMgYSBiaXQgcG9pbnRsZXNzIHdoZW4geW91IGNhbiBqdXN0IHJ1
biB0aGUgdG9vbA0KPiBpbiBhIGxvb3AuDQo+IA0KPiA+IA0KPiA+ID4gKwkJbmFtZSk7DQo+ID4g
PiArCWV4aXQoMSk7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gK2ludCBtYWluKGludCBhcmdj
LCBjaGFyICphcmd2W10pDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1Y3QgaW50ZWxfbW1pb19kYXRh
IG1taW9fZGF0YTsNCj4gPiA+ICsJdW5zaWduZWQgaW50IHNsZWVwX2R1cmF0aW9uID0gMDsNCj4g
PiA+ICsJdWludDMyX3QgZGV2aWQ7DQo+ID4gPiArDQo+ID4gPiArCWZvciAoOzspIHsNCj4gPiA+
ICsJCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3B0aW9uIGxvbmdfb3B0aW9uc1tdID0gew0KPiA+ID4g
KwkJCXsgLm5hbWUgPSAic2xlZXAiLCAuaGFzX2FyZyA9IHJlcXVpcmVkX2FyZ3VtZW50LCB9LA0K
PiA+ID4gKwkJCXt9DQo+ID4gPiArCQl9Ow0KPiA+ID4gKw0KPiA+ID4gKwkJaW50IG9wdCA9IGdl
dG9wdF9sb25nKGFyZ2MsIGFyZ3YsICJzOiIsIGxvbmdfb3B0aW9ucywgTlVMTCk7DQo+ID4gPiAr
CQlpZiAob3B0ID09IC0xKQ0KPiA+ID4gKwkJCWJyZWFrOw0KPiA+ID4gKw0KPiA+ID4gKwkJc3dp
dGNoIChvcHQpIHsNCj4gPiA+ICsJCWNhc2UgJ3MnOg0KPiA+ID4gKwkJCXNsZWVwX2R1cmF0aW9u
ID0gYXRvaShvcHRhcmcpOw0KPiA+ID4gKwkJCWJyZWFrOw0KPiA+ID4gKwkJZGVmYXVsdDoNCj4g
PiA+ICsJCQl1c2FnZShhcmd2WzBdKTsNCj4gPiA+ICsJCQlicmVhazsNCj4gPiA+ICsJCX0NCj4g
PiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlkZXZpZCA9IGludGVsX2dldF9wY2lfZGV2aWNlKCkt
PmRldmljZV9pZDsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKCFoYXNfZGVfcG93ZXIyKGRldmlkKSkg
ew0KPiA+ID4gKwkJZnByaW50ZihzdGRlcnIsICJEaXNwbGF5IGJhbmR3aWR0aCBjb3VudGVyIG5v
dCBhdmFpbGFibGVcbiIpOw0KPiA+ID4gKwkJcmV0dXJuIDI7DQo+ID4gPiArCX0NCj4gPiA+ICsN
Cj4gPiA+ICsJaW50ZWxfcmVnaXN0ZXJfYWNjZXNzX2luaXQoJm1taW9fZGF0YSwgaW50ZWxfZ2V0
X3BjaV9kZXZpY2UoKSwgMCwgLTEpOw0KPiA+IA0KPiA+IFRoaXMgZnVuY3Rpb24gY2hhbmdlZCBy
ZWNlbnRseSBhbmQgbm93IHRoaXMgY29kZSBkbyBub3QgY29tcGlsZS4NCj4gPiBQbGVhc2UgZml4
IGFuZCByZXNlbmQuDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBLYW1pbA0KPiA+IA0KPiA+ID4g
Kw0KPiA+ID4gKwlpZiAoaGFzX2RlX3Bvd2VyMl9hYm94MF9hYm94MShkZXZpZCkpDQo+ID4gPiAr
CQltZWFzdXJlX2RlX3Bvd2VyMl9hYm94MF9hYm94MShkZXZpZCwgc2xlZXBfZHVyYXRpb24pOw0K
PiA+ID4gKwllbHNlDQo+ID4gPiArCQltZWFzdXJlX2RlX3Bvd2VyMihkZXZpZCwgc2xlZXBfZHVy
YXRpb24pOw0KPiA+ID4gKw0KPiA+ID4gKwlpbnRlbF9yZWdpc3Rlcl9hY2Nlc3NfZmluaSgmbW1p
b19kYXRhKTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiArfQ0KPiA+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL21lc29uLmJ1aWxkIGIvdG9vbHMvbWVzb24uYnVpbGQNCj4gPiA+IGlu
ZGV4IDQ4YzlhNGI1MDg5ZS4uNGU5MTAwZGRiMmI3IDEwMDY0NA0KPiA+ID4gLS0tIGEvdG9vbHMv
bWVzb24uYnVpbGQNCj4gPiA+ICsrKyBiL3Rvb2xzL21lc29uLmJ1aWxkDQo+ID4gPiBAQCAtMTYs
NiArMTYsNyBAQCB0b29sc19wcm9ncyA9IFsNCj4gPiA+IMKgCSdpbnRlbF9hdWRpb19kdW1wJywN
Cj4gPiA+IMKgCSdpbnRlbF9iYWNrbGlnaHQnLA0KPiA+ID4gwqAJJ2ludGVsX2Jpb3NfZHVtcGVy
JywNCj4gPiA+ICsJJ2ludGVsX2Rpc3BsYXlfYmFuZHdpZHRoJywNCj4gPiA+IMKgCSdpbnRlbF9k
aXNwbGF5X2NyYycsDQo+ID4gPiDCoAknaW50ZWxfZGlzcGxheV9wb2xsZXInLA0KPiA+ID4gwqAJ
J2ludGVsX2R1bXBfZGVjb2RlJywNCj4gPiA+IC0tIA0KPiA+ID4gMi40NC4yDQo+ID4gPiANCj4g
DQoNCg==
