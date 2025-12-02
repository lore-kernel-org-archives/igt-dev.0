Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFFCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 05:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA6110E520;
	Tue,  2 Dec 2025 05:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfrGPzkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084DF10E520
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 05:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764653310; x=1796189310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eLq3/wgYO+x/ODiV/HhZSBb/TemBl1np1Z+Hm9iPR1A=;
 b=AfrGPzkwV1qrIY0N6EpwFM9wyhtw0Jtbk8UwpQoI6BR/xe8KjrwAx8u9
 0NMAH3CHNkH6LifdjB/ucyW5GZD0WOeotXF9ZsDgVWAzZrvDpbsUbZIkC
 bWV8QU56hXyDMHFNUWPmcmzKZq4VD6s7LLqmMXOK4vWXBHSnNvtZjJTdA
 cXgQIqQU26Rusa/Eu4wkTs0Fn58LMBGMVU2YbLWOSR4OA3Edqj1F/QbrU
 WI5BJ6hBqjbF/wDB1aqc3c/ky+sz1BJFN/TpyIosUfg3Xeb0q3Ph3duC+
 z89/FqEwCKd2DpptvalNUrIkUKmLr6dWbrWW6X26CCGwwahGWK61gI6/z w==;
X-CSE-ConnectionGUID: LxWUL91NRBmi/5HJ+xjVtQ==
X-CSE-MsgGUID: hWpeONH+Ql6UuljHcJfUZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66776053"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66776053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:28:30 -0800
X-CSE-ConnectionGUID: 17CGJEszRdWq5Qsqpt8byA==
X-CSE-MsgGUID: 4wFfasgjTLuoUWO/F4exWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198652451"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:28:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:28:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 21:28:29 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAd1Kcu1oTow5x0/nbZbn8m0fytxFYTNTT9/WC3SoHmrhJFzJYWxrRtFYElxeZdPjQTtDtKJ/eM7fiUh2T1P8lkpyl6gCTNljYaisHmeifB8wmQ5uuIgJ+tqqEBQ4T/h2GtpqV7KRv2xui96jBHG5x4aLI+V8dYXKw1SwnnhH9N27cOHdjSU9cLPLkhKEF22zGufq99CgYMyngBGlfvLI1eq7FK41leHpQQSVBL9A3uNhPyiGaJI9lzTnsZpNYZcbvctV3F3D7jMoZXtsFPLNFP+p/zlIR3XaoWm3W/5fUVxpm2ezvUngzKeNdeVoeD6JateFm+Cq9iIJmc8BkJPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvDipGnEb5Dg+rRhj2VwWXJPP4lKqAZLjpL5KTbMZ1E=;
 b=H1MUaxhntKYHT3GJOAaHSjcvdEAwW0Hgn7ZJuStzYejfnMSbyWH6Ti3vB5Sv/sfLfyW/R3nMQxZRJepbEdHowTKzy03/hOHIJpsOlaXcvlXfe9npx74pIk9glGYJZLCHcDwTCJHJUxm1PcKtQoa2N7JokMmoxXgA7MFKG//+tiAM85bpUcQcR1WKHDf5FUJxr6a20aa9+tutSc470CUDgevvK9EEM5RM5j24+KznfVzVt+BRUe3ZnpoPL6x7021nH/zzWVoNw4wGOtRBu5aSv7jpRT+TVJ+tKhi+liiZ8aK3BkToCZ0WKQ0iW6naLPXDg1oZJpkOWvR/Aw1JkXPw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB6817.namprd11.prod.outlook.com (2603:10b6:930:63::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 05:28:26 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:28:26 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 15/19] tests/intel/xe_exec_multi_queue: Add priority
 test
Thread-Topic: [PATCH v2 15/19] tests/intel/xe_exec_multi_queue: Add priority
 test
