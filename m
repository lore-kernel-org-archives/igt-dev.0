Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E98CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9380910E252;
	Fri, 19 Sep 2025 17:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S9aV6Nu0";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177410E252
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKek22A0rAyjFYP3NrDs9XbfA+i0CHM+84B9k1DnaH629NMwWqSLseGxP0bbApF3LCV+NzC7Ex5hTjBqBsBy6UVT1AaTtCbgtI85g+NXMZzlDc3rqWyAlIOVM626m1lwA0CNGrh4plOmRpSutZ2wB+jsWlL5xhYTk7eYYXiayOUa5/I/fvPkj7Hu6sIbI7Pc3N7E0m5cuxGEDag+V6l+gsKEIGnLrHigL+ursVF9UKDscR5eJgZI4sqNGMoCUeFocvXywKPTQvnea8ahbvbh5lZbQKBSOli1E1JkC6WfNVKR/W/7YKYJzUuLhSDNn8egI0P1H3t4Jivk0DwSE9Auiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUzo/WuJ7iyrFAOTbueXYciFF7t7eIpw/g9GKvlTGTA=;
 b=KiIFS0G03uL9v6fD1lHmskSmBmOADwvpfEIcwuvu2aS9EkZHGKdE9RgkkIBzsr3rTgZR0WfQ2TEZRVlKQqyfPWO3YHkpyoAdFx5SoDwcCaOAq6nP0HMI7GLXQWA8dqaX71pm6RBPCp60zq8NeOoJtuWEuorNwaRJpLbQUBmXqzFwOR2iGsdG2cInyN6+bnsvtWMPI9xJgzJNHEjbo7YaEyPoz3Q2z+x5ttUOBIwTyAb9MD4lM4XLzXkePEzYyixUooiFnVP4NUN+LlDULFfleUE1aNiesgZ7Hnpbiwa7YmBqr6V2CHQskChKu2NIVu/mg8uxXBGmBAe2Bk4G6X9JMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUzo/WuJ7iyrFAOTbueXYciFF7t7eIpw/g9GKvlTGTA=;
 b=S9aV6Nu0EJF05nsXmamcZzZlWDzI4Mkg/taN51SAkQyrdBdj2/ecwx9EKoftli8sTwa6SR27ZmMWDon+40kJxKC2YbpavKQDR4bnSE/BztcC6JGvZkB//XRhNOc0jBfTI70m9jMuyn6nL345QRyYztbDb2hG4adZWj+NzgKCigs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 17:18:04 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 17:18:04 +0000
