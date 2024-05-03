Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333ABC4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 00:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B824010F90A;
	Fri,  3 May 2024 00:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTmqYY77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D6810F90A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 00:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714697042; x=1746233042;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hNfKDvixOhTMqmgi9L1smABCeWZDoVWycwZdxZcVqns=;
 b=jTmqYY77l+gHxyB5MYB7U++tER9fBG83d6uHqZY36t/5C45q1BzjnmV5
 d6RZ2sD9jJ6WpxMwlPf8OfUVYx+6kl52ax/zj6W4eCAtTfDFeteuYW/XH
 sTSVIccegYIsVuS4UhIeVQrqulj8cYR6vh/sw0pueEK0gDzC3ILnm5ZZ5
 usetX+Jw/nkWV+zr32+TZYbn5ymztt0NBbs0Nb+NRpfTdHQQIOI9r8nyK
 8DZeEgnQ3Wv/5GXeYeYK5ReROCY6/UpEzg4c/EvOZD2NLa1fz1+LW3M+x
 AXgOgZaNziLXoYwbyXPdFfCBQ+wk/qrEkjJ6xCQRxB9SS5bWiRjXlWqkU Q==;
X-CSE-ConnectionGUID: JWkttsCxTaSG93Qq+dbalA==
X-CSE-MsgGUID: KPbxyjaAQxOgKjS0GefWpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="14306605"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208,217";a="14306605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 17:43:58 -0700
X-CSE-ConnectionGUID: 0kAyq8VXTLaxFQchngTnVw==
X-CSE-MsgGUID: a+OJ4O8dQZy3H2Q8sM+PPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208,217";a="50492287"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 17:43:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 17:43:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 17:43:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 17:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OciYQXUu1hIngezrflH81V/+aJz+2A9hZofaQRaciBcqX6TBFcpi7rkl+hkeCJIC7cB7AoZwZeOZBoaHs/uPduQ7Ma/VC1XYy7EHJCy04X0DH2q5nCJj7ns8QC9Qp5feZ+7/zp73/XbTmzTX1kb7HmJtpsreQKr5I91PpoIvaR9qRdstHoUq2RuPNA4LvQKWspTTyl8W50RIdnQHBsWYUXTuNfj8T2IGsl8vJwtlysJNSF0Vdo1LZ2EimkrUELvbCgJ+ryd7N2N9t3Se+0RlOsPIdSQj+VNfOqakuCiGBTJYh361RAsK6DVIr0T5QyjAI380+zeiAgNGBdqdnhxrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6RNHeiAf//H04rvfPtkxD712hAMjeUEKlPBmGh/KIs=;
 b=d+ChqvyMOashF5DfbfZ1XDBLar25mSdtcL+YcgvIu0y/QDNjRZ6HxMUrFtqAWvoYz97kmgtPfa1rCV/POQb352SR5/0cDGQjmip+aFrDfsua2zyYGforlL//dN4k3NilQgqtWhXHEggrxMqK3ABPRR/3kBNDDdMCYmKgmZtkokEUu128Ehw7e/RnZWRDXJ6vY4J2Ch/yqcuQpVgyxqSvVOO+t0g33I1Pikh4LVZBCJ1T7ol01v/MI1Mj71n3jFJi/+0HfcGLHmqzUtG4pVv8J/qzRUqqPQwYfghJAUR53TzYuOz55TESXwct8TrDw6Td6EoOH1J7TjKCGfuPfp9dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 00:43:34 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127%4]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 00:43:34 +0000
Content-Type: multipart/alternative;
 boundary="------------bDptGFJOXHaqjlcVoJlQP1py"
Message-ID: <90b324c8-bdad-44e0-8232-d35ff7171369@intel.com>
Date: Thu, 2 May 2024 17:43:32 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fgt=5Ffreq=3A_Check_for_RPe_freq_updates?=
To: <igt-dev@lists.freedesktop.org>
References: <20240425195657.3638599-1-vinay.belgaumkar@intel.com>
 <171407763556.1668155.12576594446513071033@8e613ede5ea5>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <171407763556.1668155.12576594446513071033@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f03dfc-f4d0-4c3b-8ef5-08dc6b0a0fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFpyU2UzOE0xekZsY1RsY3MxU2gyVkNvNThISWFWN0c1RlU4ZG0wYnVRRTlP?=
 =?utf-8?B?SlFhYWg3cVFiOXVCMzhlak1BZm8xQStNSU54RUF6U3JjOGlYNVNNZ2tmTXpq?=
 =?utf-8?B?cTFTZjIybmtaWEtmZ21iUXoxVG40TllaRGFpbFhPejA3WlpNcHFNc2xyQ1Zi?=
 =?utf-8?B?cDdLVCtldG84WkpDQzk1QW85dXhFTGxEdlR6dTJsb0RzOXVKa3dIeGUrUUpU?=
 =?utf-8?B?R3pvNkJHdE5kaTVUZ0dBWjdxS1V3dms2cktHQ0NDNVhrVU9ZSkN6SDRJMGtS?=
 =?utf-8?B?eXdFSjFhM0NxSmhSKytJT21zVGJSZVhtcnVTNG4wN0lncUwxRytzTTBFUWdx?=
 =?utf-8?B?YVNvRzhJY2xaTm5PN0dRdWpESDZLNFpmYnozbUNWWG5POHlKeUxqUzNRNWxO?=
 =?utf-8?B?dGhMa1NLZkQ0S1RSenpOeXlyQlBSKzhhTlkvRkMzWjlROEUrcW11MnJ1a3hs?=
 =?utf-8?B?OEQ3aWg5V1BKZ0FWMFpHT2p6cWJjSVh5Yk44Vys1NjNCd25NY1pCWjNrdGZU?=
 =?utf-8?B?MGMyZ28zUGtUemdzUWp2eVRHVGJ1TzE5OS9RK2k2enpoaW9DYWhpWUpjd0kx?=
 =?utf-8?B?Q1pOaGdLY1BPVjE4Nk5aMTljaE5ubXgrcVVibWdjU0pTRk41dVA5bGVuWUNB?=
 =?utf-8?B?MDdjN1dhQVg2VTFOZnRXbE1aU2JmcGFIQ2FFL3Mwd3BlVkRjS28xN2xUR1lv?=
 =?utf-8?B?NjlaOWFqMW11ZkwvWTF5bGRrcnk2SzI5MVdXeXF4SEswcHQrLzJ0Q3NPN3Js?=
 =?utf-8?B?K2M0Vng3R3Fsc3k0UmRUc244ZmtmTGFTM2UveEdWYlBEOTNEdzAvaDU5aUpX?=
 =?utf-8?B?Rk1JSTAweGpzRFphRDFkSCsyTTFubzAxRlFqT0l0MzkyZUs3MDhnUGlHS3VR?=
 =?utf-8?B?Smt4WTMybUxhZkl2akU1OTVBZmpNSElYUW94SDY1SnpETnIxQmQ1SDgrSmJQ?=
 =?utf-8?B?dm9sMVZvbVVDZ0xObEd4dnFmdHQydmlldEFQZGNDSUovNjhoRHlSNWpkNWF2?=
 =?utf-8?B?SldBYWJWQUNxNkZ0MHE3VW5qQ29raC9KOGNqUzVjODBQTm9mYzdmTElDMHRQ?=
 =?utf-8?B?OUFnTW0rOG1EcGdFeUE1MmJ1U3Q3VHhIVVdJMGRPRHJNc01ySzZBdTV6Zk9P?=
 =?utf-8?B?Qlh0a2lFNWQrNkU1UFZ2ZHFESkw0N0tnemhKRjI1aDYvZys3dTE0WERLVVlS?=
 =?utf-8?B?dUdWRnhNRVUyeUp6TnE3aHFZbzNqWGpNZ2VKeUJxZWpoUDUwNGdLQmordkdt?=
 =?utf-8?B?dlhCWTZraXRZcTk4WVp6UzlobnphbkVUQk4vSEFIUUxDS3lQTFpzWm8vZnBZ?=
 =?utf-8?B?WEJaQTc5dTN2MXJobDErM2UvNGJkYmNCK2ViemxkNE00UjFDaktIVUQ3eUtC?=
 =?utf-8?B?Sm9mbGhUVjh1WEEzMGpwUnh6R0pZZkU1cC9pQ2hBSDBNS3V1VFlFVXYzVjZP?=
 =?utf-8?B?eEZkR21qTmh3Nlh5S21RVWxYY1RsVHdUQnJpa2w1bTBGSEhTVER4OHVlOURp?=
 =?utf-8?B?d2RxamNaUU1TYmRKV0RoQ1hoMW1XL2x3bGRtNDhRWHhORGR0MXVMK0ZjT2VI?=
 =?utf-8?B?YXlxejVBSzVGQXdYZ0ZIbW9tbDQxQXcxdVZDdE5pa3A1SE11T0NMQmU4Mkw2?=
 =?utf-8?Q?Cdf89V5oKc8Wn3/zfPN2Kd/7xFo/LXY4WSPsizYmUB44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVB2WFpIU1Mwdm1jSkhYaWZhaEduQXEzakNJdmZBdWhsYnpKa1Jlb3BNV3NS?=
 =?utf-8?B?N240eTF5K0JWbzZPdlpVNkd2b1ZFZ3hkZzZ3WXlYaHhGOEsvVHREWDJqWllo?=
 =?utf-8?B?eDFRbHVOeXpuQlBQZ3p4S1hZbkhoUVBqbXpMMzRFQmpvakVYdnJVZ3ZISFdy?=
 =?utf-8?B?S0QzOTV4SXFYdGtYNGJudDdIeXB0MHhBUUZlRVNKYUc5ZXRQSmUxd2NaNGZK?=
 =?utf-8?B?RmIyQktQaVhtTXpiL1IzbHVYajlWUVUxQUJrNHFrQXBBZy9UckhJV1FJSGZl?=
 =?utf-8?B?L1JKQ1lzNXRkajJEbE5SQ2NsZWVlc0liUlhYM1hHa1BCTHJTY04vK2YxWTAy?=
 =?utf-8?B?N2pORlk1RnN4RjRGbFMweURvbGtBT2lLYnRMQmxKYkZndVhzS01YejlBc05a?=
 =?utf-8?B?SEZUUnBjaE9VaE9Eekp0dENZcUM4QXdvUVJEd2tkQlVCaGpQYXJxTTgreHVG?=
 =?utf-8?B?d3lkTWdGT29DeWZRVDdXY0pqVDc2eTVFYldhYk8wUkxFRDVJY3pqT1VhMUcr?=
 =?utf-8?B?R1lPMEZPdFBEenRyc2Zsa1ZrZ0twcTFna3dTTTk2Z25SMWZhRWZ2cWUrZy94?=
 =?utf-8?B?YTNZRDRKSDMzRDh5QjVyc3UxTWhDZkNRL0Yyb3Z2UGY4Z2I4bDFOTWFyVHFI?=
 =?utf-8?B?b3VqUG41ZXBKbEU5MWdzVWhJMFVRRXRHNkpoWE55d1A5dFBsMmhHVzlKYzdk?=
 =?utf-8?B?Z0UxOWlOMWlncTBnOW9MOWRkRjBxZkptb3hLdktWQkU0cS9kMlRXalpzWml6?=
 =?utf-8?B?M3VEMCtIRkQreWYwNDBXc280S0Q4NCt0M0RINkZycnp5WHY3OTB0alVuekND?=
 =?utf-8?B?b0dSQUo5YmE1dWdvZlpPemxUVWZkUUNNOUNXQTVtdkNpYVB0d1UycUZBZ0sv?=
 =?utf-8?B?RTlqZThCQUJoNDhJS0dRZmtTYVBqWVBFZkZFZEJORTl2cnY3VEJ0bTRJcDVh?=
 =?utf-8?B?WkVwbzlHbkRJUmE0bjU4VWNsMUdwNVZpYlZSNEtWOGZDbnNOV3R6ZkdES1pL?=
 =?utf-8?B?QWMyajNFQVNvdDBYYUdqRnYwTXA5VkpET1pSWWpBcjZQZUFjYzRyL0kreFRO?=
 =?utf-8?B?NnJ4UlZQa1VkS1F2ZnBLOTF5a0ppSGxDUEE2TGtGUEI0Ujlud3FKQ05FdUNy?=
 =?utf-8?B?SktROG9IRHFYb2hSbHdQMlJOc3RvUkt2SWFlWENQY25KOGFSK1N0RnlUQzNO?=
 =?utf-8?B?WGpTUXo2blpOcnVqVy85QWZUZzk2Q00zdHdVeW01OE9hM05Rd2NVdXN1VVk2?=
 =?utf-8?B?c2pGT1M2Tzh4bjczeEExWmkzaXo1QzYyek9WYzJwL1V5OTJmaWo5RHB2NkNO?=
 =?utf-8?B?bUNuU0c5dDlGQnh6WG9HUXFPTEhEanRqRTR2TDNCa0VUc05aYkVYeU5wdEtR?=
 =?utf-8?B?MUp5WHUrRzBJSVhNTW1QREY1ZTZPKzNkRzZWSFhkQTRINzBUVEpONjN1elZ0?=
 =?utf-8?B?bmtSV3FmMTFJN2l2aWNsWFgxTmhaMWQxRVdzWmhSWE5NNjg3amNYMVdNOU1F?=
 =?utf-8?B?L3Y1VURvMStScGM2aFhhRVZjeEFNdXIvbUxjYlNRdFF0R3Z5R2hpS2djTlUw?=
 =?utf-8?B?S2VOdTUxL0V3dWVEWVI1aXNHdWlDdnZNTjIwNmxkRlhkTmJTalRDdlVWdTd1?=
 =?utf-8?B?T0JQdHBzdndtcXdDbDlQdmo4QnJkU2RteVdzby96VkpDSGxNZkdKdHJYczRt?=
 =?utf-8?B?cnNuWkdjNzJMQStEbjlYUHNWeUszZzFKcThxSEg5TEh5T1ZwclFtcDc3dlNU?=
 =?utf-8?B?Qm9xbHRyMU54WWp5QmN2RkdCZTgzeVZMaG9rcHZlVTI3RmtJdjkwZStZbVB2?=
 =?utf-8?B?cWhrNW00STlxdmY0WExEczdHOVVZSWdYZmlyakY2dm83bTI0ODJCMm5hRjda?=
 =?utf-8?B?M29HdXFmTi9mNmgwcTA3UFFnN2c4VnFaTFJhWURDV2xIUVlQOFA5VXBxeW9V?=
 =?utf-8?B?SUJXWk5KWEVEVys0aUJBdHR6SXRVdjY4QmxuaWV4ZnQweU5LMTdxenh1enFr?=
 =?utf-8?B?Y21Obi91OVNwNVNhenBsVTF2c2pSaUhFeWUxaU9WTGdWQ0dzVTNuaGJySDZL?=
 =?utf-8?B?QVE2eUJ0enNPMFgxWktpTE5CYUZtNzZvdm5IWSt3NDJSQ3pGWFhjVWFZS2JB?=
 =?utf-8?B?WlloZERxYm1tTG5NSGhtTU9WY0ZoUUEyYlJ0U3hhZm15ZXZQY29TOXVhNlJO?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f03dfc-f4d0-4c3b-8ef5-08dc6b0a0fcd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 00:43:34.0517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGPDZH3FKCirxIlQiAJAK7CiYAPbhY4E5o+Ubce/cm+4ZSyPBIXdihfpWQrChNSixHW+0E7Nh5tTIQyDfF3+N73zmZIrWgsKXYTmEh8+CgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