Thread-Index: AQHcWpr74UFsiFtzPkCVCGb7KOMmyLUN45pQ
Date: Tue, 2 Dec 2025 05:28:25 +0000
Message-ID: <CH3PR11MB84349E22D52AA457ED3C60058DD8A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-36-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-36-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB6817:EE_
x-ms-office365-filtering-correlation-id: ba638c06-efbc-4237-3b29-08de31639e36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tmYGVF1zT/ZM40YED+tYpUT26BseY6BRezXKqL87m3/WK0R03Frppqh6Digu?=
 =?us-ascii?Q?T2M3HgPN51NAg3JwvP7jBiN/+TENXmHP9qz8iynYOqOqfpquuaqKVOzx3tTY?=
 =?us-ascii?Q?nRFLCRHzjoAX1tDbX7crj4egJpqYCRaOgaWbIE4mbZDgw++ZaaTQNQx6qUuf?=
 =?us-ascii?Q?z7LZg2ayg7+9I4Xdc+j5R4Zv+Ne76m2QkvxLw3Ce5ca3jIyMKx6qv1rqyDuV?=
 =?us-ascii?Q?4/ZyTuJ0GaRhGRAvs/WwaOtfxsXrAJPv8UCz1GaEPQV6GdG3eNoHzWu/2hzu?=
 =?us-ascii?Q?b05MXWwmlYjyhKMsgVpT5xzNWo+BGtQSDqQGuGhCAhTs95CO1Ruy0c7QZeOb?=
 =?us-ascii?Q?U1g0bhS2fsA9opfrud++ZwHOMt7WqXodQ0Jrfe03JEDcRPZ9PFyJOF7zIki8?=
 =?us-ascii?Q?YyJSp9eSNz8zh1XBOTdP0N1fyL+lu1HjUbgvsQDW4KeQE6/A7UqA/M5Sz18J?=
 =?us-ascii?Q?Y8WojuhLCR8OdyD1prA3o++y7P0hHhY01ujZsTNH1TX0t6slT1Hjk3rqgrYf?=
 =?us-ascii?Q?y130Gm2aYyo3I/0xaf1f5IfIDFkPwGdM187EDZKF6wkgPX/O7sDTymIcvm9M?=
 =?us-ascii?Q?cR+3LDHH28RX99/1zgF9VJwxAGQAfc16nK7wCs/0US3wSxA+YpYlrakA7OV7?=
 =?us-ascii?Q?KWkOPqsr7WKjgbDWwgU4tvmJ3GLIpY0ttP2m3PQncDuw4U1WZVpv+EbP7Zj1?=
 =?us-ascii?Q?YL9QzI+F/8WIBAENpcFjz9FnPMcYdfXs+w/4xg75DFHdnxT+R17jrP4AvCGw?=
 =?us-ascii?Q?1IoafgZ67ZnLw5Iti4DuuetKRGU8ICUSKqBMlFxSL0ZlQhUkadROb7pf+PL7?=
 =?us-ascii?Q?YjmgxuVdkkErFmgZq4w/6uHEJ2MQHJXlLSkhA2A5eTtRHmAZXrS9LT4oCEce?=
 =?us-ascii?Q?SS9A+yjbBfix2hdmXM3Z4QcN7mi+0dobqswyA3a+/+6bGrz9PP6uyo0nwDUr?=
 =?us-ascii?Q?hfsgZufhF0lXKbUv6iUNgfbAiqzDBJk9xPf0fWH6QRp4cpcqP1mmGWHDLSbO?=
 =?us-ascii?Q?+UWLmxhMssOzglNu2NTz7ae+wPpY6XexDX6MJ7P2MPAzZLwz7daYHJ1S4ynU?=
 =?us-ascii?Q?1AJ1Jkze+g/Ehab1C2EH4kkU0olRVFXGknvjCDR8CT4N+cXMzGMAgy1SCW/7?=
 =?us-ascii?Q?pwd2azXURft6jOJjEJam1lOXZzMUu290fADq/SB0wYnmSo9VaL2Hru+P42xc?=
 =?us-ascii?Q?7eMQZbcTyanzdXNK4uP8bOqo9ymKZzn+XPD9JI6MJPOo+S/ekN6d0rF76wb+?=
 =?us-ascii?Q?u0ytG8dtfoKGqeFVO96aHNDUXCjVZVEt7uSKNw+mxrHLJj0jXKOd7DlSjeiN?=
 =?us-ascii?Q?AzbJJO9AWWrW/gKvoZRMdBvOiuMqsks1G3slxOU3MfW+V5EynKU8MGhNvD+i?=
 =?us-ascii?Q?qJLs04o/gRxsUAM/gAmHK6fMt6VS5LfRCKBPJ1ak3szMyPXBdhWBTBARK1Ez?=
 =?us-ascii?Q?JgpHhLUoTxpPR4qExvZmol2Hb16JdHOtt1p8bTI1Tp/rH/zSYflMp3g92LSp?=
 =?us-ascii?Q?eEdekcVy1jMXbQf/OnSicKfYdJDymru1CUiX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ETmujz1PtriKxQ/UJ562OsmhLzrMhIxtX3c5Bgam+FwhFvYBNPto5c0Zhwnr?=
 =?us-ascii?Q?H4r0owZAcLF2L4CaqwRe7pIucZ8M/q4bd6t74v5VzZXwYbxe72OpSVGI6rC8?=
 =?us-ascii?Q?6K2j72aeYCmqFdb2IkYdtSxPQJuLYeVy8oRe9w6hxcpKhFvsmqdvHXpxI0So?=
 =?us-ascii?Q?Eehix89a1J0gLGhjOG+gDgxR3dtnafde7qGcmmNrtkDL/Uz07EUboSRKTcbh?=
 =?us-ascii?Q?TwMcUdQdoz6/vlfclL7rtprh3axRuQJOmMC38K+F45LStNVTQuCPxkhmHPbF?=
 =?us-ascii?Q?aMpVUViKgahmeoWYrHU1WhR62tIcQ4PSoX61MrLDrPCX6/HRrkFOK8SOUDLX?=
 =?us-ascii?Q?BuwDFHLH/ykVrZrd0heY1wwbgna16CZzEB0FD7QTLEiPJ3aSjGrvx5MfAJQE?=
 =?us-ascii?Q?017AkqOq5G4Qk3m9hADMvmtpMYQnGCyi+HjYpih+FVmeALyH4hXd3WRJ9SUv?=
 =?us-ascii?Q?WYOEC2zNmPI4aO/3IeiSoxLO6m+URhCc7T7nQzMEW6flfoP1PnRvpcORObtn?=
 =?us-ascii?Q?kYScMX1yUNukvqSiRXH0UOUSoNVlmha4twTMvDyfjSZRHZaGF6fmo8BHfh8b?=
 =?us-ascii?Q?zS4n0Ajs+HxzekzFE6kjqN9VkRXnjB0kn8TdWgq7E88KA+Q//ClIBIQpvvdB?=
 =?us-ascii?Q?InQnx5GhMwm225XrlJTusURe/hfl1XyuNp/UyE+Ekb6ZCckDxosXvYbw1cBp?=
 =?us-ascii?Q?bdgwym79UHKGk9XKJ+n45RzJFMonN0THtVf306UewEO1Qar+ETcpgHzdKpWC?=
 =?us-ascii?Q?EX8B+UBXz3L0LJroOJgY5OP/Na1pKQW40JlbnqO7PbzPNFxpgOolHlBotc7y?=
 =?us-ascii?Q?dAp6dEQ1CPP5vsbVOMXrqzEaDZuroN4Z7MsWBhLJaFF9DFs622IIUA6zHqeN?=
 =?us-ascii?Q?SaUCLhqExCwbul1Mr3lr3Jy3fs0kRoVSJzQybTpnALosra7ldelSWeiqFrfN?=
 =?us-ascii?Q?D2NVPQStAfN2sgKOJ3DSOIUbENfKnWsumY8Ooe8yRu31TQUBNC+X0KZAKvbH?=
 =?us-ascii?Q?nNcdbQ3GgKOhiU2Wuyn7wv5C3IT+rUTDJ2ZqtdlIpl3+3l0I0QDcQMCdZAxT?=
 =?us-ascii?Q?CLaGGUCr71QNuInJN7lRzEc9R+V/MHSF7wc0GQZhhZhaYPdy4B5fU/1/9DY6?=
 =?us-ascii?Q?04cnpt880FQRLXwNjSO201CY32buZIGmCAryhb78p9WJZ9n8Xw7ZbhgS8Y0c?=
 =?us-ascii?Q?OrUEP4R5BcXSD/iqzAKWv7xlJq8KIO+/S6iwrh8gVNYDiXBae5fksXM92Pyi?=
 =?us-ascii?Q?jJTghuH4RPYpmawmt3t+alAXrBd+XvndI5xxediGpBtMPBQM/w2RMnBVpEtR?=
 =?us-ascii?Q?3hbGQQBxnXWVVtXpXR+fDax3tvvqPPW1Iop5DX+4I8whFAE0wcqWzyFrvIVy?=
 =?us-ascii?Q?579Mv684Q38X6nbMXdhuc5TDFGml/rinuogXv8FTGzcA++kMu+eLVQA85i7G?=
 =?us-ascii?Q?7oZvhfhn3D91A/KfsDMhepkMiIeqSokB4oJUK4Fh1W8Ia8N130mB1gvagwZv?=
 =?us-ascii?Q?EUWNbV9nW+sPWDE7MJnyWkPVtvOyo/YXMR82IYfcPkqjsScsUFp/cLJQMLpJ?=
 =?us-ascii?Q?+S4NOqalvzmEbHmBscrGW+DkfI7GMGrG5T3tZhBBNs2JUUgKz3cB959Uj4Fa?=
 =?us-ascii?Q?OcBkG3vTJOBOmfklZvt+D2AaRtqjzLPvOan2Z5kmd0I3YV7+e+QXh7U3LzOE?=
 =?us-ascii?Q?bSB7Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba638c06-efbc-4237-3b29-08de31639e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 05:28:25.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avuk2CfdGTOBb4Y8NhEPEmMMl5Qz9AZAjAT5xnbMHq78ZGdO3dIeryQqIwyH7z9Kk7vBtyGB7nb8JGgXdlw50On1UULffr8E4FvX1ohDzNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6817
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 21 November 2025 09:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v2 15/19] tests/intel/xe_exec_multi_queue: Add priority t=
est
>=20
> Validate intra queue group priority setting.
> Validate that a higher priority queue in a queue group can preempt the lo=
wer
> priority queue of the group.
>=20
> During a queue switch, the currently running queue is always switched out
> without regard to its priority.
> The priority is only a factor in determining which other queue of the gro=
up
> will be scheduled in.
>=20
> v2: Macro and variable rename (priyanka)
>     Remove simulation related code (Priyanka)
>     Remove hardcoding of number of bits.
>     Use BASE_ADDRESS macro for address (Sai)
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 203
> ++++++++++++++++++++++++++++++
>  1 file changed, 203 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index df65ccafb..06e898a47 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -13,15 +13,18 @@
>=20
>  #include "igt.h"
>  #include "xe_drm.h"
> +#include "igt_core.h"
>  #include "lib/igt_syncobj.h"
>=20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>=20
>  #define XE_EXEC_QUEUE_PRIORITY_LOW	0
>  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
>  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
>  #define XE_EXEC_QUEUE_NUM_PRIORITIES	3
> +#define XE_EXEC_QUEUE_PRIORITY_N
> 	(XE_EXEC_QUEUE_NUM_PRIORITIES * 2 + 1)
>=20
>  #define MAX_N_EXEC_QUEUES	64
>=20
> @@ -33,6 +36,7 @@
>  #define INVALIDATE		(0x1 << 5)
>  #define FAULT_MODE		(0x1 << 6)
>  #define SMEM			(0x1 << 7)
> +#define WAIT_MODE		(0x1 << 8)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -212,6 +216,201 @@ test_sanity(int fd, int gt, int class)
>  	__test_sanity(fd, gt, class, true);
>  }
>=20
> +static void
> +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
> +		unsigned int flags)
> +{
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value =3D USER_FENCE_VALUE,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	uint64_t vm_sync =3D 0, addr =3D BASE_ADDRESS;
> +	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
> +	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
> +	uint32_t vm, num_queues, num_queue_priorities, bo =3D 0;
> +	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] =3D { 0 };
> +	int64_t fence_timeout =3D NSEC_PER_SEC;
> +	size_t bo_size;
> +	/*
> +	 * Q1 - Q6 are used for the priority test.
> +	 * Q Priority =3D id % 3
> +	 * 	QID	Q1 Q2 Q3 Q4 Q5 Q6
> +	 * Priority	 1  2  0  1  2  0
> +	 * The Priority 1 and 0 are the same priority so hw should pick Q with
> priority: Q2, Q5, Q1, Q3, Q4, Q6
> +	 */
> +	int expect_order[] =3D {0,2,5,1,3,4,6};
> +	uint32_t already_in_order =3D 0;		// bitmask to record Q started
> info
> +	struct drm_xe_ext_set_property multi_queue =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> +		.value =3D DRM_XE_MULTI_GROUP_CREATE,
> +	};
> +	uint64_t ext =3D to_user_pointer(&multi_queue);
> +	int i, j, sleep_duration =3D 1;
> +	void *bo_map;
> +
> +	num_queue_priorities =3D XE_EXEC_QUEUE_NUM_PRIORITIES;
> +	num_queues =3D num_queue_priorities * 2 + 1;
> +	igt_assert(num_queues <=3D XE_EXEC_QUEUE_PRIORITY_N);
> +	igt_assert(num_queues <=3D sizeof(uint32_t) * 8);
> +
> +	igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
> eci[0].gt_id,
> +		 eci[0].engine_class, eci[0].engine_instance);
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bo_size =3D xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
> +
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id)=
,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo_map =3D xe_bo_map(fd, bo, bo_size);
> +	for (i =3D 0; i < num_queues; i++)
> +		spin[i] =3D bo_map + i * sizeof(*spin[0]);
> +
> +	/* Use the default priority for Q0 because we are explicitly waiting fo=
r
> it below */
> +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	multi_queue.value =3D exec_queues[0];
> +
> +	if (flags & DYN_PRIORITY) {
> +		for (i =3D 1; i < num_queues; i++)
> +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> +	} else {
> +		struct drm_xe_ext_set_property mq_priority =3D {
> +			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +		};
> +
> +		multi_queue.base.next_extension =3D
> to_user_pointer(&mq_priority);
> +
> +		/* Create secondary queues with increasing order of priority
> */
> +		for (i =3D 1; i < num_queues; i++) {
> +			mq_priority.value =3D i % num_queue_priorities;
> +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> +		}
> +	}
> +
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> +
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> fence_timeout);
> +	vm_sync =3D 0;
> +
> +	for (i =3D 0; i < num_queues; i++) {
> +		uint64_t spin_addr =3D addr + i * sizeof(struct xe_spin);
> +
> +		xe_spin_init_opts(spin[i], .addr =3D spin_addr, .preempt =3D
> true);
> +		sync.addr =3D spin_addr + (char *)&spin[i]->exec_sync - (char
> *)spin[i];
> +		exec.exec_queue_id =3D exec_queues[i];
> +		exec.address =3D spin_addr;
> +		xe_exec(fd, &exec);
> +
> +		/* Wait for job on Q0 to start, allow other queues to run to
> completion */
> +		if (!i)
> +			xe_spin_wait_started(spin[i]);
> +	}
> +
> +	sleep(sleep_duration);
> +
> +	/*
> +	 * Expect the job on other queue to not get scheduled while the
> spinner
> +	 * on q0 is not waiting on preempt condition.
> +	 */
> +	for (i =3D 1; i < num_queues; i++)
> +		igt_assert(!xe_spin_started(spin[i]));
> +
> +	if (flags & DYN_PRIORITY) {
> +		/* Assign increasing order of priority for secondary queues */
> +		for (i =3D 1; i < num_queues; i++)
> +			xe_exec_queue_set_property(fd, exec_queues[i],
> +
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +						   i % num_queue_priorities);
> +
> +		/* Wait for priorities to take effect */
> +		sleep(sleep_duration);
> +	}
> +
> +	/*
> +	 * Trigger a queue switch by making the spinner on q0 to wait on
> preempt
> +	 * condition, allowing job on q1 to get scheduled and finish. When
> we end
> +	 * the spin[0], it triggers the CFEG to perform a queue priority
> arbitration
> +	 * rather than a full context switch out. Consequently, in both
> semaphore
> +	 * (WAIT_MODE) and non-semaphore scenarios, a priority check will
> occur.
> +	 */
> +	if (flags & WAIT_MODE)
> +		xe_spin_preempt_wait(spin[0]);
> +	else
> +		xe_spin_end(spin[0]);
> +
> +	/* Wait for jobs to get scheduled */
> +	i =3D 1;
> +	while (i < num_queues) {
> +		for (j =3D 1; j < num_queues; j++) {
> +			if (xe_spin_started(spin[j]) && ((already_in_order &
> (1 << j)) =3D=3D 0)) {
> +				start_order[i] =3D j;
> +				xe_spin_end(spin[j]);
> +				xe_wait_ufence(fd, &spin[j]->exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[j], fence_timeout);
> +				already_in_order |=3D (1 << j);
> +				i++;
> +			}
> +		}
> +	}
> +
> +	/* While ending spinner on q0, bring it out of preempt wait */
> +	if (flags & WAIT_MODE) {
> +		xe_spin_end(spin[0]);
> +		xe_spin_preempt_nowait(spin[0]);
> +	}
> +	xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
> +exec_queues[0], fence_timeout);
> +
> +	igt_debug("Order\t Actual\t Expect\n");
> +	for (i =3D 1, j =3D 0; i < num_queues; i++) {
> +		igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i, start_order[i],
> start_order[i] % num_queue_priorities,
> +                         expect_order[i], expect_order[i] %
> +num_queue_priorities);
> +
> +		/* The priority 0, 1 are the same, so we can skip the
> comparison */
> +		if (expect_order[i] % num_queue_priorities <
> XE_EXEC_QUEUE_PRIORITY_HIGH &&
> +		    start_order[i] % num_queue_priorities <
> XE_EXEC_QUEUE_PRIORITY_HIGH)
> +			continue;
> +
> +		if (start_order[i] % num_queue_priorities !=3D expect_order[i]
> % num_queue_priorities)
> +			j++;
> +	}
> +	igt_assert(j =3D=3D 0);
> +
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> fence_timeout);
> +
> +	for (i =3D 0; i < num_queues; i++)
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +
> +	munmap(bo_map, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: priority
> + * Description: Validate queue priority setting
> + * Test category: functionality test
> + */
> +static void
> +test_priority(int fd, struct drm_xe_engine_class_instance *eci) {
> +	__test_priority(fd, eci, 0);
> +	__test_priority(fd, eci, WAIT_MODE);
> +	__test_priority(fd, eci, DYN_PRIORITY);
> +	__test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE); }
> +
>  static void
>  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement,
>  		  int n_exec_queues, int n_execs, unsigned int flags) @@ -
> 707,6 +906,10 @@ igt_main
>  			xe_for_each_multi_queue_engine_class(class)
>  				test_exec_virtual(fd, gt, class);
>=20
> +	igt_subtest_f("priority")
> +		xe_for_each_multi_queue_engine(fd, hwe)
> +			test_priority(fd, hwe);
> +
>  	for (const struct section *s =3D sections; s->name; s++) {
>  		igt_subtest_f("one-queue-%s", s->name)
>  			xe_for_each_multi_queue_engine(fd, hwe)
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.43.0

