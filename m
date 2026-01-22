Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7CBD6CFA2
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 19:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0391F10EA4E;
	Thu, 22 Jan 2026 19:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="viUF6rBM";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9210EA4E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 19:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnU2yZy5jcE9je3gdHQqtg2Sul/xhPX7+/V3PRWnL4FWDEYNHisMWWE2xKG7FLV6cjKpE4zo6cZcD4m1P9AJWfPqKPJ9gJHdGBSnE4xEgvyweupAeu6KHezElTHfSzMEHDsweLULEibhfIGFhx/ukMnv49wCy9awjKjlUE+d6TYkxKWG2x0teCqxEEs8Wr6exahCED8b38mWivEvc7zXYrrPBhc8xQQQoyUhQwouLL0lLfNUNanNY4C+Z1cspupZ4VhDzrEfjv1quq5nTtIVm818pdj03vh2iKUHFYbyLqwr48rpy65QdrzjG4OV+YYFaRPkdsiqtxslPfKbCDJyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnjSd9EeaFv1vEsnMROki+H2LiQzmsHy2pEj8GA4xso=;
 b=iRQvd5NUTOnGGnb7tDfN8/0d6bjgDpMKolA3JFBBBxypKulVfkUR9jwlyn60l4uuPPPgd6ZSgd6U16xpiYjj/R7TZX0vXu4yZnEFn2eQl5ctbUBR/C2/xIX7xJsymFCPj8rUkO4fZ6rk6Vydbv1pL+ny/hNHbbatqvG0HCbOJNxalLaAQPbpW7XiQ9eoo9wZpCEPGC9j/xRv3jRAnO2bNt0eLWE1+BecopC6BiS0PyDB+8TlBfl1ilWp030oeMheZRH98PmkrQRsXUAPzZls6F0nK3s3U/SKm/IPgBlaMHTOrLtUuKUyv1bVIvvhGzZQmlT4YhTl6RFvNIHDQ/3hJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnjSd9EeaFv1vEsnMROki+H2LiQzmsHy2pEj8GA4xso=;
 b=viUF6rBMzshDURdWt/5OAFj2qZNdl9R1Y9jVT6XRo9NidKvWlQ4P7GIFEjztSIg2CvoSju35uDKcPWT4G3WvpzXvW3a040HqZpThDWnbkgqdcHDgdC6kZKbCOX+uj1DLVZyGibQ7tlI5+roBAshuR3NfSvmwYWsm/wQGH2IAXhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 19:21:19 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 19:21:19 +0000
