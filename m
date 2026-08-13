Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3272C5CFCF
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 16:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AC110F425;
	Thu, 13 Aug 2026 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XtWwWyWR";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E9710F425
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 16:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcAK/CjGXD13wOeHGzXoXaQT0DyOlr40/YYqWv5phsGB8BT/fSe4QQkUhqty7RW9xpY9OqvxrflmaLSs6SD/ANN2kVx0PrrclPHgv3/5pkwuENFot2eADVuHi0d0k6+tixMf3GWp+Pol7SGLtODutMIRCwTGaXsZEUMvh1mI2KZCxKqq2f/3U81k+aMNadlpRC+e3elGyhY58AQdwyFM6FeGPjtf/Tz2lDZYXnOxp7GyXzfLkUZIH0t0jVcgFmz/Ly48dB36ztjFlKHdqR4Pn11gUUyNUsAmO5hqD9ykayo/eDUCtF6Dhvz+L5x4v8iqCLskqQlw8sjLT+YYj3IuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjQRrAd3ZBPKix3TKx9oUDuT0U/FkNRiaCrcsUzL81U=;
 b=IJjxLOCcq4VzF2OwLtnOTqzWTO0I2BZbLmJHLC69ktrENBLnKl2N7gibNs5HNvotNKvUlMFnhUhS3wF4IeGRi2rmOrq1HNi34MEWCmRtVAfrLlQkDgprCuYjGIvogsQP4kIP1hwN4Vg9EGpdWSsmth4C6j5JkC8q3BrIpSKbmyQXSup6BgsBJKjHRwxv5CIn6QZPvSQnXSswmJxFRkH7mVMzna39xM0vAamtuMKg+gd1+Emn+gA/u0AqTMctPVRXa/tpQQxGUCctEHl47lkaHGp9f7okHLoO7kwNj2n1rqxTYhZPuYdfeaDlf1IGGiCib9Bc8hjRYy++xLCH/frjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjQRrAd3ZBPKix3TKx9oUDuT0U/FkNRiaCrcsUzL81U=;
 b=XtWwWyWR1ABsdh7ShSo05t8NJERnACx5L+JSqwEGfSVLDJ5K+ynI+LBkgw7zPOy8XZEvjw+qBLz4KPG1xoyr92neXl+rOezI2ijutRZVOoUBemXuxgKMMm+iBoE1SqoXpjh9GpBpSFCnPf4eZSYVNf3U+Z4+RuEdx5VpQbGLxQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:32:36 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:32:36 +0000
Content-Type: multipart/alternative;
 boundary="------------0kbS04fQoNv9cjLgEzBuL4w7"