Message-ID: <bbf51705-bd62-41aa-9e10-c7aee1affa12@amd.com>
Date: Fri, 19 Sep 2025 11:18:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 28/30] drm-uapi: Update kernel doc for drm_colorop_type
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-29-alex.hung@amd.com>
 <20250903164112.yxyrmo34p2eyudym@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250903164112.yxyrmo34p2eyudym@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: dd86f38f-87b1-459e-16ea-08ddf7a07e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU9oNkQ1bkhRQjQ2TWNjRHdHRXJybXFhYVdyRFZLWEZHNmNJY2tIbCtxMGw1?=
 =?utf-8?B?OHFia1dBRVJMY1pDd2hONDd5Y1hITDd5SnhMWFdnZ0RsTlBPSmtBb0gwdlZr?=
 =?utf-8?B?dkdPMmJrSXNEbURDYUwrbVNrUVZIMVdYNmNhR2czeGkvRVUvSkxmVlZxdk1x?=
 =?utf-8?B?ODhCQ21CQWhzQW8wUnYzRXg3Y3lFS3JscmF1Wlhxam51QXd4UnNQSnkyOEJX?=
 =?utf-8?B?UkhXNkE5dUtzZHRKUHFDT1p4c3hCZUZSQU9TRU1qSnhTWnYrSm1KeEgxdlpM?=
 =?utf-8?B?OUloaWY5WXJKQnhZN1k2RTAxc281bFY3RVZqK3dSaUJwQ3NtSThMSC9NTnNU?=
 =?utf-8?B?M0RVMUF5OG1zblhMMVVQZzdjbmxaSTRQb1B5VFdoWlNpWGcvN0lPamZzek51?=
 =?utf-8?B?K1p1Ry9tRTNkaGF0SG9NaFNmTlVUWHpDTEpNdy9iMms0bFZRbDVZa3kzbDJG?=
 =?utf-8?B?Sk9oUUlzQkw2RElnM3dQMGZuVk5xejVoTzB6NTFzeGhUT1RRd0hHaDhmZzBK?=
 =?utf-8?B?NWorTGtXM1EvSk1CZzZFaHRlMEVQNjN2VjJTcWRZMHZxZHRwb2plOUFRMTNi?=
 =?utf-8?B?UXQ4WXZhVVNYdVlkdDVyYVVrbEdyZGhaY2owR0FaYlpCUSs2aUxxVTNhSmRG?=
 =?utf-8?B?K3dNbjVGbFZmK29TcGd3TW1Iam9QRHZrQ2N0SytHOEFZQnJWT0JNRWRyelZR?=
 =?utf-8?B?UTFHUTY5S2EvUWJjTzVSeEtIVlBhMHlzQTRpbC9FTmFVeGxoMTlXYjJSeEla?=
 =?utf-8?B?eU9pMEVjdW43UWo1RkVHaWQrdE9NWkFQUTVRZEpXWEc2MlVtbXBOZ2MvT3I1?=
 =?utf-8?B?aHNCd1F4ZTcybmJSeGxxRE41Y0Mwd2htNnlVTEkva0hydjhYbVp2dE16Y3Zo?=
 =?utf-8?B?b08vam8wMWQ4K2ZKWjRDaUZua0RqYlcrTm5kcVBKTDhBTHl4N29HM3lzdTFm?=
 =?utf-8?B?NUl6MXBlblZXYzVORGZXUHNYdUN4VjF2UDBGOHZqQStGSHJNYVB6UzVBMzlW?=
 =?utf-8?B?eWQyOUZVVmZTQkgyVVZKU0E4NGg4MEdoR3V4Z3BUMGNXdmJNWVFubUZJK3RX?=
 =?utf-8?B?eE5hMml0MitadG40WVJWRlZVYzZLVzNvTDBHcnFVU1ZRbEp5VVdtWnRySFor?=
 =?utf-8?B?aDVMNkpNdVNaQzArMXZwN0R3WlVyTVVhOTB1KzdMVHd0RktaQUZCTktzL1Jq?=
 =?utf-8?B?U2lxWXlySjBFMGlUOWpTbk5xV3JpNEFqdndVNlgza3crYmtqNnpYVzlnRFhv?=
 =?utf-8?B?Yk9laXFnRjdrc3cvU0F6ZHFIc0ZBN0dFQVo5N2xKUXpmMlB4b2hkeitRZ09j?=
 =?utf-8?B?YTlQSWNTVkhOU2xBbXV3OG9BUjNFdm5jU0hkdnFWYUFtQzVBdnpjUmVrT2RX?=
 =?utf-8?B?eVRldlQ0aXNWUWdxZnJTd09BSENwUis4ZGZJWk9BQXp5bGRKM3IwQ3pZZ1Rl?=
 =?utf-8?B?Nk53bWUvdzFlV0UxNUhBWVowMStNdXJva3FEblBjTHZiTnBZVzhsOHgvWFI5?=
 =?utf-8?B?RzRpNUk4ZTZpV05ScEp0U2s3YzBJTnp6cUNrZmc2M3pYTWlzVnhpdG9nWmdr?=
 =?utf-8?B?eU5UTEd5eWwydkZyUlc3SGw5QjAydlEwdVdkZXhMUFl0NGVSa1M2anRkZUNB?=
 =?utf-8?B?bUlZbnRBNURjSWpOc2NnaXNiMFUrSGM4Z1hTU3BLMkd6UVJBWWR6U3hlMURK?=
 =?utf-8?B?Yy9HWlg1enpUbFBCaXBSbkppajBta2dmUktEQmZIYW5nN2xyNFBrekhSWEdp?=
 =?utf-8?B?c2VvblVVbTQrZGVPTTZyc3pOcmhSQXlJTm9xcEJVdlVKS3VzalQ3UVRLc3hr?=
 =?utf-8?B?OHdoYlZMelZSVndic3JuRDhpZ0l6dEQwdkxGUVFDNVdWL3o4bEphYmhSOVBr?=
 =?utf-8?B?T1QxSXR5bGZreHZHcklYMXNMZTBJck02cW14M3hPVXJaZ2x1eEc5bkVoQlIv?=
 =?utf-8?Q?aOGuJv4n55g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0hvdG1wVzUrczMzMmo4aDJEczVSdDVkZXlNMzlianZHS3hlRGV2dEN4RzJa?=
 =?utf-8?B?MXQydWFKVExlam9PaVl3SVlTelQ5ZDdaVFI1NE9lRzlJNnlsYTY5b3QxZGc0?=
 =?utf-8?B?ejRSM3JvRkFEZzhXdFluZk8xbVZ1R3dqMnFzWkJIT3E1KzVUdUlWc2cvWUJv?=
 =?utf-8?B?TnRkeC9PandnUjNhOTQ4T3ZZUUdkSjJWWEFnaXhoeTJsZ0tYK0NaNEM3QnMr?=
 =?utf-8?B?V0hpTU5HbWFWdDhZRmNTK3pMM0U3SnE1dHZNY2tPaStvcFVHRktsbXBGcGpv?=
 =?utf-8?B?ZWM5dmx0eUtBSUdQeE5zbG5aR0ErcE5xQ1ZpWFJaeFVQbXF0Q20xVDh6MGlG?=
 =?utf-8?B?bFFhNVpqSkV4cnlUZHFVbmJCWWpINVFJb0dYK09iZXQ4ZWQzWDhYSytMU29I?=
 =?utf-8?B?c2pWWnpwdStTZE12c1RvR3lHUnpBYlZWVjVQV0cxck9QYkxxMmphbFltRWdm?=
 =?utf-8?B?OUppVEpQd0xDR2FRK0ZoQ3RiK08waG9KNzBQTWZ6Vzh6OEJ2QTkvOVFrQldr?=
 =?utf-8?B?dThLcHdRRExNU2gxenl1YUt5VmtOYys0dXpucm45ZVFScytWQTNHdkZibkY5?=
 =?utf-8?B?a3IxR0o3QnRlMW8ybVVJOUZPTFc3emxVOWdzWEtuekVSaFcxNnNibHRPclAr?=
 =?utf-8?B?Zkd2U1lyNEFlWFZkZWhrWGJzOHVLc2dyMlA1R2QzV002TUZqOEx5SGtkZ0Zo?=
 =?utf-8?B?UHZKN0xaUk82TDl4RmdyazFZdVZSeGowUGpIWnhuZm9xOUlGSEdrTnZ1TE42?=
 =?utf-8?B?WGwxai9WMlF5UXN5ejQ0bGUzM1hyZ3pPN0N2QlNaT0R3TnBQZy8xZ0grWm1q?=
 =?utf-8?B?SEpRSWVMTWlWRVV5ZFczV0FpaWR6eTlYQjBIby9GZ0tzYVpPS2ZBQ0RBRWY2?=
 =?utf-8?B?UlhXQU0xTytSK2p3YlFydGxqVDFIaTdTVkxXWnAwZ2ZmR0ZUS3NuTmhpRWdC?=
 =?utf-8?B?cmx4bUd1NzQxR2NNcW8yenI3RGpsMzE5K2xJTG9tSlFnU1JiWGEvVVlxeXlj?=
 =?utf-8?B?ZjhTeW5oTzJDUjVtQW5EV2tkNVJKeHlId0k2SDVBK2lmY1k4T05mdm40MHVF?=
 =?utf-8?B?cFdoRk9vVmJkQVNmZHJ2TUJTc2xUbUFXMVdOSDg2S3UxQnpWMTBiamN6OWVu?=
 =?utf-8?B?Qkc0MllPSGhWcnFhK3J5dnc0emdMR3dpZjdLWlNvUTlQMSsxREtMRDYrRnhF?=
 =?utf-8?B?VlNXMlFUS1FuSStBRW9yb2tSMHJNbFRNZjRjLysxUm1rKzFXNXB1VWVwN0NQ?=
 =?utf-8?B?elRkbnFYL29ZQ3ZCVGJlVzhiU3QzVEJsVG5tQkZpSWwzUWxrRGlMc0FJeVNJ?=
 =?utf-8?B?cG9kS3hHZVlHUXZsajBMZWUxKzBIbXRnK0tISm1NSzJJeVBYd3hhNjB0eTJo?=
 =?utf-8?B?Mm5ZSlF1WmRLZ3ExU0d6NEZxVlVwdXZqT29teC9UN21GbXVzSmhIbjNuN3My?=
 =?utf-8?B?Q3U4bms4RDN0YXRZV0RKM3dudDZHYTdEak9sK0lacFV5cjFwSDNKR3pQbDc4?=
 =?utf-8?B?YmxyL242Nkw2ZE8wejVZdTV1N2JjQ0ZRVVp0dk9LVkxXcHlQVEFhbTI0dktv?=
 =?utf-8?B?K2w2dXB6Q1dEak5QNlBDNXEwZVVQb284eTFXWjZhVEhPbGoyZGF2Nmt2OHpw?=
 =?utf-8?B?K0tmdGNDbENJaFBZVmErOTBOSXRvVkRjdTZMSUI4R25RU2I3dWprYlFtak4z?=
 =?utf-8?B?SnMyZ3gwVXJoS3pReVdXUXppT283dDQyVGRlY1hCdGNDSEZBT3R0dWFKemNw?=
 =?utf-8?B?ZEFCY3l1dWNsZWh6cU9ORTMveGJkVURnN2x3alF4bDUzRlV5MzAwdzdWMW4y?=
 =?utf-8?B?L2ovd3BkMmhVZlBabk1WbElSSlZ6Tlh3SS9Ld1lHNjhVMnF4aklNUVN0cjd6?=
 =?utf-8?B?NnR3OElKcEJwcGFaK0t1Q1h3RnlGd2doVXk4OU1CM24zNUFKZVNoMUNGejlG?=
 =?utf-8?B?d2ViL3VXQ1BTaVFuVnpMZzJYWlJrdktmODNuNDE5NDAyYjNNQW5teERrb0xO?=
 =?utf-8?B?Q1E4NkNlOU9lSDJMMG05K0RWbWszVEF2SldGYUl5RHNzU1lzMnluVzBhdFZo?=
 =?utf-8?B?Rk1UaXpXTnpkbFMwcDR4SXpzZ3VUSXlGR2hFWHNYaEVYRm9PT1RUZ3RIRUd1?=
 =?utf-8?Q?Hl7iFj3mm0l+f/QqQxHX5AT9W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd86f38f-87b1-459e-16ea-08ddf7a07e2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 17:18:04.1690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbbjYQ50U4+qDcMPy6rAWyFYb1FjbKlCKsg4ieL87VRNdazM0wy8CCPcgAAOOXEaUaxf0h3fMw5I205ljJeDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237
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



On 9/3/25 10:41, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-08-14 at 22:06:57 -0600, Alex Hung wrote:
> 
> please improve subject, imho add 'drm_mode' prefix:
> 
> [PATCH V10 28/30] drm-uapi/drm_mode: Update kernel doc for drm_colorop_type
> 
>> Sync up with kernel documents.
> 
> Provide kernel commit here, link to lore.kernel.org also
> could be added.
> Or look into history and do similar commit:
> git log -- include/drm-uapi/drm_mode.h

I will move the doc to where where each enum drm_colorop_type is 
introduced and then drop this patch, since it makes more sense.

> 
> Regards,
> Kamil
> 
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   include/drm-uapi/drm_mode.h | 44 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
>> index 009bb3e7f..e00b21067 100644
>> --- a/include/drm-uapi/drm_mode.h
>> +++ b/include/drm-uapi/drm_mode.h
>> @@ -886,11 +886,55 @@ struct drm_color_lut32 {
>>   	__u32 reserved;
>>   };
>>   
>> +/**
>> + * enum drm_colorop_type - Type of color operation
>> + *
>> + *
>> + * drm_colorops can be of many different types. Each type behaves differently
>> + * and defines a different set of properties. This enum defines all types and
>> + * gives a high-level description.
>> + */
>>   enum drm_colorop_type {
>> +	/**
>> +	 * @DRM_COLOROP_1D_CURVE:
>> +	 *
>> +	 * A 1D curve that is being applied to all color channels. The
>> +	 * curve is specified via tha CURVE_1D_TYPE colorop property.
>> +	 */
>>   	DRM_COLOROP_1D_CURVE,
>> +
>> +	/**
>> +	 * @DRM_COLOROP_1D_LUT:
>> +	 *
>> +	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
>> +	 * packed into a blob via the DATA property. The driver's expected
>> +	 * LUT size is advertised via the SIZE property.
>> +	 */
>>   	DRM_COLOROP_1D_LUT,
>> +
>> +	/**
>> +	 * @DRM_COLOROP_CTM_3X4:
>> +	 *
>> +	 * A 3x4 matrix. Its values are specified via the
>> +	 * &drm_color_ctm_3x4 struct provided via the DATA property.
>> +	 */
>>   	DRM_COLOROP_CTM_3X4,
>> +
>> +	/**
>> +	 * @DRM_COLOROP_MULTIPLIER:
>> +	 *
>> +	 * A simple multiplier, applied to all color values. The
>> +	 * multiplier is specified as a S31.32 via the MULTIPLIER
>> +	 * property.
>> +	 */
>>   	DRM_COLOROP_MULTIPLIER,
>> +	/**
>> +	 * @DRM_COLOROP_3D_LUT:
>> +	 *
>> +	 * A 3D LUT of &drm_color_lut entries,
>> +	 * packed into a blob via the DATA property. The driver's expected
>> +	 * LUT size is advertised via the SIZE property.
>> +	 */
>>   	DRM_COLOROP_3D_LUT,
>>   };
>>   
>> -- 
>> 2.43.0
>>