--------------bDptGFJOXHaqjlcVoJlQP1py
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 4/25/2024 1:40 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_gt_freq: Check for RPe freq updates
> *URL:* 	https://patchwork.freedesktop.org/series/132926/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html
>
>
>   CI Bug Log - changes from CI_DRM_14657 -> IGTPW_11073
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11073 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11073, please notify your bug team 
> ('I915-ci-infra@lists.freedesktop.org') to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html
>
>
>     Participating hosts (41 -> 39)
>
> Additional (1): bat-arls-3
> Missing (3): bat-adlm-1 fi-snb-2520m fi-bsw-n3050
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_11073:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@gem_exec_parallel@engines@fds:
>       o bat-arls-2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-2/igt@gem_exec_parallel@engines@fds.html>
>
Doesn't look related to the change.

Thanks,

Vinay.

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11073 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#10213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap@basic:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_mmap@basic.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_render_tiled_blits@basic.html>
>         (i915#10197
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197>
>         / i915#10211
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211>
>         / i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_tiled_blits@basic:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_tiled_blits@basic.html>
>         (i915#10196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_tiled_pread_basic:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_tiled_pread_basic.html>
>         (i915#10206
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206>
>         / i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@i915_pm_rpm@module-reload:
>
>       o fi-kbl-7567u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>
>         / i915#8585
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585>)
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@i915_pm_rps@basic-api.html>
>         (i915#10209
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209>)
>  *
>
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html>
>         (i915#10200
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200>)
>         +9 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#10202
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202>)
>         +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_dsc@dsc-basic.html>
>         (i915#9886
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html>
>         (i915#10207
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207>)
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o fi-kbl-7567u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         (i915#8585
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585>)
>         +82 other tests dmesg-warn
>  *
>
>     igt@kms_psr@psr-primary-mmap-gtt:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +3 other tests skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#10208
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208>
>         / i915#8809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809>)
>  *
>
>     igt@prime_vgem@basic-fence-mmap:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#10196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-fence-read.html>
>         (i915#10212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-read:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-read.html>
>         (i915#10214
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o bat-arls-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-write.html>
>         (i915#10216
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_exec_fence@basic-busy@ccs0:
>
>       o bat-arls-2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/bat-arls-2/igt@gem_exec_fence@basic-busy@ccs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-2/igt@gem_exec_fence@basic-busy@ccs0.html>
>  *
>
>     igt@gem_lmem_swapping@basic@lmem0:
>
>       o bat-dg2-11: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html>
>         (i915#10378
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html>
>  *
>
>     igt@i915_selftest@live@execlists:
>
>       o fi-bsw-nick: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>         (i915#10594
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7824 -> IGTPW_11073
>
> CI-20190529: 20190529
> CI_DRM_14657: 92b848b529903fb99d21168491692474aae4872c @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11073: fc14ad950ade7db2f9fe9a09f3dfee544644e969 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7824: 7824
>
--------------bDptGFJOXHaqjlcVoJlQP1py
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/2024 1:40 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:171407763556.1668155.12576594446513071033@8e613ede5ea5">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_gt_freq: Check for RPe freq updates</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/132926/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/132926/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_14657 -&gt; IGTPW_11073</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11073 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11073, please notify your bug team
        ('<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>') to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html</a></p>
      <h2>Participating hosts (41 -&gt; 39)</h2>
      <p>Additional (1): bat-arls-3 <br>
        Missing (3): bat-adlm-1 fi-snb-2520m fi-bsw-n3050 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11073:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@gem_exec_parallel@engines@fds:
          <ul>
            <li>bat-arls-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-2/igt@gem_exec_parallel@engines@fds.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Doesn't look related to the change.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:171407763556.1668155.12576594446513071033@8e613ede5ea5">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11073 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318" moz-do-not-send="true">i915#9318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213" moz-do-not-send="true">i915#10213</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@basic:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_mmap@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197" moz-do-not-send="true">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211" moz-do-not-send="true">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_blits@basic:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196" moz-do-not-send="true">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_basic:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_tiled_pread_basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206" moz-do-not-send="true">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@module-reload:</p>
          <ul>
            <li>fi-kbl-7567u: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982" moz-do-not-send="true">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585" moz-do-not-send="true">i915#8585</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209" moz-do-not-send="true">i915#10209</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200" moz-do-not-send="true">i915#10200</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202" moz-do-not-send="true">i915#10202</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886" moz-do-not-send="true">i915#9886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207" moz-do-not-send="true">i915#10207</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812" moz-do-not-send="true">i915#9812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>fi-kbl-7567u: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585" moz-do-not-send="true">i915#8585</a>) +82 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-mmap-gtt:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208" moz-do-not-send="true">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809" moz-do-not-send="true">i915#8809</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-mmap:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196" moz-do-not-send="true">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212" moz-do-not-send="true">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-read:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214" moz-do-not-send="true">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>bat-arls-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216" moz-do-not-send="true">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_exec_fence@basic-busy@ccs0:</p>
          <ul>
            <li>bat-arls-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/bat-arls-2/igt@gem_exec_fence@basic-busy@ccs0.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-2/igt@gem_exec_fence@basic-busy@ccs0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@basic@lmem0:</p>
          <ul>
            <li>bat-dg2-11: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378" moz-do-not-send="true">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@execlists:</p>
          <ul>
            <li>fi-bsw-nick: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-bsw-nick/igt@i915_selftest@live@execlists.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594" moz-do-not-send="true">i915#10594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-bsw-nick/igt@i915_selftest@live@execlists.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7824 -&gt; IGTPW_11073</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_14657: 92b848b529903fb99d21168491692474aae4872c @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_11073: fc14ad950ade7db2f9fe9a09f3dfee544644e969 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_7824: 7824</p>
    </blockquote>
  </body>
</html>

--------------bDptGFJOXHaqjlcVoJlQP1py--