Message-ID: <44594881-ed48-4926-9529-9bad75d268cb@amd.com>
Date: Thu, 22 Jan 2026 14:21:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] README: Update oneliner build command for igt_runner
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: aurabindo.pillai@amd.com
References: <20260122170901.644692-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260122170901.644692-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0035.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::12) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: 003643dc-9386-4745-8b32-08de59eb6b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFg5dVBYMjIwcktOUkcxZTZFdkpYa1Mvb09Oem85SURnYzBIMGZuNDlUUms3?=
 =?utf-8?B?Rzh6b0dYRThxM3VyamlLR3BwdjZrclNlNThvdEJNSCsyb0hJVlhwWnJ2ejJ5?=
 =?utf-8?B?b1NjcjBPWVJ4SVU2RnFyZUF5QnNMZXVFQzljM0hrNzFGbVpaelRCR3NIcjRv?=
 =?utf-8?B?ZkZ5N0U5UUtCM3NwUGNNc1Nkc2o3cDRVK2c0OHJRY2NUVTZhZlVsRWtzNkZl?=
 =?utf-8?B?OThjNzhQNEhMWkd5bGt3STJJazQ1S2ZWTkg2M0gxVHdtdXpITno2L0JQUGZo?=
 =?utf-8?B?cXpScDY3clFhbFl0UWtsWTR2TVUzUWJUUXlWWkNia2dORXJmdEY2TkdiaUhC?=
 =?utf-8?B?RmxNQXZ5QTNwaDAzQTQ1MmlGNk9wYlZLVjNMT2dOTnd4VlBkZ05tVHVPbkJ5?=
 =?utf-8?B?eTduNklwNWhOKzBObkxlWnpqZXV5T1QwNE1aaEhnaUdzemNYNGU4ZVNPNUxL?=
 =?utf-8?B?TGUwWm9yZW1uWm9VL3Q0QkJEdk1TczByOXc5U0JicXJOUzg4b3BPNXc4SXpL?=
 =?utf-8?B?SFlENHpWUEZ0Rkp4cjJpd3hhK09oc1dXU3h6WXNISDlsRlFTNHVTWGYxUm5K?=
 =?utf-8?B?QW9yejc4Y1l0NzdpaTkrSHJybW1iNktRUk9waDJvcnNSaFZ2RmRDOWtEajlh?=
 =?utf-8?B?ZlNQaEQ2ZDVTTHAxTnAyRkMzNk9aNE1SQWpJREoyUVhJNnI5eTl2OVpjcXg0?=
 =?utf-8?B?WHp4a3RlQW9uWFo0RHZ3N1BhRUczTWNQZy9CWXp6YWhzNFRXWDlKUllxaU81?=
 =?utf-8?B?U2VRMnNGRnU1VXh4MHJKRW9pZGtLQ244SG94cEQ0TjZFODNpb01LakNISzNw?=
 =?utf-8?B?a0QxcmVmTCtPVG84OW56Nmo1b1FEUXJPaUJUSlBrbUNoMnllY29Lck8vSnZG?=
 =?utf-8?B?a2xGVGtNWFpDZnBoOTNhYytHaTZEdWZDR3E0cG9pNGRYQmpYNHpRYSszWDB2?=
 =?utf-8?B?TG1hNndvbytnSk5mRnRPWkdJY3JqM3lZSy9uZ3k5aDdMZnJOSDJmNVVqTzRr?=
 =?utf-8?B?eXAzTjFhZ2xXcHpsMURvYWtLdDlxRzFzbVlhdFJYYUY0Z3NiczBOZnRwcUsr?=
 =?utf-8?B?bTEvSFpCR0U4TnV1dHpjcEpuUmFhZnVDelM5Q3hKR2NvSUlWRWxHeG1pMjNr?=
 =?utf-8?B?bk5uYkhmS3NiTld6WmlmUmVXN0E5bUZPSFhJNC9IUXRQNnAyVUs1TVBsUTg2?=
 =?utf-8?B?VFR4VUJEb3haRE14Zks0eHVLcGxwejZ6L0lwNTd6NDZkczhOMHFoNU1ITUcw?=
 =?utf-8?B?VzVuL1VPS1pqcnd5akIrMVJGZUc2TzVrcUh1bzlvS1NhMnB6b0ZvT0F1clQ5?=
 =?utf-8?B?YU52RmxmenNTaG5zZERjU0t5cU5xUHpYZ2pGeUJjRVc5UFVrNEZTT2thRm9M?=
 =?utf-8?B?U0UreHYyQ0JVa3EzaXpsckhicU5NSGorMnFvQ0g4a3pSbnlTZGNySm1WaWxY?=
 =?utf-8?B?bEdWNFdFeEZlQlM5c05tTll3Yk9PaFozeVdmREZRalZqR09wa0wremlITU1q?=
 =?utf-8?B?ams1ZVBQM0wwTmlWditGUlFETVFGN3RSRVh2RzZZVlhzeGRqYXAzM2pzeXJ2?=
 =?utf-8?B?NGo4dnhKZkY5NURwREVDeXR4Q2Q0RlkyMXkvTmMxM1FKRHZpM2s0M1pPbHlX?=
 =?utf-8?B?aEN6RFlmMTF6L1BtUGRTNGJ2RitTWFJPSERwRjN4cXdENHVCYyt6YVFqaUsz?=
 =?utf-8?B?ek5qQ3BBRk9ZU3VGK1dESFhWL0gxNEtjWCtwbHFScnBMRlJINFVSS0kzV0xR?=
 =?utf-8?B?QStuOUhwZ2dEUGxMQUxSYXVBK2Nkek5XWU84VWVuSDI0endEQzJQbEtLMnFx?=
 =?utf-8?B?R0VWekNWNVlUb3phRWc4UW10YlhybXZFQ0R3WnBXbktDSzRvdXFJVEoyYjJC?=
 =?utf-8?B?L0JucFBBV2E3Y2VlU2xsenBPcjBjc2lYUjBlODNGcGlVb1RhWDhtaXBuM2M4?=
 =?utf-8?B?RlQrOFJiUkFwd01mRmxZYjdQTWRqUkRxQmJKLzRGdytOc1FwRDdpZ1VYdjdt?=
 =?utf-8?B?ODhnam5LMS9iZXNwSXFFL0MrNW50Y3dxSjN6OHNOWEtLd3c2Ty9nNm41dlFj?=
 =?utf-8?B?ZTArRUpNYUIyUjBKYnNQRnZBcHhHREU4d3MrV1l6MTVRL2dON3lFdmRGSVIx?=
 =?utf-8?Q?tlKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0taaktod1dpbnJFcHc1UDl2Q0kzNXQrOUFzTldkS0dPSUJCeHVBK1dIN25H?=
 =?utf-8?B?bXdhQUkxQys2VUV2K2VIS1BpS0swWjBqNFFzS0dKK2ljeGo1S1NSMGVhMCtM?=
 =?utf-8?B?a3h2ZjU5RmxJaDlCMWc0WGYvUkhLd2hScmRCSHFNSUJXM0lFU0J6N0krTk5o?=
 =?utf-8?B?TDBFZEFhMDJRcW5XWDhZa3RvSVpQRUVJWlIzbWtOOXljRk1oRG5vV1NYbGtk?=
 =?utf-8?B?SzFhWkNZWGJKRTZydHlab3ZmY0l5eWRQbm9BOGdxVUFqUllWOU1OdGs5TFZn?=
 =?utf-8?B?ZXAzTGp3M2RDc3ZMWURBM0I1ZXNSZC8xSUdDMUhGdytNRWl0aE9PSG40dWU5?=
 =?utf-8?B?UDJkVXExOXd0S1BWNW1NSXljcWpZWTZGeDFDZnpZeng0eWJFZXJJYXZZRUdi?=
 =?utf-8?B?T0NBL3A4TDhVcTdRa05BRlZSTXBRdHh3Qy8xY1pDcWd6QzhhQ1NpUHhIbVhy?=
 =?utf-8?B?aUw3NHlqVnhveWxJby9rZUExU0Y4OXZaMkdXRWoxRThDSUx5Q3Fob3kvZy9W?=
 =?utf-8?B?UTFtQlRkRVRtcFJ2ZlY4RXhmcWZhb1VwYnJCL0tqSjhHMURCQVlpWEJUM0JC?=
 =?utf-8?B?K0pWcWI4QmMyN2VWYVhoenV1dnZxTnpoQSt4Q0poUXpNMkZxQm5hSlBGaXYr?=
 =?utf-8?B?TFJaNUM5bnpRME0vK2VKL0JiZUUwY2VRRzVuNktPL0ZxZjljUUhCa3hBQkMx?=
 =?utf-8?B?WHlaNEo2cm1xYkVEcEZhMFVnSklqSVdLcXAzSnA0Tnd3bi9GTTFsSTRXaCsx?=
 =?utf-8?B?YXhnclUxSjVKYUFya3lmSXpLR2RTR0lvMnBZNkVZK01tSzd5SnJaQVBNdzA2?=
 =?utf-8?B?Q0dmMUhnRzB3NDc2MWk0SUtzb0h5eTJMR1E5RFhwQWo3OExHc3Q4UEJ2T3Rk?=
 =?utf-8?B?VVlPeVNOc0Z3NDBsdmszaHBZaC9Ha1Z6ajFYczNiNWVFTmR1SmhOUm8ydkJN?=
 =?utf-8?B?b3llUWM0NERwZEpKRlRJZWhWUHlOeHJSQUJLN2JTdWhvdlpGbmJFb3ZLcFFx?=
 =?utf-8?B?YVRZOVB3dXVoL0krc3RlSXZ2NnFZS3QvWVlGU0hpMldiUEJ4bTlKVGxhRFhE?=
 =?utf-8?B?R1dVNFAwNzFhczhPOUJ0UzlRZVZoMzRKS2FwTFFidko3aDdSSnl1NllDSWVJ?=
 =?utf-8?B?THNjQlIwSXlqZ3dWaHMyZjNKVlBUNGlqK2hMRXNaUFIvdkY2MVlXNTRXMmU3?=
 =?utf-8?B?SUxJTDQwR3ZqS3RubEFNL2FadXc0NXhQczgvUGRZSXoyWEtvblNWZWtzMG9X?=
 =?utf-8?B?bkhhelBVVVN2YUxZcnVBNkNyQWNvQkZFeU01ZFZMckVUeklBWGE3cWpaS0lF?=
 =?utf-8?B?bjl3ZWlVZUJ1TUxKRit1ZGRWbXA1ZG5UcjRMTlRSSkRMRTg4enZKRXl3ZER5?=
 =?utf-8?B?R0ljSGtMaVpKaU05TXNVdTF5ekw5bXpRU1Y5S0xWdTlHUTJMcUhzbGJuengw?=
 =?utf-8?B?SE9nbXlKYlVQYTZrQ3ZzdXE0UCtCR1RoeEVGKzNwa1NsdnI1S3hjRkptTU0y?=
 =?utf-8?B?dnhQUVByZXBjNjZrbGNsRHoyOHcvNmlHdCs0dE91dk00WU94MUljY0ZPN0Uz?=
 =?utf-8?B?aUJEWmlKOTRoVXRYVGZVaDRkSjhmeDYwVTFVRi9XU3hxWUxiWVUvT0ZIazBX?=
 =?utf-8?B?VUVQZFh4NkxKVzVEemJHZitsKzBkaXdYUTVZUkd4VGpPMjNYWnVrVFk3WUpV?=
 =?utf-8?B?OHQxTEpTSUd1TkVkVDRBMFVlemtuTUJyOHdWZFJjQmhmVDlOWlhTdk5WcjNL?=
 =?utf-8?B?L2ZLMDAxWkpQeFJ0cWZmc2NZbk95Q1MrTEx3MEVNT0dERE5NajE2d2hvMDc4?=
 =?utf-8?B?QlRZRzB0UDlvdUVlRFRmS20zTkVvT3hXaklIYzRIQUk2OVRFQ0dtL1RFZHUy?=
 =?utf-8?B?aW1ERHRnVG1kdW5PazVjeDU2UE9uMHoyUTltYTk1Sk9BQU5IT0tpRE8vT0Jt?=
 =?utf-8?B?eUc0M0VwczNvZFdyWXpvcURxWURabWdnZTlrUUJIRWhsTU9yN0pyQWJGWU91?=
 =?utf-8?B?T2lTazdWUi9VckZTa3RFejRZQmFOT1ZTbDJBUGlVcFhuWlRKVGpZVVFkRWx4?=
 =?utf-8?B?VExOMjdUSkMzWUNXelBpZ2ZxMkNYS2E2TU1JTXhwRXpuNVBSVjlPKy9nTVFk?=
 =?utf-8?B?dVIyUjZoQytFb1J3WDMrQ29WbitNTUFIMDZHb1ZiTVd2ejNQZXpLVFg4SjNZ?=
 =?utf-8?B?bVBFTXljVVArYUNnVUZaN01hcjVJRGZaT2JiY2psRlllejBGeWthQWJVU3NK?=
 =?utf-8?B?SXBxTmpJSVFRTVVETlU0R0hrRU5vY3NPb0ZYbXRDTllCVlljcTZnbHBEbjht?=
 =?utf-8?B?RkJkYk5sTDF1Q3E0elhnQnUrQlhoUXBhaXVLZjZ5VGVNWDhja0I4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003643dc-9386-4745-8b32-08de59eb6b87
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:21:19.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3Aj5asegcVShy+trC66GWCqN9qsgarfF6+N84eXnPvfNDjglWiwuUL42y9smh1DLSPMAQEpwsr6ncgyEEVuQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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



On 2026-01-22 12:09, Alex Hung wrote:
> This fixes the following warning:
> 
> WARNING: Running the setup command as `meson [options]` instead of
> `meson setup [options]` is ambiguous and deprecated.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index c0382ce43..b4b9a37ea 100644
> --- a/README.md
> +++ b/README.md
> @@ -88,7 +88,7 @@ running.
>  The test suite can be run using the `run-tests.sh` script available in the
>  `scripts/` directory. To use it make sure that `igt_runner` is built, e.g.:
>  
> -    meson -Drunner=enabled build && ninja -C build
> +    meson setup -Drunner=enabled build && ninja -C build
>  
>  `run-tests.sh` has options for filtering and excluding tests from test
>  runs:

