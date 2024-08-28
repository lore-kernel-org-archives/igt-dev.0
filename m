Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C60C54747
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 02:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C0710E42F;
	Wed, 28 Aug 2024 02:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1hULsLDT";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8957C10E42F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 02:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mu/WqUZtl0PEp4DWW9JxFP0Fv6N/Gb3j/qFlmub2FIecYV0WBWmFHDKBrFQJnbbFRS5xJeXypvo5XKsuJhGtltXFavoARp8ZOsQzuYD2ft0bkjvRPqnh5QhWH5EA6pGGnM/Cgixhfu4Awgd/eE+NqWe6bPvuUVY3tI2OT/kpV/XcYCTsWHLKGkgYAGAyID6Kt2rEajZB+hfQE9O07RXucDC758SIreigjAYfiFehGeukZFQpDR0rvjS7AIgEjAZDDy1nDI4nJonuuYSGtSmyy7YF65y2R55xE0OwHgztAQ98jsZtom07TumnUB1Z8vCyn0aHm6XaBBaAShDyJ3qOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFIohkMtC4CCzEWT1eM82AR0q6BrWwfPtZcNM3XWXcU=;
 b=s2wDQS8zhm5ZapwCeIHTmYgH0lnfvuZwi4Qn29tBQcDfeFutOnIeWm6Eb7na635MSEuMd0sJL4ryRyfVrFfWxciTUcPtrYrfVX2OZ6+DAdAXLF6tpyt2u6qDJCHe8+YLU+my8deBWJab5Tw+Q4hcceidB0kv1POrOT9YqFHrkJfYqP9T1TVRasruoDo+LMf/LzG9O2k8dg1+VN33SrVR1MayGItx0Qo7EmIDWDJCF6M9RvMBtXBHYC3csCkvy+33JthsGzhvR6pehtASoM9X4sDQ1q1m1NM6G/z+rEtdu3sd61Pxm6HMNRbLj6cAVGTyanJgUylM2YYYDFyq8YE9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFIohkMtC4CCzEWT1eM82AR0q6BrWwfPtZcNM3XWXcU=;
 b=1hULsLDTwNwzMNSwrP0cpQ9lmIh9KbJVubvpdtdcXUQEg5RsiE8BLsBgApNCXSrUOC4Zn61r0zw+oLWsE65wVpstS31FHmfcqahAoU831VS/i33MovX7OXJCcS0UipnpobnMjNWU95D19QUNvx7tHYPR+/P3jxv+QMH+6xaC2dY=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Wed, 28 Aug
 2024 02:00:46 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 02:00:46 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue
 test
Thread-Topic: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu
 queue test
Thread-Index: AQHa+EC2l7DtmZXa8UKNcazP2RdGeLI6s7KAgAAGtoCAAS5zAIAAAm0g
Date: Wed, 28 Aug 2024 02:00:46 +0000
Message-ID: <DM4PR12MB5152F4675A22C9079370877AE3952@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240827051932.74382-1-jesse.zhang@amd.com>
 <20240827072407.hqiwzgxsmhipdgyd@kamilkon-DESK.igk.intel.com>
 <DM4PR12MB5152CD509AA9B6B9A0B1E7FAE3942@DM4PR12MB5152.namprd12.prod.outlook.com>
 <b19ad831-f022-4d2a-b3bb-e786a43e771a@amd.com>
