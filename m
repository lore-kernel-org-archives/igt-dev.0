Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F3FC5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 03:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D057310E52B;
	Fri, 14 Aug 2026 03:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KdZJdsx6";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DD210E52B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 03:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omTLTx33z0/YZHqVQurs8d1N4xp7vKfKqXvWZ4wLdg01xJmkSMwJer8wUDnc4ezx6UUGSap1AjJYAmeFKlrk8PrhToT4OIPH9NmzLn/+mn4sZkaKeAEOpltoWir0pDITsUYSPVhtjrJMugPgKRkmW+5gNqu65mt71Dz48dQVXlpVbKimLbwGRAZk389DawHwrputA+1byJj8xbkHdBSlj8s+EydEGM0/mprRrLYf1DOeb9C9xzM+EkJKwc+EzX82/nPGBZTwukzUs5usLIyGMC9xDjRVxjnPymgOrTfDJFwD52cTYbmsI8DQ/f0f5hXBP9bKDB+xbpD49mvj+tSTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCyvDWG+s/xFOGkMBJ3l1QuZ9ygMj9KWqOstZEkXtJQ=;
 b=gbX6sPg03OHissKXNZgH1+yaExUWNXPpAYEtYU68ejbs6OlM56BlgfCm3e6kJFXU++4CEUWdk814CjqEwdYHJvhwARVHg5kfzoSOg9UvU/OayTV05ldbQvg+R9wbCXsdelTwQ9aF8AGTIi2E8TFH1Aq6bUkCRRyKlSKOo/G5eJ+EMb9AsnB+aBlvfnlHse//qhIfWONOYJOSyafC6KYfd+65mqF/HsxeIXBQtH4FpwvxCtRGlov2zcnpcvHtQsTWrVQs9LV81yUjzjyy0P9lpkdUZdPToJCp8oiosEdh49r/Q0WmB1S8jTtTL+bN7K/DXEfUOlrnjxHX7+ZoPRFElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCyvDWG+s/xFOGkMBJ3l1QuZ9ygMj9KWqOstZEkXtJQ=;
 b=KdZJdsx6q797aImaJXcMATkG3jUag/vgaaRuonwiQHp2atXHM8aqwskTaGgqWhf/4LlMxG2V2wm29k/GIBcdcOAI3M38m/BvPYZ+jXzSV4Jk5A/qugHV555SjwH0T2bgX1Gjitv2vw0MBilX4iJsgvbaE78HDu3l1GuofkItrQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 03:55:25 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 03:55:25 +0000
Message-ID: <62e1b4a3-ba46-4117-a3e3-05f9866aa614@amd.com>
Date: Thu, 13 Aug 2026 21:55:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-7-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260811143558.141813-7-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eb9d62-4ff7-4b8b-1d10-08def9b7df25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: QyuU49LZG2DnmStTrKHcNCA0qyyhpLuWKrA2XwiqiQlArBjHgUdjlP5WB5PWxCCJR6I8yp+rxBkCnBhIRfV+vHYfOQ2g0mmVfKaXK8cXBO2GPCWFjGxUIs0iZHygsYJ77yI0v2zxIHgXFjrh2VxtDueYZwVSzC2vn4JThHCb8mGJCcfguMpwcQCTpjLyEw6XbQonf0KyFUEwPMr1Ur04xjkQ5B0Zkt9zEHRnOgDWXQdMuJEb7m119ieGj7Aulrg3RTdpPe2tmLRPZddAebJVwMJN4nL15vB4qk2toShOtABVUUaPucFUWLgTjXxFdp3nioF3O3puZKXSjQ7aLDdWAeHF0SxA/qNp5TfCGtmiuuYNYR9iVSnHI9efxNouNrayiNq5cHNqvPFw6SZU5wVhJyTYJmJpAAm4boQJT8EyydWYvVWd+z+NYCp9vNBE0bYguw/DfXGohpE6BGow50ygVNKY9TtFycmQvJHAn3My7Bd0eTbCZ2K/QTsBBJk0o96c9QeOp99qX++qzHrCccLqN1XcEH19ODCuBShvIGKs4f58rVzHYVCOhFT6fJYdzfvPbfLeLZ6/iqsHfHj+dFoRCjRXj43isY7mqqPdH0pYGMJSZ3cNQi6kQ+cHYJEbXRFwntAVHK5Dl8zQjWWhPQxPgSTOHWQ/AT6N2BnlDbTRNuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEJQTmR4OCtsLys5L3ZZdXRNRjgrcE1SVHI1UkFsYnpGZEtXdjBJNHkxZVpk?=
 =?utf-8?B?aWdpNCtZY1VMYUJFbXBZKzNTZHh5UFJnN3ViVStiN1pjOTNkWGxwOVVYTVFi?=
 =?utf-8?B?N3hMdFVRaWJDZEFqaWxvQmFCeTB5ZU9laERiZmUxdUxYMlEyWEtQVzVnUG5j?=
 =?utf-8?B?M3hadmw0RzRlSjI0TitOeStVaFU5VXlpOG9ralZRY0liTHoxK0pxNGdPTWZm?=
 =?utf-8?B?REs1U2pOSlNhNS9zdmVOd2FNTVJtZzNLL0hnVW5Ta3VpZWNjazIrRUliUC8w?=
 =?utf-8?B?V0p3M3hvSlQrWGtHQmg3UGE4dGpLUlhPU3JlQjJreHBpeWFEMm5RYWNoRTVh?=
 =?utf-8?B?MXBLSEdaVHhCdVNDNi82Um1iUDdGL2JScGI3NkdIaWtBdDc5Qi94YU5BSzB2?=
 =?utf-8?B?L0pEcXlHYkdJMDBHNGJwZ0dLRktERGZXWHJrMnJuNnAxMjY3bytNb1V3a0cx?=
 =?utf-8?B?cFdoYTF1YXdsK09oTENYVjU0T3BZeEF0ZnZXL0FpT2N5Q2NTQ2tPUmVmSjBk?=
 =?utf-8?B?NG01Y1lCaWVwY1hSL29qcXBMVHY0U0xLamV1cFV5NlRBdlRYSGV5WG1hT1VM?=
 =?utf-8?B?VnFvSUx6TXJ1cTlkS1NPNi9ZS0QrZmptZWJzNjkvbnhyVTBPMDFpeTlpL1du?=
 =?utf-8?B?WDRuV0tJdG5McFVwRU5iNVJBRTRPNE4xcmxVZ3dyblZ6czJ6YytqREZGOXBr?=
 =?utf-8?B?ajAzWUlPV1Q4cm5oSTJPWmZieDkzZGRZU3VsUGROSGRkZ0g1V21VSVhvQnRN?=
 =?utf-8?B?ZkF6Z1BHN2t3RDJmZ0NDbThoMHlveHZWbVorNFNaaUU4aW1QR2g5RmIyam9x?=
 =?utf-8?B?VHVJbkEwckhYSDN5aG93NFlRZlBRQ25OUnp5dFBvbkFlbUJOMXJGLzFTVFZH?=
 =?utf-8?B?WlB6UzkyNUVjckQ4ekhQLzVjL01ya2o3Z1d1MUNxZmZlWUVSSlhUcG8wdENq?=
 =?utf-8?B?cStGbnhodUNRV2xPdDR6QnZBaW4waW82Wm5QQy92YjdnVFgwWWQ0YXBqZ3pK?=
 =?utf-8?B?TDJ4RWxmalplTWFNREEzRTBtaVNOOXVFemhqRDJMY28zVmNTSkc5SURneTU3?=
 =?utf-8?B?UDJCVzNMdHl4clc4TTdheW5vN2dRaU9adXk0M0JmY0xyTUpOMm02Y2VZS1pP?=
 =?utf-8?B?THI5Qi9RS0JSNTBuQk5iTFgyVjZxS2Y5QW5ZWkN2blR3U0UxWUlFTHZiRXF4?=
 =?utf-8?B?ZmhJSWlQN2o2VTVnbkkyT0gvTmkyMmQ1ZEg2R2ZQVnJvSTJYMHBjSUcySDM1?=
 =?utf-8?B?V3JxVDQ4eTdlV1JkTUllTUg2djQvRzVPTkRoYUM1SEluT0MvQ01Cdk1FNmll?=
 =?utf-8?B?ZTh4b1h6cGVxMkhPaFY3RjEyMnB6S0JSMjdsK0k2aXBweGlQbjdtR2hPVlZZ?=
 =?utf-8?B?S2QzU1drOHhlTTlwYUNmRjBxeDlEbU92cW80K1F2NjgyK3gzS0NsdjJaMWFW?=
 =?utf-8?B?M0JmeUJzck9va0x0WUk5YjdSRjRuY2VZYkdDdmNjbTBrVHNJbStweDNtVFAz?=
 =?utf-8?B?QTBueWJmQ3ZRRDFCdkl3VjVmUTRQTUNpSnY2czFkWUNsazU2T0ZxbUJCdUY0?=
 =?utf-8?B?R0ZhSldUdU1sL2dXb0tsblZFdExpcFV4L2JYaHBYVDY2ckZrcmMwQ0k2ZjF3?=
 =?utf-8?B?bWE4OGVFZGZBOXdqaDJ4SnhKYjRTM3RKR3EzM2Yza2xaRG1PYnhxcW53cFlE?=
 =?utf-8?B?MXBnZ20zZTBnOVZhTlg1T3pEckFaOFJHR0QvT1EvclJ1REhGYlMzaHNudTRQ?=
 =?utf-8?B?aGVIUm1oTFUrYWR0Q0dYNjhyaFRxMjVxeVV6b25qcHMrZHM5MVY4L2g1ZXVv?=
 =?utf-8?B?VXdqL2FtZzJvWHIyZXVzYmJScTBtYVJLV0Y2cTk5d1NuZndNNFdNVSt2YWxP?=
 =?utf-8?B?RjhzMFhnZHlVNWJYUEhCYlFjY1ExbEpPS0wxMVRobTZ3c2JNQmEwSTJtRmdI?=
 =?utf-8?B?RFI4Zm9BS3NoRzdmaW0xQ0pJTWYyVGlnOFlJV3ZjOEdvbGxXa3dNSmJudXlV?=
 =?utf-8?B?YlpyMys4RTJ3WlJaT0UrQWVHMlFxRWZ3ZGxWRktjL1p0U0FhTzZ3THlGdVBk?=
 =?utf-8?B?T0xiVUlvUEdKTVY2L1oya3EyN2l1NXhEU1YzbnNsMlR0cjExRmMzVVdMOEtn?=
 =?utf-8?B?YUQwdWtXQkpKSnI0NEc2Y3ZOQVVCMG9RWVoyWkNZNzJTbGgvenI5TFhSZDlv?=
 =?utf-8?B?SjVOOW0wb2ZLbWFrcmR2NXNhMmxrRDRXSTNtb3FHUGx5OW5OSVg2S2FZMHJO?=
 =?utf-8?B?K3hzY1drREFNMVV4NytTR3FMMFk0RXBzZnNCUzhwYzlsUkNyRkhVWURzdUl3?=
 =?utf-8?Q?CyuN284gEJve+eTDG9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eb9d62-4ff7-4b8b-1d10-08def9b7df25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 03:55:25.2977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5clvwEE2kutGky2l5rZDvoO3ac8cMBFaa39GK6xnQGJEqepluY+qZMkAIueCoDeQ8xhMra9Nq2K7hREHB9UPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
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



On 8/11/26 08:23, Melissa Wen wrote:
>  From documentation, the test requires i915 or xe driver, so make sure it
> only runs with intel devices. In addition, it's a CRC-based test, making
Should this test be moved to tests/intel/?

> kms_colorop with writeback more aligned with color testing and
> validation. Other drivers should work on adapting this test to their
> needs if they are looking for CRC validation.
> 
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_color_pipeline.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 78860a845..3978745a5 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -372,6 +372,7 @@ int igt_main()
>   		igt_display_require(&data.display, data.drm_fd);
>   		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>   		igt_require(data.display.is_atomic);
> +		igt_require(is_intel_device(data.drm_fd));
>   	}
>   
>   	igt_subtest_group()

