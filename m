Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48332C36008
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 04:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD9210E069;
	Tue,  1 Apr 2025 04:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s2yNqVTE";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF1B10E069
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 04:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jySTkXBwokidVnJ0jbyJhtqyWPbAedYRAAj92EhutPNZt5RixWT+SMSwU/Gig7aFdVv1u49hwRUI4SDS3bFCp+mrYzTmXuI3g0LwkaGY2JFz13JUaU3Zid3Hlqzw4mlTva2UfLjeQwR1uuqSvdvaL5AVvKLDFrnSojGqSKuGP6tx6qCbDXlpwtruButGzdscX0z7YEy5rgJanf2RHPc+DAiRdowYM5V6yujyUE4DL2Q9N87RiKOyg9elZDCuGmEzafvUkbDDnEkcaVRvXEOnGWad3M2T21vTCEhsKw0iuFYw6VwVE2Fxy69CjVS5r3KE07Dgv+D3cjQVOdDjrvSVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HMxXeHiWlaMV9wVmed4V9TFJSR5TdbFO4LfG1lZOFc=;
 b=ltT6KUQG9OQLT+IVT3qt9e+sDSmBRwF0wQ5KFO+Csq2U0M14qxJwxoD6LMLdLQEAvwhFMD8TjD+RE7rAlMazkfjdclmrHTHyl36nIkdHIZENaM9JXeFQ6LUr5elwk6C5q5jhiOM26lnhd7vA33IxVlHF9J7WCYw2U2xLlZInk3S4nEG7zMn4IGE0kwj9afpg61cYVdv7BeldaHn0MUIHbU5CYCOy2EN+HNosT5ab7sZYdht5dWPkAf3wgu1vcKWmxOC7fKP0RQwR8R9BIGssdaKr26DXwtg24cCmLaO3OgaNPNivhM944EEVSjTWXYnLuWnxTb59kh+yShQRS7YWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HMxXeHiWlaMV9wVmed4V9TFJSR5TdbFO4LfG1lZOFc=;
 b=s2yNqVTExXw6MtRUp2VWxnfc/HWMAUTClEuOL0O03R5CtLk0XiOt4FxXW6bG8oK0OHONSI/GIrXsyizzVnfJWGjlSc8uew27W8cUKDBwBXPyRjehcs5oxgTE3CucTw6dSnUpnBtJe2P84mqWG3uDkqeTAJyMsX+xCnsDj/LsfKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB6695.namprd12.prod.outlook.com (2603:10b6:510:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 04:50:31 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 04:50:30 +0000
Content-Type: multipart/alternative;
 boundary="------------8q0RVhDW8ccrxlC0DF5Jz5M2"
Message-ID: <9dee9fed-7cdb-4b06-88c0-3402a83346d6@amd.com>
Date: Tue, 1 Apr 2025 00:50:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/19] drm-uapi/amdgpu: sync with drm-next
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-2-sunil.khatri@amd.com>
 <9c9978cb-0193-447a-935a-2f146a84f9a1@amd.com>
 <BL1PR12MB575353FEDC1AC8B937EBD05793AC2@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <BL1PR12MB575353FEDC1AC8B937EBD05793AC2@BL1PR12MB5753.namprd12.prod.outlook.com>