Message-ID: <800efc38-a2ff-4943-aecf-247d6f70746d@amd.com>
Date: Thu, 13 Aug 2026 12:32:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] IGT tests for DRM_IOCTL_GEM_CHANGE_HANDLE (race
 conditions + edge cases)
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, simona@ffwll.ch, jesse.zhang@amd.com
References: <20260806021232.200317-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260806021232.200317-1-vitaly.prosyak@amd.com>
X-ClientProxiedBy: YT4PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::27) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: d61a1b31-6625-44fb-c608-08def9587b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: PV2BjVqjF9LtOX0YmucopgaNBfOfVGJDiVPZOzwqKeuyTp0OlDDfySTR9AINlyiFdv77c05pqG/eol46btfWWWOi3v9h77fY5MUtNw3xq6JFmvPkrbCeaEiKbAUe/qgEtvsWBzqBz5gl2W/gPuqFA3BKTnWYDQw1D/ygV7tu8sHtK7X4Acu6wEMSemBXXa6xqAfrpoYWErIL1lJGUkp9Pg9pzZSee//F+5+hIpKH6xSV3f8U8VmH/o278x5yMxyYyknIa8LmUag+GVTWaFpQyh+cDLXLJsGkBzOLGxPK5f3S4uhOjfNWG77u6caRAW5CPSZADGVjl5T9xneWn4BbXdaX/fJaBiSqGgCb2EfAlbc4HqUxt1qaU8O4yzbnG9e8nn6/+MkGyXl96KjKVpRX5Nr5qf+RXtSk0U7gvygkd1fpX4PPTJWNl5Pq7QmKR/E2VzgIuXE9dgj+v8OKezW8E+2ivXKRygJqoio0hLUY58Od7YeHakc2VTJkSl21dfUqi30Km6OIG+5d2q4uAjsosqg2DlN1A02Zk3gyow51l6Ekkp3qadR/alMNotsoNcZu0Xakx1ycs8mX7cSmRlbBIhsit2vc0U1RSejqNhzI7yW1HsdQQWg6q+17M5DDf4dU2Y7sCO/FJ00TGPD4Djhru7L+tw1zmlv6WXjULuF9WBs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGZpQkZxNzBpSDF4UmoxaXB5cXlrTkJmMVlxbmxGWnNHcVZ5MGFSZDJzdkJK?=
 =?utf-8?B?NDF2bzdCdVlaNXordnRMUkFwZWFNRDNONEYrTTdmOS9TdnRqbGdvR2VOcmE3?=
 =?utf-8?B?NFBRVFJSazBOYlRDRmFwdHQzOU52MmJXRGVMOVZXT3RMTnl3YzhjT0JJZmNB?=
 =?utf-8?B?eEpiZk02c1RCOWI5SjNUVmFtTWFpVTd4amw3dlJyNFI2OWZncGNONVVxaUZ5?=
 =?utf-8?B?aTJHelZNWjhib0N6MVZ4T2V5TTN4ZDZHVVAvdHZmMHV2ZkMxeXZHZkxjekV4?=
 =?utf-8?B?M3EvSVVVUjNvSTkvd2loNHAydDl3RDA5a3Z6bk5DTkNxT2lOOEUyZXpoUmMy?=
 =?utf-8?B?WXYxbVJpbVM1MkgvK3Q2Z0pZNnExNFZGcnVTUjNJL1Z4d0FiNWJhU21lRzY4?=
 =?utf-8?B?YWZ6T3dMTS9TREVFK1QvQUZueGxhZmJuUmoyNFdmeWtXMkdnRExUNU5CTmk3?=
 =?utf-8?B?akcxbHhRbkM0WVZoeGxZdlBmT1ZHTlhNUGVRWEVEelovL042YTgzZEhTb0lM?=
 =?utf-8?B?MVVSelNKRzhXNVBVRlpOWnQxUjNKZFNCMU1pREIzTHNxc2pHZGliZFpMMGth?=
 =?utf-8?B?UWhpeGNTb0J0ckdDUHFUNVVlQit1Wmh0cUZaZDJBZ2NsaEdxSHY5QTNsaVND?=
 =?utf-8?B?dXA1dm01YmRKNTJnSHpibUUxRUkzUkFIbkJObkxRUi9laGR5R3BWSDZ5VDFE?=
 =?utf-8?B?VGNpS0ZDbjRXeDZ3SmN0QzlsSkxUNVlEeFdsTmplckZWM0dVYVg2REhya0h6?=
 =?utf-8?B?WlozcUYrTnkreDZMajhqMGVWU0V6NjRyZ0NCSTVZeDhLem41aytyeWdrd0th?=
 =?utf-8?B?QWpJMUMwYnpKdmxyeXVmODRDdXVweE9FMWo0QUZyNkl5MG5qNVZ6QTVpdy9L?=
 =?utf-8?B?ak51R2FtVFlsNks3dDI0ZUhOVzVjTStqYTJYVFVHdFA5bndiWVAvYW9wRFBZ?=
 =?utf-8?B?cTdpN2hDNWNOd0VHdlRhSHY4TTEwVWRRcVJpUVFOVjNqcG4vQnFFaXhqRjRE?=
 =?utf-8?B?Yko5SkJneURQcUtrZXV0VDZBR0FpS3dEc1J2cnZtbFY2VFptRktCTmJHblU2?=
 =?utf-8?B?RnFoMGUvSk0rVnY3QWtYaHBNemV6M2dZNi9KZkRPcDErdDl5czZvcWpabFZI?=
 =?utf-8?B?UEdMcHBUeXpSRCtUUG0wajhoVUZEZnlMNzNYMCt3N1gvVGIyMHVsNDUvUWV6?=
 =?utf-8?B?dkFwOGNmNTdVMEVDZCtMOE16UEkvQXZHRGR1OTJ5bStyc3psZW1CVnZQUDhq?=
 =?utf-8?B?dzQ1NjAxdWVoazBDZi8raGRUblpvUUdZTEh3YTljSXdKZldPNVplR3JkdW50?=
 =?utf-8?B?Z2J5QmhFUVkwaUlmVU1OdktDeHh6bVBrMFBTR3BKOTh6elU2U3pPL1pCZW5j?=
 =?utf-8?B?YkwwMGxIa256RGlHQ1AyeU1GTlYxdlZKUVRiQVI3OWlVRDhNMmkzQjFvL1NG?=
 =?utf-8?B?M29kblVROW9yaG5Ickxvazlrc1h0TUhnaFZ4SVZQNUg3U21uVktLQXR0bU1u?=
 =?utf-8?B?V09HTlVZb2VtT2RwVlFxSnJpbE9ERDZVVzZ5ckNUNXcyR1FiY3pGYkZZZlg3?=
 =?utf-8?B?cDZpUEM3UFZiNmZwQnYzZHpYeFNsR3orMkRLWTlkMDVSdFJIOG1MQ01UUkkv?=
 =?utf-8?B?d25HUDU4cnZQc0FmUXNWRlA1Y1JzbjJnU3ZJekFTSUZxckFxUk1sQitPU0py?=
 =?utf-8?B?R1FaRm5oWTN5RHlZc0ZSREZMSml6Tk10b095OTVuUkgvcnM0UHR3Z2xtamVt?=
 =?utf-8?B?dUF0all2RkhhUnpLWTF2bUllbERHTUFCQUhGakpRRFFGRm1YNGpQT0VQRGY5?=
 =?utf-8?B?M0xoSU1GbmZVcERnQzVwanU1dHZ4SG40NktCaFZlVnM5dWpLdEpIZ2JDMGtw?=
 =?utf-8?B?QVhmeHZ2UmdjRFUwb1RleTdET2JKbi9aY0padkFZclRhQ1c5MS8wR2dzN1o0?=
 =?utf-8?B?NTRNZFZtTjRBVEQ3N3UyQ0ErWGQ5ZTFYZEkvT3RrL0Q3dkgyRDRBSnJkYndq?=
 =?utf-8?B?c0E0cVYrNzhLOVk5Tng5bmZxWlY0RXJPSmpoRW41cE15VCtsb2FFYnRNUWpY?=
 =?utf-8?B?b1RQek5RK2tVV2FaY2pvd01ndHZySitwc0tUdENTR0gyaXEyWXZ0b0drdkE2?=
 =?utf-8?B?eW9JZnU0d0xCVkkzK1pNanRSQUw2cmhtc1pWT3pHUFF1RjMxd1ZMSnFFaDJM?=
 =?utf-8?B?c2x4aVIzbXQwZmNVUWU4N2lvejB2ekpOejB0YVIrZzRXbkNUcDVDbVJMWVpr?=
 =?utf-8?B?NmdwZ1oyTm9SNGZhcnlPSTdxSEcyUTFqVmQ3NlU2aUZmRWRONVRab2ZIUWwy?=
 =?utf-8?B?QWxVOTdxckJmVUNKNGdzc1ArNjYvc3grcFdkVDNJdVJGNHNEVk4zQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61a1b31-6625-44fb-c608-08def9587b9e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:32:36.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysoE46YgZSkJ1Y5KVpVBSI1zbXqJtaSf68yCNW15BE96A2T1u7BAjiwiP5qASFUEjEtl0Osf/PaCcIX5U6ySaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268
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

--------------0kbS04fQoNv9cjLgEzBuL4w7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,
I wanted to gently ping this patch thread to see if you've had a chance to look it over. 
Thanks ,Vitaly


On 2026-08-05 22:12, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> This series adds IGT tests for the proposed DRM_IOCTL_GEM_CHANGE_HANDLE
> ioctl, which allows renaming a GEM buffer object handle within a DRM
> file descriptor without closing and reopening it.
>
> The ioctl is needed to close a TOCTOU race window in userspace GPU
> command submission: an application reads a handle, the handle is
> renamed before the kernel validates it, causing the kernel to operate
> on a different object than the application intended.
>
> Test structure (2 patches):
>
>   Patch 1 - 7 race condition subtests validating that the kernel's
>   locking prevents concurrent-access bugs:
>     - race-change-vs-close
>     - race-change-vs-change
>     - race-change-vs-prime
>     - race-aggressive-change-vs-close
>     - race-exploit-single-thread
>     - race-exploit-random-handles
>     - race-close-before-lock
>
>   Patch 2 - 5 edge-case and functional subtests validating correct
>   error handling and basic operation:
>     - noop-same-handle
>     - invalid-new-handle-exceeds-int-max
>     - invalid-handle-nonexistent
>     - edge-new-handle-zero
>     - functional-rename-verification
>
> The tests are GPU-agnostic and work with both Intel i915 and AMD amdgpu
> drivers via DRM core. They are placed in tests/intel/ following the IGT
> convention for all gem_* tests.
>
> Detection method: KASAN reports in dmesg (requires CONFIG_KASAN=y on
> the test kernel) for concurrent-access races; errno validation for
> error-handling tests.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Vitaly Prosyak (2):
>   tests/intel: Add gem_change_handle_race test suite
>   tests/intel/gem_change_handle_race: Add edge-case and functional
>     subtests
>
>  tests/intel/gem_change_handle_race.c | 1971 ++++++++++++++++++++++++++
>  tests/meson.build                    |    1 +
>  2 files changed, 1972 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle_race.c
>
--------------0kbS04fQoNv9cjLgEzBuL4w7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICRAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Kamil,</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICRAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">I
      wanted to gently ping this patch thread to see if you've had a
      chance to look it over.&nbsp;</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICRAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thanks
      ,Vitaly</div>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-08-05 22:12,
      <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260806021232.200317-1-vitaly.prosyak@amd.com">
      <pre wrap="" class="moz-quote-pre">From: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

This series adds IGT tests for the proposed DRM_IOCTL_GEM_CHANGE_HANDLE
ioctl, which allows renaming a GEM buffer object handle within a DRM
file descriptor without closing and reopening it.

The ioctl is needed to close a TOCTOU race window in userspace GPU
command submission: an application reads a handle, the handle is
renamed before the kernel validates it, causing the kernel to operate
on a different object than the application intended.

Test structure (2 patches):

  Patch 1 - 7 race condition subtests validating that the kernel's
  locking prevents concurrent-access bugs:
    - race-change-vs-close
    - race-change-vs-change
    - race-change-vs-prime
    - race-aggressive-change-vs-close
    - race-exploit-single-thread
    - race-exploit-random-handles
    - race-close-before-lock

  Patch 2 - 5 edge-case and functional subtests validating correct
  error handling and basic operation:
    - noop-same-handle
    - invalid-new-handle-exceeds-int-max
    - invalid-handle-nonexistent
    - edge-new-handle-zero
    - functional-rename-verification

The tests are GPU-agnostic and work with both Intel i915 and AMD amdgpu
drivers via DRM core. They are placed in tests/intel/ following the IGT
convention for all gem_* tests.

Detection method: KASAN reports in dmesg (requires CONFIG_KASAN=y on
the test kernel) for concurrent-access races; errno validation for
error-handling tests.

Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Simona Vetter <a class="moz-txt-link-rfc2396E" href="mailto:simona@ffwll.ch">&lt;simona@ffwll.ch&gt;</a>
Signed-off-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Vitaly Prosyak (2):
  tests/intel: Add gem_change_handle_race test suite
  tests/intel/gem_change_handle_race: Add edge-case and functional
    subtests

 tests/intel/gem_change_handle_race.c | 1971 ++++++++++++++++++++++++++
 tests/meson.build                    |    1 +
 2 files changed, 1972 insertions(+)
 create mode 100644 tests/intel/gem_change_handle_race.c

</pre>
    </blockquote>
  </body>
</html>

--------------0kbS04fQoNv9cjLgEzBuL4w7--