In-Reply-To: <b19ad831-f022-4d2a-b3bb-e786a43e771a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ebf17d82-725d-434a-97cf-c7f9b8970616;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-28T01:59:19Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|LV2PR12MB5774:EE_
x-ms-office365-filtering-correlation-id: 6bd2dbb8-d846-404f-5a1c-08dcc7053b4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHVTblp0bUQzcTZPVlRiQzZpNG1idkZzcWxaYUlyYTQrV3FlWFBVM2NCQ1ZT?=
 =?utf-8?B?d2UyV2xvNXhUc1p0VHFTcGg0bFpiYlQ4TEhXeHQwTG45NUh5M3BsV1VzQi9r?=
 =?utf-8?B?M245MElMSG9pTU51K1lXN3dQMDg3TFlpZmFqK0htUDh3MFNqK3R1QzdublBV?=
 =?utf-8?B?UkFIeWhPcnMrZ3gvWnJ1Y2ppUW1jVzlscXBVMDYzSU15SUZ3eHIzM29WdmJQ?=
 =?utf-8?B?emlrZ1UvRE9PblNLT1BSNDM5Q21weUI4Y0dkMy9JdmQwSU04Zk10Y1JsOFJM?=
 =?utf-8?B?R0hNQmo5c2JBcVFJWC9uQVI3U1ZuenorWkFIWVhiRzFEcENNaGxxdDB0d2pw?=
 =?utf-8?B?V2NiL0hEY2VyNTM0OGh3K2NtMjVxUHlIYkZzYVRzaEI4Z1ZwZ0hKY093cllm?=
 =?utf-8?B?aFZEdDVNQ2JEUVRQY2x4b01kRkgzai9pYWVQYkp0V2ZZSHJzbU9sUlYzeWFH?=
 =?utf-8?B?aHFFNEIyK0p5bzY1VFFxZkFWRkczejI4S1VsSVplUTJJUzNCUGRmdWxKdUVn?=
 =?utf-8?B?dW81MjBPc2xjWkE5Y0Z2QURwcXh5ckpHb0huczZDUzdLTXdTeG9aL2NOcldB?=
 =?utf-8?B?NWFEUGdOUlVmdGxHdEVyYm1xUWllREphQzlkYU5aSWprMXkxMk1HTVZlWTZC?=
 =?utf-8?B?TlQxYWh0bzk4UUhIaWhnRUZWdm5oQmcxVlFweDJNdXd6V1JUSFAyRzhWTWQ2?=
 =?utf-8?B?QkpwbGJ0TWRhSFJoNnA1cHFKSXJKTXFBUmdzZXBTUkVCR0hMdy9pbFByRWY4?=
 =?utf-8?B?bnovSzZmYmZhQ09LU1gvM1N1WGh2eWQvQTUxTXJHckxFQk5SNHlUZVNsd3Uv?=
 =?utf-8?B?dXpVTEIyZ2N4UGtvY3pDa05GZ3Fkd2pUMjZUd3BicVRDOWxxM0d2bWFqWGlX?=
 =?utf-8?B?OFJQbGtZRytwU3RZa3AvbXFKUFRqSWljdTR1K05wWjRUZW1hVnVxMVVOalpN?=
 =?utf-8?B?NDlNUWdpbDZlTksrOUtBazFEd1NGdWdORzdvWFhPY1JDNkcxNzU4NjRtV1E2?=
 =?utf-8?B?Skw5cmsrWVgrQUlCRllCRUlEbmN6azVLK0xWR2RNTkNVc29DSllTY25NL0pC?=
 =?utf-8?B?T1V0SHJsYnRKRXNRWDFaOG9VeXR0UUpjT1N5QUpBTHNBTUtGRUY1M0dTbktD?=
 =?utf-8?B?cjlzQ3ZHT3c4OXdHVGFNdW9MbExlRm9YQ1dqTFhnMCtZK1ZUd2sxYS93RWRG?=
 =?utf-8?B?VVdzY3Rhd01vMFQ4MnZsZzlYTEd5SjZRTXQvS0NTS3gvU3NVdjlsM3pSUTRP?=
 =?utf-8?B?K2kwUVVPK0lFUE5XQVNuV1B4YzhNSmdTUGVESGtPZVY1ckxQeFpGWjllV2Ft?=
 =?utf-8?B?R0N5Y1ZRQU5wRFJxSHYxS3FBK0pWdDZOOFNXQWl5aGJXS0hDMGYwaXpjL0Vx?=
 =?utf-8?B?RFZCZHlPV0t2NDVrWHdBcXZnK09jMW5OTS9vOVdRSW1CQlJuQVd3SXJOb3dV?=
 =?utf-8?B?bzcvU01FRExKVTNMRGVjWXg4QitaeUZYVGpHYXZFbVB6L3BMVC9PVzZpYTlS?=
 =?utf-8?B?MHY1cDNSV2tQUzFEVDZUc055UlpqUTFrZjJZdmF4RkRXelZ1YWkrWkdSSkNS?=
 =?utf-8?B?OExESkhDbDJrR2pkNXdNbm81b0hjT1liL3pxQ0thM0NVY3lVeExtMHd2WHkx?=
 =?utf-8?B?V2dzNkxGcXZCeE5URFFpYitWOElHdUlzZXU3VTJNN0RSWHB4dEZwNDRTYmE2?=
 =?utf-8?B?YU9tWU5BcStMSDFmUWJEeVZ5VjJqVi9PajliMGFqVXcyT2RIaTdwOEt1Kzhp?=
 =?utf-8?B?YzJUMDh6UUdzbVZwVU55dHdFQWNucmZEYStUOUorU3ZtV1ZuNWRtK0pZL3Qz?=
 =?utf-8?B?dU9YV2FnUzVLUmpsbzNUck4wS25KaXMrR1B6Rkw5YWJ3MHF6Q0JNMEV6cW56?=
 =?utf-8?B?SnRQTDdWdHhsTnVlVVdyNTVIUWZkTGJrNmRtRkVSZmtwRkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2xDckNFT3VFK0ZObzhvRVVVdDJYQlhhSEN4RlBtb3BVakZneFJCZncrY1o5?=
 =?utf-8?B?M0R6TVBoWVBvajlTbkV4M0YwS0hEYkliS0FiODBHMUJUUDRWVHcxb1VqeU45?=
 =?utf-8?B?Q2FWSUpkdWE0Nm5QcnpiSk0xRlRvMjF2NkQxNTdyd0duejlrK3ZUb0dkbnV6?=
 =?utf-8?B?a1VqYng0YUJFN293TDhraGlpbEdmQ3pDWHp4eFB0ekhCT1NHaENiK3pzWFNa?=
 =?utf-8?B?QTRVL0YwZ0VXZTNXQ2lLODFxNXRVSHNwWDYrM2U0RGM5N0w2UXBneVJJbWF5?=
 =?utf-8?B?NEppMlU1QXorUDViaGVVMlJWUHJaNjRiVkZUNFpxdkpDYkJlQzBJMEp0aGJ1?=
 =?utf-8?B?aGdSMkhzOVVzaHNMMXcxYTNjVzB5MWR6bGMybFFabUIzTGwvR0h4VTU1NXho?=
 =?utf-8?B?MjNBc2VHVXdNQVlodm5kV3k4ZzM5OHNiT0pSS1JKTnErNUlmWkVMK2pRbGd4?=
 =?utf-8?B?NncyMHNVZnZZcTNxQkpoVlpxdCtrcEFhekNMWFZobWZlMFlqOThtU3hhSktO?=
 =?utf-8?B?ekd2OFRGVWlTeVJ3SzJ4WHRKRkV3d1JicTdUUzRsVkE4b0V0cEpBN1MxOGUz?=
 =?utf-8?B?allYbUUya2lidi9oUm1KZlkvUWtybXdNWlJrc2dlTFJZZjdWQkxOWDhOOE83?=
 =?utf-8?B?ZzBIK0FySlJKMlRhVmVjWnM5cHkwd1Nqay9Cd1ZyS3JEcjBLV3Y1T0RiUkx1?=
 =?utf-8?B?Sy9vY2ZyM2VqYThGR3dDSkRjWGN0Slh5cEVWUUNPSkhkSGpoR3BTY2VUSjFx?=
 =?utf-8?B?OFlXSkJyQUswRkNsREtzS2dYRGhRRXVEYmNiOERqQW5Sc3dEM1ZwZjFIYWRu?=
 =?utf-8?B?NXRtc3B2bUhXK1RqQXpQM1VWcGlXNWdXeDJNTGMwR3NQL04wb2FVZUpMM0JB?=
 =?utf-8?B?UWszVnRZNERxcVA2RnNyODdLWVVQWnU2QjlvNlFJMEMySEs0TnNqakZFUXpi?=
 =?utf-8?B?S21ScHNFSU1OL3F4N1FnWGkvNVE1RzJhM2FyUHlqYTdPSFMvRWpQU2ZYZGpG?=
 =?utf-8?B?RFJ2UUcxNTh6dVoyU0JaZEFGaU5IRVVWd0VvUHhySVZMZ0s1MW94c1lxRFBW?=
 =?utf-8?B?ODlZbElINk5ZREdPaXA3dHdmM1hVOTVrbzJ0bzB4UXR1VU5QdUxhTkxyNkh3?=
 =?utf-8?B?T2tlakI2SW9COUlyYmoxMXFVbzdMTUh2VVlUYkl6bHBYQUt2RHVxdnBPVHd2?=
 =?utf-8?B?MSs1N1lLUjZNVXptaUlCQVBjSkplbXA4cGdneFFlTTd4UERWdTNLRXN6WWgv?=
 =?utf-8?B?dzJvRm45ZVFQSFFxZk5BSUs3TGRRNGhyN2hMVDdPRzJrTWw0aUhkUFlBa2pl?=
 =?utf-8?B?MURIY3IzUVNDS0hUTGtFRnE0amRKTG1sTFd6eVU0YnJ6S2FnUk1CRWo1QU13?=
 =?utf-8?B?WFYvRDJ5aHpsTkdORDVNSFY1WXZQSWcvbHgzZHpqZS9TWmhlN1BIelhuZ2NT?=
 =?utf-8?B?VC9qemtIbDJqOUhBT0dna2I2WC9kRElxRTROZGJNcVY4MG9jVG5vejB2eWlv?=
 =?utf-8?B?VjY4dHQ2TDY3ZDNZeStQRVNvQTZGWUdNMGVPR1Jyc2dIZVB0OExGNkNORUxt?=
 =?utf-8?B?R0VCeno4Q2xLbTJoQTZIVmF2WXJKOWJsVG1tUThORmd0Q25pQ0s4K291RkZC?=
 =?utf-8?B?V3d3TUxCLzhRQ1RLVlpRQllYRzFGdmR6YThGU2lyeitZbEp2eXJsNGhUemJR?=
 =?utf-8?B?U29YcjVrSnJyNmswbERmVkg2ZjQvU3NWQS9EbVJzUEg3NzBqT0xxS1pTSUV3?=
 =?utf-8?B?aldQcDc2R3d0bUFQZ2FtUzJ2WWJYRjhHLzdHWHlyRlgzS1dTbzVDSkhlTXlw?=
 =?utf-8?B?WjZqdWFuTWFMeFVMaTVJME1LbUdwRDd5eUJLYjdSTHcxWlF0QUNTYkNpOW1S?=
 =?utf-8?B?M3FRL2RPb1lDWHV2R0FuK29BUDFGM3dZMXpEOGRCSlVtaU55aFBCRTNXNThj?=
 =?utf-8?B?RzJYT2VQQU1vTkFaT3VlbU8va1g4QWFyanFxWUlGOFZHNkxUMmxzMzRBbHB6?=
 =?utf-8?B?clRrQ1ovNEdIV3VFd3VCZmtyV3h4OG53QUc3VmpVc2Q4bnlnUkNMMUcrM2ZE?=
 =?utf-8?B?cXpzMXdSaWFlU2Q3TXVxaWdlRFZyYUx6bCtGZUxaalFOSmUwMnJwbWNqMklR?=
 =?utf-8?Q?q6iU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd2dbb8-d846-404f-5a1c-08dcc7053b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 02:00:46.3434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EibHmjEze0JKZgEWZGA0r2onnzE3e+F+EFgEwIozOMQbDpC0SLDWvnoNFpu46HAqop4aLsVsdMJbw1njMsqgHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgVml0YWx5LA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUHJvc3lh