X-ClientProxiedBy: YQBPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::42) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: b1420ead-060d-4071-0f3a-08dd70d8bacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0NZSnc0cUlvSWpxd3BQdUhoMHIzUHc2UVd0MmlpYllsb3NRbUFuZ1dhWXNQ?=
 =?utf-8?B?eEJ5RkJqcTB0MER3dVhTcncrS1ArcGxqYUpaM3NpbGNZMTdpbVYveThCQ3VQ?=
 =?utf-8?B?b1llSjE5S0o4bkFmVjJITUx6RFpncXgwSitITmREdEZPVXFCblNkcHRSVURN?=
 =?utf-8?B?dUpQd1duK0hteFhLRm40SlVaZXdQMkQrbk53T1dwUTYrbUg5S2pod0JsQjFh?=
 =?utf-8?B?RkFId1NDSVB3YjB0eVE3VXBCbkJEc2RLcTNXVkVCNEdmNGVGb1lQV2lFS1ZI?=
 =?utf-8?B?VXhhUjdTUmZTaktmNFN0WXFOektiOEZYMTJITGlweU8yRUNVRVdxdEJGd01N?=
 =?utf-8?B?OXJRNFpRMmI4Rm1LcjlYTkxsUGRXT1JLdjZPWjREV0J3dUZXSVM3QTluVFV3?=
 =?utf-8?B?N0FRUG5ZTS8vRkMxNjU0TWlPRzNoMDFlVTByVmljQ3l4UStoVUVoTzc1YUp3?=
 =?utf-8?B?UGVmUGIxK1p0aDdVMXpQQ0VJZ1Nsa3BPQ0xHWmJUdHFjRCt0Nm9LT1p4Mi9i?=
 =?utf-8?B?SW52YXg0TlRPMkxQZWtxYlZJSFdXZ3JFbmtPL25uZkFNVU9SRis3ZHgvSUpt?=
 =?utf-8?B?VkpBMTc1YTJCRGNEZjZtVmdldFpoNnpYV0NlaGhHZ2NqazFsdE54ZDhSWCsz?=
 =?utf-8?B?MEdXVm5RM3hZSzNDWWpHU3NROGgwc3R3bmRjclIzNm5ZWWRwNDZLWUJWblV5?=
 =?utf-8?B?c0YrNWNZVS9hcXU1U042WmtHM3dUNnV0OEd2aGo5OTJsczVleGtCdjNPZGp5?=
 =?utf-8?B?Y2hGelhySDBnNmFhMEFmbTd3Qkg4Kzc1cUN4aCtBSGhMQnhybG1KeFk1K3Zz?=
 =?utf-8?B?dmkyMXJybVBBcHZaQitwUUhkazU2UFZXQ0VLQzQzSVVuU2NUaWVOMU5JZjVX?=
 =?utf-8?B?am9hc0hIbnZDSzh0TExaRlgyRTZ5Ly96RGFGT1M4bldYM2F2YTVPcG9ONnY0?=
 =?utf-8?B?QWZ5dFFSdyt0dlBKQnJ4L1NhcWVzRHJiUGw5NHhIbjlRZWJlUk5vbVhudEhp?=
 =?utf-8?B?MEZSdC9mZ2VEOXVwTXpOMnUwaHNqWXhVbUVCajE1LzhpZXVVcUFSZ0p0QTF2?=
 =?utf-8?B?WTBpVVdKY2YyYXVQbTQzdFRlQkV2dkRIZmg3TmFMSE1ldm5KWUNoY2FMeUwy?=
 =?utf-8?B?dDlYYWtSTHErUHdEM2xsbi93djZNTjNzZzNVSWIzb3lOdmY4SGNsVjZ4clYw?=
 =?utf-8?B?b0QyeERNOHY4WWFXa0ROTmZpQjlBdHEydUpnNDdoSlRPN3JtM1VmeFFRVzh1?=
 =?utf-8?B?OXl6US8reWtYQnBITGU0SW9uTTl6bGxjemNMNEFEK0k5SlJKMHZaUW1lQWw4?=
 =?utf-8?B?aWRWNGFTREtSSW9SWjBUdE9uMFJsbHNGbGNzYVdWUkNkeTBCRG9uek85T3lP?=
 =?utf-8?B?T1l6enFWUUZHVTk1Zk9LMFo1S0JkdmxiUmZoeEdFUWx0YUQ3UW45TFFTekFJ?=
 =?utf-8?B?N1hnZnB5MUNQbEsvOGFTcHkwdkhLZXJlSmJqMkpjSENWNjNUaTFnVkt1Slov?=
 =?utf-8?B?SWxjYTFwWWljeVZFcDdYNzRpRWVPUndoaXBkRGI3S2dEQ0RkdlBiTlRxaVZm?=
 =?utf-8?B?UThVWll4MDJLYldnakJOUVdadWNGZVduNWNPZWxDdXhySnBINFlMd0c5SFVH?=
 =?utf-8?B?Z1oxbXNTam5SREthL0MrdHN0aEgvbGdWeC9GTW90STUrNHJFM0pVYUlTdTRU?=
 =?utf-8?B?Wis5MTF1cmxOUUNFYVN0YmF5aGFMVUFUM0hXVkFtM2xSdjBRWGJOYjhTSXlL?=
 =?utf-8?B?YlN3YzNVWFRYclVpWkY2VjJVdCs1UllBb25vRFpmR2UwcnBwN2JrdWNXV2lx?=
 =?utf-8?B?TGtUN3lVWTlHcmU2Wkk4RW8xQng3REdvd2p1M1pBRUt1RlFzTnIreWhsMnVv?=
 =?utf-8?B?WGJFUXhaRXFsSGxwTHo1VXFiZCtGbmlURnhIdE5zdFlOb0Z3OEovTlNiVU1P?=
 =?utf-8?Q?1jKwQCsxBpM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkY4ZHpHdXFBa0NTVkhMMUE5cGxQV2tiMXFRVzhHbTg3NlRsWjdBNXJmMUVN?=
 =?utf-8?B?b3dEZ2RyUmNQcm5ndFdSa1AwRVRsQjk1L1hDSVBxbGwrc2VhRXFsdC9UMWZB?=
 =?utf-8?B?amFtRUJGWFgrME9aK0cwQnV1RTNRTXhLMk93QjNSWS9RU2E4ODYvS0dpSnB1?=
 =?utf-8?B?UHF1MExxRmZqVXJrTW1NUEFyTmIrdGdIenYvV2E4M0lRSUVyQVNGYjJGSGEx?=
 =?utf-8?B?K25mTzhpV1VObDN3ZElKclF0MkJxbzNsQS9ScElkc3EwTFZ6SnBhSHB6Vlcz?=
 =?utf-8?B?VUN2R3ZCQVFaQ29iQzhyc09XU3dXc1h5OWNVT0FQVXhQOVRFR1pUQ2srQUNS?=
 =?utf-8?B?R1J6MEgzQ1c1ZElpVkE5Q01sTmlDOTk5ZWhBZi9mSStqeGVNSlFFQVNtd1Q5?=
 =?utf-8?B?QWkvVzNYR1pvTlFGVjJIbW1iWEVKWWhXaVNTM2ZZRmZOSk56dE5HYnN3V0lN?=
 =?utf-8?B?K3UyY0R5a3I5UDlpKzExNnpnZlpVU1Z6TlhIOHB4NWdIYzRqcHE5aU1Qa0I5?=
 =?utf-8?B?V3YwcURGNDhSVWNHNHQrSWFJRkRtUC8yd01TbWVPZGRFWVhCTWQvbzBIWWNo?=
 =?utf-8?B?b3A1UWUvV1RRNDd1MnUwcWNSdFR6OEcrZVIzZ0RXMkJLS2dITmVEVDYrRGpX?=
 =?utf-8?B?QnY4Qk4wNmVURnhxWHVsaVZxWHEyNjNEc2FVdXJnRFhSUWdqQmZOQVVqcWZn?=
 =?utf-8?B?R05HQ3RrdWszU3VuSzMyd1gra2h5UUE3ZnJvQlY1NW03enpqaEY5cXFmTUtI?=
 =?utf-8?B?SXZualdoUHV5MzJDd2FyNWVMOXpFMmdxbU9DQkp4M3RFdE1idUdrckNhbWIz?=
 =?utf-8?B?VXNyTEQxQ0RIUHM0NEVKQjg2SUpEbmdwQjZtUm1iK0NlbEFIa1E1Qk1WYWpE?=
 =?utf-8?B?UmNuVHJIUXVWVnYrbWJhT3B1WTYrcm4zR1dYank2ZGxqbUVnbWpSRmtLbGhE?=
 =?utf-8?B?eEhVYWU3VXZCaXNWMGdHeUxCSjM1NzNqYTRMUktNNEdvRjVvSnVvMUNpcldj?=
 =?utf-8?B?UUNNbFgxOFp0WE9rRVZHVUpvQWUyalVLbzVtKyt3anhsbnlBVTgwL2Q5T0Fz?=
 =?utf-8?B?Z0UwMGg1b2NiR1U4Y2V5MDFtMWdXTGZVMTFnZ1ZrTkNHSnZkOVFIUmJxcWVW?=
 =?utf-8?B?RU1KemdETDdKUHE2SCs2OHFaSjBMN0pIZjcwL3p3SzdtUGFPVjU0UzVBRzgy?=
 =?utf-8?B?bmZNUitzRlJ3OTB6SkwvVkVkd3JNRmxCRXZqbm9ob2M4anZ3bTFHVWRGcElV?=
 =?utf-8?B?RktxNUdBa0svVzdwYXJCWk1PanUyU3Z4UFYrUXEzWkxqVnpMbmRaaHZIcW1B?=
 =?utf-8?B?VVJhNHBpUHR6UUszZGRzK0lRbnRwWGpUK0VlWVZLU0VVQVB6RStHUWJJNUI2?=
 =?utf-8?B?WkhLVy9kV09NaHdlQ3RSMFJTTkpOazZZalpHbDBGT3pOeGxRK3A2T1A2MDRv?=
 =?utf-8?B?alYyckNpQWpsUUM4V3NPMXh6N1piV054Y1RTQzZFak96NkFTempEZVd2ZC9F?=
 =?utf-8?B?WGl5alRHbmwzUGNOdGhIUUYrSDd4SXFaQzJFSkd5dU9aZUZEemxMNExKUGRM?=
 =?utf-8?B?ZVY2bVB2WkkvdWNxVVBiSi9XTzBPc1JUYUZDcndaRGRRY0Z6dllzQ3BJSGVh?=
 =?utf-8?B?VU1GUWV4SldvN3dFdVJFTFZ2UEk1SWR4KzlmZ1Jkdmx1Vzk5c0xsZHZERTJU?=
 =?utf-8?B?UHVhclZHNHpaQWlLR3U0b0g1VlZYUEgvOXJKL0dvU0hWYVo4NFMyVFVQMFdW?=
 =?utf-8?B?K1EzWld5M3RFUFBkbTVyNXY1blRKZG5hTjJJY1g2cFdtN3c3eGpFNysrUDc2?=
 =?utf-8?B?d2daNHNETHNCTlNoWEk5ZGhtMXFCTjB4eStkdWxNaWJxM054VHN2Y1AxMEFh?=
 =?utf-8?B?N3pLWVZjemx6QWtmSllGanN3VGRNRVlzNE5qdWd4ZFVaZ2dMRDR4TGZpc0Ey?=
 =?utf-8?B?STcvYjhyTU9idXlnbHJ3VUNVVmpJN1BES3VTRWlWZURUNDI4Q1pSSlpQaUEy?=
 =?utf-8?B?ZnR6aEZFTmkxRmZYdjZ5VVZqQW5CUzVZdy85Rkl4YWtSS3ZCNWZRS01Kb0hh?=
 =?utf-8?B?ckpzeGhVNk5KQ2krWEIwTldnb242MHM0aElXejJxN2pQYzJKQ0MyTVN6cmNX?=
 =?utf-8?Q?qvfKQ0g/tyVKshdThq6sgnvbR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1420ead-060d-4071-0f3a-08dd70d8bacf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 04:50:30.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVDjsusH30+Z43KoGI4abmiCHR2ykObE2KM/YqrM7eswZhSM6Q0EDXJvbnYC+4TJyz/gymFl2FGAVZM0RvyeBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6695
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

--------------8q0RVhDW8ccrxlC0DF5Jz5M2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 2025-04-01 00:39, Khatri, Sunil wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
>  
>
>  
>
> *From:*Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> *Sent:* Tuesday, April 1, 2025 12:42 AM
> *To:* Khatri, Sunil <Sunil.Khatri@amd.com>; igt-dev@lists.freedesktop.org
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> *Subject:* Re: [PATCH v3 02/19] drm-uapi/amdgpu: sync with drm-next
>
>  
>
>  
>
> On 2025-03-28 04:23, Sunil Khatri wrote:
>
>     Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")
>
>      
>
>     Added support of UAPI for user queue secure semaphore.
>
>     The semaphore is used to synchronize between the caller and
>
>     the gpu hw and user wait for the semaphore.
>
>      
>
>     Signed-off-by: Sunil Khatri <sunil.khatri@amd.com> <mailto:sunil.khatri@amd.com>
>
>     ---
>
>      include/drm-uapi/amdgpu_drm.h | 117 ++++++++++++++++++++++++++++++++++
>
>      1 file changed, 117 insertions(+)
>
>      
>
>     diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
>
>     index d780e1f2a..fed39c9b4 100644
>
>     --- a/include/drm-uapi/amdgpu_drm.h
>
>     +++ b/include/drm-uapi/amdgpu_drm.h
>
>     @@ -55,6 +55,8 @@ extern "C" {
>
>      #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
>
>      #define DRM_AMDGPU_SCHED               0x15
>
>      #define DRM_AMDGPU_USERQ               0x16
>
>     +#define DRM_AMDGPU_USERQ_SIGNAL        0x17
>
>     +#define DRM_AMDGPU_USERQ_WAIT          0x18
>
>      
>
>      #define DRM_IOCTL_AMDGPU_GEM_CREATE  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>
>      #define DRM_IOCTL_AMDGPU_GEM_MMAP  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>
>     @@ -73,6 +75,8 @@ extern "C" {
>
>      #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>
>      #define DRM_IOCTL_AMDGPU_SCHED   DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>
>      #define DRM_IOCTL_AMDGPU_USERQ   DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>
>     +#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>
>     +#define DRM_IOCTL_AMDGPU_USERQ_WAIT  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
>
>      
>
>      /**
>
>       * DOC: memory domains
>
>     @@ -442,6 +446,119 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
>
>       __u64   eop_va;
>
>      };
>
>      
>
>     +/* userq signal/wait ioctl */
>
>     +struct drm_amdgpu_userq_signal {
>
>     + /**
>
>     +  * @queue_id: Queue handle used by the userq fence creation function
>
>     +  * to retrieve the WPTR.
>
>     +  */
>
>     + __u32   queue_id;
>
>     + __u32   pad;
>
>     + /**
>
>     +  * @syncobj_handles: The list of syncobj handles submitted by the user queue
>
>     +  * job to be signaled.
>
>     +  */
>
> I am not sure about the correctness of the 'list of syncobj handles.' If it is a list, the field should be of type |list_head|; if it's an array, it should be |__u64*|, since the next field declares |num_syncobj_handles|. Could you clarify this?
>
> There are several fields like this ?
>
> Hello Vitaly
>
> These are the headers defined in the kernel and directly ported to the IGT lib drm header as various others in past.
>
> These are being discussed between various stake holders like Marel, Alex and Christian and then these types and objects are defined.
>
> Regards
> Sunil khatri
>

Hi Sunil, I got it. My question is about the comment: 'The list of BO handles.' Does this refer to an array of |__u64 bo_write_handles|, where |__u64| represents an address? Maybe, for historical reasons, it ended up being called a 'list'? Since it's already ported, there's nothing to discuss or change :)

>      
>
>     + __u64   syncobj_handles;
>
>     + /**
>
>     +  * @num_syncobj_handles: A count that represents the number of syncobj handles in
>
>     +  * @syncobj_handles.
>
>     +  */
>
>     + __u64   num_syncobj_handles;
>
>     + /**
>
>     +  * @bo_read_handles: The list of BO handles that the submitted user queue job
>
>     +  * is using for read only. This will update BO fences in the kernel.
>
>     +  */
>
>     + __u64   bo_read_handles;
>
>     + /**
>
>     +  * @bo_write_handles: The list of BO handles that the submitted user queue job
>
>     +  * is using for write only. This will update BO fences in the kernel.
>
>     +  */
>
>     + __u64   bo_write_handles;
>
>     + /**
>
>     +  * @num_bo_read_handles: A count that represents the number of read BO handles in
>
>     +  * @bo_read_handles.
>
>     +  */
>
>     + __u32   num_bo_read_handles;
>
>     + /**
>
>     +  * @num_bo_write_handles: A count that represents the number of write BO handles in
>
>     +  * @bo_write_handles.
>
>     +  */
>
>     + __u32   num_bo_write_handles;
>
>     +};
>
>     +
>
>     +struct drm_amdgpu_userq_fence_info {
>
>     + /**
>
>     +  * @va: A gpu address allocated for each queue which stores the
>
>     +  * read pointer (RPTR) value.
>
>     +  */
>
>     + __u64   va;
>
>     + /**
>
>     +  * @value: A 64 bit value represents the write pointer (WPTR) of the
>
>     +  * queue commands which compared with the RPTR value to signal the
>
>     +  * fences.
>
>     +  */
>
>     + __u64   value;
>
>     +};
>
>     +
>
>     +struct drm_amdgpu_userq_wait {
>
>     + /**
>
>     +  * @syncobj_handles: The list of syncobj handles submitted by the user queue
>
>     +  * job to get the va/value pairs.
>
>     +  */
>
>     + __u64   syncobj_handles;
>
>     + /**
>
>     +  * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
>
>     +  * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
>
>     +  */
>
>     + __u64   syncobj_timeline_handles;
>
>     + /**
>
>     +  * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
>
>     +  * user queue job for the corresponding @syncobj_timeline_handles.
>
>     +  */
>
>     + __u64   syncobj_timeline_points;
>
>     + /**
>
>     +  * @bo_read_handles: The list of read BO handles submitted by the user queue
>
>     +  * job to get the va/value pairs.
>
>     +  */
>
>     + __u64   bo_read_handles;
>
>     + /**
>
>     +  * @bo_write_handles: The list of write BO handles submitted by the user queue
>
>     +  * job to get the va/value pairs.
>
>     +  */
>
>     + __u64   bo_write_handles;
>
>     + /**
>
>     +  * @num_syncobj_timeline_handles: A count that represents the number of timeline
>
>     +  * syncobj handles in @syncobj_timeline_handles.
>
>     +  */
>
>     + __u16   num_syncobj_timeline_handles;
>
>     + /**
>
>     +  * @num_fences: This field can be used both as input and output. As input it defines
>
>     +  * the maximum number of fences that can be returned and as output it will specify
>
>     +  * how many fences were actually returned from the ioctl.
>
>     +  */
>
>     + __u16   num_fences;
>
>     + /**
>
>     +  * @num_syncobj_handles: A count that represents the number of syncobj handles in
>
>     +  * @syncobj_handles.
>
>     +  */
>
>     + __u32   num_syncobj_handles;
>
>     + /**
>
>     +  * @num_bo_read_handles: A count that represents the number of read BO handles in
>
>     +  * @bo_read_handles.
>
>     +  */
>
>     + __u32   num_bo_read_handles;
>
>     + /**
>
>     +  * @num_bo_write_handles: A count that represents the number of write BO handles in
>
>     +  * @bo_write_handles.
>
>     +  */
>
>     + __u32   num_bo_write_handles;
>
>     + /**
>
>     +  * @out_fences: The field is a return value from the ioctl containing the list of
>
>     +  * address/value pairs to wait for.
>
>     +  */
>
>     + __u64   out_fences;
>
>     +};
>
>     +
>
>      /* vm ioctl */
>
>      #define AMDGPU_VM_OP_RESERVE_VMID      1
>
>      #define AMDGPU_VM_OP_UNRESERVE_VMID    2
>
--------------8q0RVhDW8ccrxlC0DF5Jz5M2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-04-01 00:39, Khatri, Sunil
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:BL1PR12MB575353FEDC1AC8B937EBD05793AC2@BL1PR12MB5753.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}code
	{mso-style-priority:99;
	font-family:"Courier New";}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <p style="font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        [AMD Official Use Only - AMD Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                  Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>
                  <br>
                  <b>Sent:</b> Tuesday, April 1, 2025 12:42 AM<br>
                  <b>To:</b> Khatri, Sunil <a class="moz-txt-link-rfc2396E" href="mailto:Sunil.Khatri@amd.com">&lt;Sunil.Khatri@amd.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a><br>
                  <b>Cc:</b> Deucher, Alexander
                  <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Koenig, Christian
                  <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Prosyak, Vitaly
                  <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>; Zhang, Jesse(Jie)
                  <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH v3 02/19] drm-uapi/amdgpu:
                  sync with drm-next<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p><o:p>&nbsp;</o:p></p>
          <div>
            <p class="MsoNormal">On 2025-03-28 04:23, Sunil Khatri
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Sync with drm-next commit (&quot;866fc4f7e772c4a397f9459754ed1b1872b3a3c6&quot;)<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Added support of UAPI for user queue secure semaphore.<o:p></o:p></pre>
            <pre>The semaphore is used to synchronize between the caller and<o:p></o:p></pre>
            <pre>the gpu hw and user wait for the semaphore.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Signed-off-by: Sunil Khatri <a href="mailto:sunil.khatri@amd.com" moz-do-not-send="true">&lt;sunil.khatri@amd.com&gt;</a><o:p></o:p></pre>
            <pre>---<o:p></o:p></pre>
            <pre> include/drm-uapi/amdgpu_drm.h | 117 ++++++++++++++++++++++++++++++++++<o:p></o:p></pre>
            <pre> 1 file changed, 117 insertions(+)<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h<o:p></o:p></pre>
            <pre>index d780e1f2a..fed39c9b4 100644<o:p></o:p></pre>
            <pre>--- a/include/drm-uapi/amdgpu_drm.h<o:p></o:p></pre>
            <pre>+++ b/include/drm-uapi/amdgpu_drm.h<o:p></o:p></pre>
            <pre>@@ -55,6 +55,8 @@ extern &quot;C&quot; {<o:p></o:p></pre>
            <pre> #define DRM_AMDGPU_FENCE_TO_HANDLE&nbsp;&nbsp;&nbsp;&nbsp; 0x14<o:p></o:p></pre>
            <pre> #define DRM_AMDGPU_SCHED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x15<o:p></o:p></pre>
            <pre> #define DRM_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x16<o:p></o:p></pre>
            <pre>+#define DRM_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x17<o:p></o:p></pre>
            <pre>+#define DRM_AMDGPU_USERQ_WAIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x18<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;#define DRM_IOCTL_AMDGPU_GEM_CREATE&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)<o:p></o:p></pre>
            <pre> #define DRM_IOCTL_AMDGPU_GEM_MMAP&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)<o:p></o:p></pre>
            <pre>@@ -73,6 +75,8 @@ extern &quot;C&quot; {<o:p></o:p></pre>
            <pre> #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)<o:p></o:p></pre>
            <pre> #define DRM_IOCTL_AMDGPU_SCHED &nbsp; DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)<o:p></o:p></pre>
            <pre> #define DRM_IOCTL_AMDGPU_USERQ &nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)<o:p></o:p></pre>
            <pre>+#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)<o:p></o:p></pre>
            <pre>+#define DRM_IOCTL_AMDGPU_USERQ_WAIT&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;/**<o:p></o:p></pre>
            <pre>&nbsp; * DOC: memory domains<o:p></o:p></pre>
            <pre>@@ -442,6 +446,119 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {<o:p></o:p></pre>
            <pre>  __u64&nbsp;&nbsp; eop_va;<o:p></o:p></pre>
            <pre> };<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>+/* userq signal/wait ioctl */<o:p></o:p></pre>
            <pre>+struct drm_amdgpu_userq_signal {<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @queue_id: Queue handle used by the userq fence creation function<o:p></o:p></pre>
            <pre>+  * to retrieve the WPTR.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; queue_id;<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; pad;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @syncobj_handles: The list of syncobj handles submitted by the user queue<o:p></o:p></pre>
            <pre>+  * job to be signaled.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
          </blockquote>
          <p>I am not sure about the correctness of the 'list of syncobj
            handles.' If it is a list, the field should be of type
            <code><span style="font-size:10.0pt">list_head</span></code>;
            if it's an array, it should be
            <code><span style="font-size:10.0pt">__u64*</span></code>,
            since the next field declares
            <code><span style="font-size:10.0pt">num_syncobj_handles</span></code>.
            Could you clarify this?<o:p></o:p></p>
          <p>There are several fields like this ?<o:p></o:p></p>
          <p><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif">Hello
              Vitaly<br>
              <br>
              These are the headers defined in the kernel and directly
              ported to the IGT lib drm header as various others in
              past.<br>
              <br>
              These are being discussed between various stake holders
              like Marel, Alex and Christian and then these types and
              objects are defined.
              <br>
              <br>
              Regards<br>
              Sunil khatri</span></p>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Sunil, I got it. My question is about the comment: 'The list
      of BO handles.' Does this refer to an array of <code data-start="112" data-end="136">__u64 bo_write_handles</code>,
      where <code data-start="144" data-end="151">__u64</code>
      represents an address? Maybe, for historical reasons, it ended up
      being called a 'list'? Since it's already ported, there's nothing
      to discuss or change :) <br>
    </p>
    <blockquote type="cite" cite="mid:BL1PR12MB575353FEDC1AC8B937EBD05793AC2@BL1PR12MB5753.namprd12.prod.outlook.com">
      <div>
        <div class="WordSection1">
          <p><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; syncobj_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_syncobj_handles: A count that represents the number of syncobj handles in<o:p></o:p></pre>
            <pre>+  * @syncobj_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; num_syncobj_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @bo_read_handles: The list of BO handles that the submitted user queue job<o:p></o:p></pre>
            <pre>+  * is using for read only. This will update BO fences in the kernel.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; bo_read_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @bo_write_handles: The list of BO handles that the submitted user queue job<o:p></o:p></pre>
            <pre>+  * is using for write only. This will update BO fences in the kernel.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; bo_write_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_bo_read_handles: A count that represents the number of read BO handles in<o:p></o:p></pre>
            <pre>+  * @bo_read_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; num_bo_read_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_bo_write_handles: A count that represents the number of write BO handles in<o:p></o:p></pre>
            <pre>+  * @bo_write_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; num_bo_write_handles;<o:p></o:p></pre>
            <pre>+};<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+struct drm_amdgpu_userq_fence_info {<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @va: A gpu address allocated for each queue which stores the<o:p></o:p></pre>
            <pre>+  * read pointer (RPTR) value.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; va;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @value: A 64 bit value represents the write pointer (WPTR) of the<o:p></o:p></pre>
            <pre>+  * queue commands which compared with the RPTR value to signal the<o:p></o:p></pre>
            <pre>+  * fences.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; value;<o:p></o:p></pre>
            <pre>+};<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+struct drm_amdgpu_userq_wait {<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @syncobj_handles: The list of syncobj handles submitted by the user queue<o:p></o:p></pre>
            <pre>+  * job to get the va/value pairs.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; syncobj_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by<o:p></o:p></pre>
            <pre>+  * the user queue job to get the va/value pairs at given @syncobj_timeline_points.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; syncobj_timeline_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @syncobj_timeline_points: The list of timeline syncobj points submitted by the<o:p></o:p></pre>
            <pre>+  * user queue job for the corresponding @syncobj_timeline_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; syncobj_timeline_points;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @bo_read_handles: The list of read BO handles submitted by the user queue<o:p></o:p></pre>
            <pre>+  * job to get the va/value pairs.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; bo_read_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @bo_write_handles: The list of write BO handles submitted by the user queue<o:p></o:p></pre>
            <pre>+  * job to get the va/value pairs.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; bo_write_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_syncobj_timeline_handles: A count that represents the number of timeline<o:p></o:p></pre>
            <pre>+  * syncobj handles in @syncobj_timeline_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u16&nbsp;&nbsp; num_syncobj_timeline_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_fences: This field can be used both as input and output. As input it defines<o:p></o:p></pre>
            <pre>+  * the maximum number of fences that can be returned and as output it will specify<o:p></o:p></pre>
            <pre>+  * how many fences were actually returned from the ioctl.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u16&nbsp;&nbsp; num_fences;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_syncobj_handles: A count that represents the number of syncobj handles in<o:p></o:p></pre>
            <pre>+  * @syncobj_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; num_syncobj_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_bo_read_handles: A count that represents the number of read BO handles in<o:p></o:p></pre>
            <pre>+  * @bo_read_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; num_bo_read_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @num_bo_write_handles: A count that represents the number of write BO handles in<o:p></o:p></pre>
            <pre>+  * @bo_write_handles.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u32&nbsp;&nbsp; num_bo_write_handles;<o:p></o:p></pre>
            <pre>+ /**<o:p></o:p></pre>
            <pre>+  * @out_fences: The field is a return value from the ioctl containing the list of<o:p></o:p></pre>
            <pre>+  * address/value pairs to wait for.<o:p></o:p></pre>
            <pre>+  */<o:p></o:p></pre>
            <pre>+ __u64&nbsp;&nbsp; out_fences;<o:p></o:p></pre>
            <pre>+};<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre> /* vm ioctl */<o:p></o:p></pre>
            <pre> #define AMDGPU_VM_OP_RESERVE_VMID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></pre>
            <pre> #define AMDGPU_VM_OP_UNRESERVE_VMID&nbsp;&nbsp;&nbsp; 2<o:p></o:p></pre>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------8q0RVhDW8ccrxlC0DF5Jz5M2--