aywgVml0YWx5IDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPg0KU2VudDogV2VkbmVzZGF5LCBBdWd1
c3QgMjgsIDIwMjQgOTo1MSBBTQ0KVG86IFpoYW5nLCBKZXNzZShKaWUpIDxKZXNzZS5aaGFuZ0Bh
bWQuY29tPjsgS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29t
PjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBQcm9zeWFrLCBWaXRhbHkgPFZp
dGFseS5Qcm9zeWFrQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdC9hbWRncHU6IGZpeCB1bmtub3cgdGVz
dCBpc3N1ZSBmb3IgYW1kZ3B1IHF1ZXVlIHRlc3QNCg0KSGkgSmVzc2UsDQoNClRoZSBjaGFuZ2Vz
IGxvb2sgZ29vZC4NCg0KQ291bGQgeW91IHBsZWFzZSByZW1vdmUgdGhlIGNvbmRpdGlvbiBjaGVj
ayBmb3Igc2hfbWVtPyBUaGlzIGNoZWNrIGlzIHJlZHVuZGFudCBiZWNhdXNlIHdlIGFscmVhZHkg
aGF2ZSBpZ3RfcmVxdWlyZShzaF9tZW0gIT0gTlVMTCk7IGluIHRoZSBpZ3RfZml4dHVyZS4NCg0K
DQp3aGVuIHdlIHJ1biBzdWRvIC4vdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldCAtLWxpc3Qt
c3VidGVzdHMsIHRoZSBzaF9tZW0gaXMgTlVMTCwgYW5kIGl0IHNob3VsZCBub3QgY2FsbCBzZXRf
bmV4dF90ZXN0X3RvX3NraXAuDQoNCmlmIHJlbW92ZSB0aGUgY2hlY2sgZm9yIHNoX21lbSwgaXQg
d2lsbCBoYXZlIHNlZ21lbnRhdGlvbiBmYXVsdCwgbGlrZSB0aGlzOg0KDQpqZW5raW5zQGltYWdl
LXVwZGF0ZTp+L3dvcmtzcGFjZS90b29scy9pZ3QtZ3B1LXRvb2xzLzZjb2RlL2lndC1ncHUtdG9v
bHMvYnVpbGQkIHN1ZG8gLi90ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0IC0tbGlzdC1zdWJ0
ZXN0cw0KYW1kZ3B1LUNPTVBVVEUtQ01EX1NUUkVBTV9FWEVDX0lOVkFMSURfUEFDS0VUX0xFTkdU
SA0KYW1kZ3B1LUNPTVBVVEUtQ01EX1NUUkVBTV9FWEVDX0lOVkFMSURfT1BDT0RFDQphbWRncHUt
Q09NUFVURS1CQUNLRU5EX1NFX0dDX1NIQURFUl9JTlZBTElEX1BST0dSQU1fQUREUg0KYW1kZ3B1
LUNPTVBVVEUtQkFDS0VORF9TRV9HQ19TSEFERVJfSU5WQUxJRF9VU0VSX0RBVEENCmFtZGdwdS1D
T01QVVRFLUJBQ0tFTkRfU0VfR0NfU0hBREVSX0lOVkFMSURfU0hBREVSDQphbWRncHUtR0ZYLUNN
RF9TVFJFQU1fRVhFQ19JTlZBTElEX1BBQ0tFVF9MRU5HVEgNCmFtZGdwdS1HRlgtQ01EX1NUUkVB
TV9FWEVDX0lOVkFMSURfT1BDT0RFDQphbWRncHUtR0ZYLUJBQ0tFTkRfU0VfR0NfU0hBREVSX0lO
VkFMSURfUFJPR1JBTV9BRERSDQphbWRncHUtR0ZYLUJBQ0tFTkRfU0VfR0NfU0hBREVSX0lOVkFM
SURfVVNFUl9EQVRBDQphbWRncHUtR0ZYLUJBQ0tFTkRfU0VfR0NfU0hBREVSX0lOVkFMSURfU0hB
REVSDQpSZWNlaXZlZCBzaWduYWwgU0lHU0VHVi4NClN0YWNrIHRyYWNlOg0KICMwIFtmYXRhbF9z
aWdfaGFuZGxlcisweDE3Yl0NCiAjMSBbX19zaWdhY3Rpb24rMHg1MF0NCiAjMiBbX19pZ3RfdW5p
cXVlX19fX3JlYWxfbWFpbjEwMjUrMHgyN2VdDQogIzMgW21haW4rMHgyZF0NCiAjNCBbX19saWJj
X2luaXRfZmlyc3QrMHg5MF0NCiAjNSBbX19saWJjX3N0YXJ0X21haW4rMHg4MF0NCiAjNiBbX3N0
YXJ0KzB4MjVdDQpTZWdtZW50YXRpb24gZmF1bHQNCg0KVGhhbmtzDQpKZXNzZQ0KDQpXaXRoIHRo
YXQgYWRqdXN0bWVudCwgdGhlIHBhdGNoIGlzOg0KDQpSZXZpZXdlZC1ieTogVml0YWx5IFByb3N5
YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+DQoNClRoYW5rcw0KDQoNClZpdGFseQ0KDQoNCg0K
DQpPbiAyMDI0LTA4LTI3IDAzOjU0LCBaaGFuZywgSmVzc2UoSmllKSB3cm90ZToNCj4gW0FNRCBP
ZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCj4NCj4g
SGkgS2FtaWwNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBBdWd1c3QgMjcsIDIwMjQgMzoyNCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IFpoYW5nLCBKZXNzZShKaWUpIDxKZXNzZS5aaGFuZ0BhbWQuY29tPjsg
UHJvc3lhaywgVml0YWx5DQo+IDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPjsgRGV1Y2hlciwgQWxl
eGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4N
Cj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWct
dF0gdGVzdC9hbWRncHU6IGZpeCB1bmtub3cgdGVzdCBpc3N1ZSBmb3INCj4gYW1kZ3B1IHF1ZXVl
IHRlc3QNCj4NCj4gSGkgSmVzc2UuemhhbmcsDQo+IE9uIDIwMjQtMDgtMjcgYXQgMTM6MTk6MzIg
KzA4MDAsIEplc3NlLnpoYW5nQGFtZC5jb20gd3JvdGU6DQo+PiBRdWV1ZSByZXNldCBkb2VzIG5v
dCBleGl0IHByb3Blcmx5IHdoZW4gZXhlY3V0aW5nIHVua25vd24gc3VidGVzdHMuDQo+PiBCZWNh
dXNlIG90aGVyIHByb2Nlc3NlcyBhcmUgc3RpbGwgZnVuY3Rpb25pbmcuDQo+Pg0KPj4gSXQgc2hv
dWxkIGV4aXQgdGhlIG90aGVyIHRocmVlIHByb2Nlc3NlcyAodGVzdCwgYmFja2dyb3VuZCwgYW5k
DQo+PiBtb25pdG9yKSBmb3IgdGhpcyBjYXNlLg0KPj4NCj4+IENjOiBWaXRhbHkgUHJvc3lhayA8
dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+DQo+PiBDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDxqZXNzZS56aGFu
Z0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jIHwg
MTAgKysrKysrKystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9hbWRfcXVldWVfcmVz
ZXQuYw0KPj4gYi90ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0LmMgaW5kZXggNjAyMDhlMDg1
Li44NTQwOGUzZmYgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0
LmMNCj4+ICsrKyBiL3Rlc3RzL2FtZGdwdS9hbWRfcXVldWVfcmVzZXQuYw0KPj4gQEAgLTcwLDYg
KzcwLDcgQEAgc3RydWN0IHNobWJ1ZiB7DQo+PiAgICAgICBpbnQgY291bnQ7DQo+PiAgICAgICBi
b29sIHN1Yl90ZXN0X2NvbXBsZXRlZDsNCj4+ICAgICAgIGJvb2wgc3ViX3Rlc3RfaXNfc2tpcHBl
ZDsNCj4+ICsgICAgIGJvb2wgc3ViX3Rlc3RfaXNfZXhpc3RlZDsNCj4+ICAgICAgIHVuc2lnbmVk
IGludCB0ZXN0X2ZsYWdzOw0KPj4gICAgICAgaW50IHRlc3RfZXJyb3JfY29kZTsNCj4+ICAgICAg
IGJvb2wgcmVzZXRfY29tcGxldGVkOw0KPj4gQEAgLTE0OCw2ICsxNDksNyBAQCBza2lwX3N1Yl90
ZXN0KHN0cnVjdCBzaG1idWYgKnNoX21lbSkgIHsNCj4+ICAgICAgIHNlbV93YWl0KCZzaF9tZW0t
PnNlbV9zdGF0ZV9tdXRleCk7DQo+PiAgICAgICBzaF9tZW0tPnN1Yl90ZXN0X2lzX3NraXBwZWQg
PSB0cnVlOw0KPj4gKyAgICAgc2hfbWVtLT5zdWJfdGVzdF9pc19leGlzdGVkID0gdHJ1ZTsNCj4+
ICAgICAgIHNlbV9wb3N0KCZzaF9tZW0tPnNlbV9zdGF0ZV9tdXRleCk7DQo+PiAgfQ0KPiBEbyB5
b3UgcmUtaW1wbGVtZW50IGlndCBpbmZyYT8NCj4NCj4gSGkgS2FtaWwNCj4NCj4gTm8sIGluIHRo
ZSBxdWV1ZSByZXNldCB0ZXN0LCB3ZSBzdGFydCB0aHJlZSBwcm9jZXNzZXMgKHRlc3QgcHJvY2Vz
cywNCj4gYmFja2dyb3VuZCBwcm9jZXNzLCBhbmQgbW9uaXRvcmluZyBwcm9jZXNzKSB3aGVuIHJ1
bm5pbmcgYW55IHRlc3QgKGluY2x1ZGluZyB1bmtub3duIHRlc3RzLCBzdWNoIGFzIHN1Y2ggYXM6
ICBzdWRvIGFtZF9xdWV1ZV9yZXNldCAtLXJ1bi1zdWJ0ZXN0IGFtZGdwdV90ZXN0eHh4KS4NCj4N
Cj4gVGhlIGtub3duIHByb2Nlc3MgY2FuIGV4aXQgd2l0aCB0aGUgb3RoZXIgdGhyZWUgcHJvY2Vz
c2VzLg0KPg0KPiBUaGUgdW5rbm93biBwcm9jZXNzIGNhbiBleGl0LCBidXQgdGhlIG90aGVyIHBy
b2Nlc3NlcyB3aWxsIG5vdCBleGl0Lg0KPg0KPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBv
ZiBvdGhlciBwcm9jZXNzZXMgZXhpdGluZyBpbiB0aGUgdW5rbm93biBjYXNlLg0KPg0KPiBSZWdh
cmRzDQo+IEplc3NlDQo+DQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+DQo+PiBAQCAtMzI3LDYgKzMy
OSw3IEBAIHN0YXRpYyB2b2lkIHNldF9uZXh0X3Rlc3RfdG9fcnVuKHN0cnVjdCBzaG1idWYgKnNo
X21lbSwgdW5zaWduZWQgaW50IGVycm9yLA0KPj4gICAgICAgc2hfbWVtLT5nb29kX2pvYi5pcCA9
IGlwX2dvb2Q7DQo+PiAgICAgICBzaF9tZW0tPmdvb2Rfam9iLnJpbmdfaWQgPSByaW5nX2lkX2dv
b2Q7DQo+PiAgICAgICBzaF9tZW0tPnN1Yl90ZXN0X2lzX3NraXBwZWQgPSBmYWxzZTsNCj4+ICsg
ICAgIHNoX21lbS0+c3ViX3Rlc3RfaXNfZXhpc3RlZCA9IHRydWU7DQo+PiAgICAgICBzZW1fcG9z
dCgmc2hfbWVtLT5zZW1fc3RhdGVfbXV0ZXgpOw0KPj4NCj4+ICAgICAgIC8vc3luYyBhbmQgd2Fp
dCBmb3IgY29tcGxldGUNCj4+IEBAIC00MDUsNiArNDA4LDcgQEAgc2hhcmVkX21lbV9jcmVhdGUo
c3RydWN0IHNobWJ1ZiAqKnBwYnVmKQ0KPj4gICAgICAgc2htcC0+c3ViX3Rlc3RfY29tcGxldGVk
ID0gZmFsc2U7DQo+PiAgICAgICBzaG1wLT5yZXNldF9jb21wbGV0ZWQgPSBmYWxzZTsNCj4+ICAg
ICAgIHNobXAtPnN1Yl90ZXN0X2lzX3NraXBwZWQgPSBmYWxzZTsNCj4+ICsgICAgIHNobXAtPnN1
Yl90ZXN0X2lzX2V4aXN0ZWQgPSBmYWxzZTsNCj4+DQo+PiAgICAgICAqcHBidWYgPSBzaG1wOw0K
Pj4gICAgICAgcmV0dXJuIHNobV9mZDsNCj4+IEBAIC0xMTI4LDcgKzExMzIsNiBAQCBpZ3RfbWFp
bg0KPj4gICAgICAgICAgICAgICAgICAgICAgIGNyZWF0ZV9jb250ZXh0cyhkZXZpY2UsICZhcnJf
Y29udGV4dF9oYW5kbGUsIGNvbnN0X251bV9vZl90ZXN0cyk7DQo+PiAgICAgICAgICAgICAgIGVs
c2UgaWYgKHByb2Nlc3MgPT0gUFJPQ0VTU19CQUNLR1JPVU5EKQ0KPj4gICAgICAgICAgICAgICAg
ICAgICAgIGZkX3NobSA9IHNoYXJlZF9tZW1fb3Blbigmc2hfbWVtKTsNCj4+IC0NCj4+ICAgICAg
ICAgICAgICAgaWd0X3JlcXVpcmUoZmRfc2htICE9IC0xKTsNCj4+ICAgICAgICAgICAgICAgaWd0
X3JlcXVpcmUoc2hfbWVtICE9IE5VTEwpOw0KPj4NCj4+IEBAIC0xMTM2LDcgKzExMzksNiBAQCBp
Z3RfbWFpbg0KPj4gICAgICAgICAgICAgICAgICAgICAgIHByb2Nlc3MsIHNoX21lbSwgY29uc3Rf
bnVtX29mX3Rlc3RzLCBpbmZvWzBdLmh3X2lwX3ZlcnNpb25fbWFqb3IsDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgJm1vbml0b3JfY2hpbGQsICZ0ZXN0X2NoaWxkKTsNCj4+ICAgICAgIH0NCj4+
IC0NCj4+ICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShpcF90ZXN0cyk7IGkr
Kykgew0KPj4gICAgICAgICAgICAgICByZXNldF9yaW5nc19udW1iZXJzKCZyaW5nX2lkX2dvb2Qs
ICZyaW5nX2lkX2JhZCwgJnJpbmdfaWRfam9iX2dvb2QsICZyaW5nX2lkX2pvYl9iYWQpOw0KPj4g
ICAgICAgICAgICAgICBmb3IgKHN0cnVjdCBkeW5hbWljX3Rlc3QgKml0ID0gJmFycl9lcnJbMF07
IGl0LT5uYW1lOw0KPj4gaXQrKykgeyBAQA0KPj4gLTExNTQsNiArMTE1NiwxMCBAQCBpZ3RfbWFp
bg0KPj4gICAgICAgICAgICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgICAgICAgfQ0KPj4gICAg
ICAgfQ0KPj4gKw0KUGxlYXNlLCByZW1vdmUNCg0Kc2hfbWVtDQoNCj4+ICsgICAgIGlmIChzaF9t
ZW0gJiYoICFzaF9tZW0tPnN1Yl90ZXN0X2lzX2V4aXN0ZWQpKQ0KPj4gKyAgICAgICAgICAgICBz
ZXRfbmV4dF90ZXN0X3RvX3NraXAoc2hfbWVtKTsNCj4+ICsNCj4+ICAgICAgIGlndF9maXh0dXJl
IHsNCj4+ICAgICAgICAgICAgICAgaWYgKHByb2Nlc3MgPT0gUFJPQ0VTU19URVNUKSB7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgd2FpdHBpZChtb25pdG9yX2NoaWxkLCAmbW9uaXRvckV4aXRN
ZXRob2QsIDApOw0KPj4gLS0NCj4+IDIuMjUuMQ0KPj4NCg==
