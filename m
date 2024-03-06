Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB7AC5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 10:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B878C112387;
	Wed,  6 Mar 2024 10:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLs+ZQNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DFD112387
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719897; x=1741255897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=A/e5qPCOVLFbpE+S1DE2uyok2tZM9YGq1jj5oqoYdLI=;
 b=XLs+ZQNFYq9iIC+gUGKfwyrafcLDTtGGvyjJvWYuxkgTqLCqNTtxADxf
 Ya8KSFEhVSkkgxfWlHWXRxaXuML8rTZIHzRE1k+1GxCtmMKlKgRrvwwSl
 /E0aGuk8UlBgOp/7f29FLB6szORJUHZIDHRJXbriJSWaFWHx8Kbx1yWNU
 QA1wE9/4Fme/cJHofsfksoqG4W1eRHGqHUcyZB3kIhiNfxYGdpcHU2mpK
 tr3+IrJ6BflPjvfpQ9OICvWgFmw4dqyMe+BAj9qt9YIYXrmptMUOB4ppe
 yLA3sjbCMBh/JKlM0XY5f7c0LNU6WvBBsV+xTVBeZE8ubc2mLov43y1ka A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7265626"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208,217";a="7265626"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208,217";a="40687167"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 02:11:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 02:11:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 02:11:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 02:11:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbVemLpYN5BglEM55MVVc7b7UBBdjEtUG/kOxRD+W/ifhjxc0bMkybM5dKtydP7lI2DNoslMLJOLv92ydv9jebs8mlYFw0E6GDi91t5T+HY+tSoRSXGxgqnD02tIIfyaws4H7++RB8a0yDFlKdyvda3BEIZz5jp/Ge/XWy+JHH6WLsu2DCts4hfg1oHw8yOsrLOG6fZKgF9wmiBf/safZBoqP4Z+IVUk1i1rHIXHqNKJM/5MCVACassfPfQkqIxztuVrW7FIxCBqVNIKQbFMjac1p7W3PoRvKVtod4tRBKan/6Aut6rB6bqJp5ES6yB2iwF0fvGUXfLtxfUWu90guQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvFArNik1Hbjp+/SUVMiBUSWQmqjNjrfoYVuEIRRGxw=;
 b=Dga7BC3lVvEkN8rCTi644d50q60yhPITFnzlpjKGkrbo2PLoD3n+pqEiNHnhdKBs+o5SNZ9QVzHDAXOZ5TfewzeWICVZbrdOdXAIU0irPkpqmtkFSvYXvI3D1NYgfPiExdyAfQHdmZ4FEIZOxa/Wood7shRVIvUCm3yBji1yhMH//AAAQ534r9bkZmssmf6JzjkTpxZr5H5ONjOlOPEE8lcXkt5ccWZ9KpmnRKhZGMfUeSNa1vQvGcaQHmhRTPfK1v1V3oWwAyZ99XhEQG599ylN3wJJkw4NulmOKnTb1/9s+hzistLefUa8A5T5XLmdHX4zxXHYQ0V9dNcUrng3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Wed, 6 Mar
 2024 10:11:33 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:11:33 +0000
Content-Type: multipart/alternative;
 boundary="------------pGXLQWTIdZl0N4mvy3cMSrlD"
Message-ID: <2d71c76c-8205-47c3-9c5b-57671296eddc@intel.com>
Date: Wed, 6 Mar 2024 15:41:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: revamp
 kms_big_joiner
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240306052509.717026-1-kunal1.joshi@intel.com>
 <20240306052509.717026-3-kunal1.joshi@intel.com> <Zeg9KosfNa0Lld1C@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <Zeg9KosfNa0Lld1C@intel.com>
X-ClientProxiedBy: PN2PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::9) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 7262692e-ed19-4bef-8d08-08dc3dc5cc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D++7CVgQ4jgICXBX/3An4AzINfPgfAYlcu0YSbzR5NEH/SHAeUaNQYL8QZlGJbucY/NYbVqJIDM5WJIGFoVYUhJSBPoFBkD/iX+R9Jx0pfKhPlt/A2nkWVUnHDvPB5nGD3PoOlMbRgflZl5DX3q7bsy/Wd6UTPdMOI2vbCOY6pL3qQOHSh+UfX0KaCKsVApCRJKDKkZH9OMUOwCx0pUbFYDWJyc/xlPQeLmC4EtUX2isM5eyuGEsKH/GTA3buSo2tqc7tdVhsMkZOUlaNmUk7/Ikk3WmgfREGRX3o489LTdBOvoHFgo1DjKO9N2h+zQCwHKSNJI66Fi59wj7om8vwEBNFw63CIcju0DWhI5QKlm8RkXqbsmqmRMUHr6ZbgqM9SAiQ4HP59tOsukYlBsw5+JXjcGZbbna/5Ij6rtm7ecc5OOf8iPXMs5mt0rufT/qTq6xSthYn4Mk+t8TqRna1bEZTVe/Bfqu8AeENktjC5JpElvYV0Tyn+UI542nPXOOCcMCyLmjYQlT7WE3DuZ4+ue/AjrJDWOheYx5yQx0PiKmo/ptlzTpvGRZiegMdNDjKtMQOOKzI2a0ejWKRg75F0zJlhLJ4L+ciV7IJnAAQIsFxKvEzllvtNM7ASg9Nuy0wKWr8n04Cd/gB0wcUo4ezHjlhNrWFxUsGCmLm70NH4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFNiUnIzQW1veGptckIrTVN1eUZkSVlidlFlZ2l4SWZGdmI4TDNGRTN3R3Vx?=
 =?utf-8?B?dHowaWgwVGdVMnhsVzJ0ZVJGQmVPQjl3NGJldkNzZStCek13Um93bVlqMnYz?=
 =?utf-8?B?QWk4Z21HRUhldi8xaE80bUtoandpbjNzYzRaZ043NHBlS29qaG0rVG9ySjBX?=
 =?utf-8?B?aVdlNnlzaDQwY0U2V1RTcGZVbkdoTmRhdDZIS3hDNHI0UGdXVDJVS1hHOXFn?=
 =?utf-8?B?NHEzbHdxNHhiZTd4Y2dtU1p3MGpXN25OdUxpN20yWm1WZ0ZZczRSYVZVYlg0?=
 =?utf-8?B?VXAxcCsrME4wMGt2VEhMYWYrZjlSR1BiTjl4d2dqc0JwMWFuVVkvdktlNUFD?=
 =?utf-8?B?KzNYOUh2TldHVThCT2c3djlBSm82RGJ4eWQxWUFRcFg4QTBDdjc4MFE1b3VF?=
 =?utf-8?B?QzJjUnhEbEdGR2pEd2pvQ2JNVjlnb2NBVkVVcWYyMTFCRVoyUERRcHIvTGkx?=
 =?utf-8?B?T2E1R29kdlZxa0pZMHNHU3VuSWlSWEtHVml3NHhTVzRBSytZdHovWk9yN2J4?=
 =?utf-8?B?VEw0TFlIcFUyUG80VkJzcUE4VGpQa3RlK3pjL2QyUDdnTHVnV0JQSmpGdWhX?=
 =?utf-8?B?dmNpYitJdlhHdkVtV0dDMEtmZG1Va2Jub205OWRKc3BBcmNLcnhVRGFFU3I4?=
 =?utf-8?B?VmoxcGhxMWQ3Q3BVT0gzdEFZemljVVdkRGtLaEtqNllvWXFNdFphN0l1a0FH?=
 =?utf-8?B?WmxKYVBUc0VLeUVvN21PNk11TEV1WXd5eHRkYWUwemxvTjlNTGZwNEVqQTlt?=
 =?utf-8?B?OVZPRnRGbEZvOE5LUVdoRUh0cVFZS0lGQmwxRHdpUDZ6Mk5RWHNaNzViZDEz?=
 =?utf-8?B?Zk53MVZKWVdPRWJLNUVobGJ2aWhvNlBXWnJmL1ZvdkZMa1VBU2VYYmZtWHBs?=
 =?utf-8?B?VkN3dWVCS0JDN3Qzb2J4blYyWVB3QXBoby9CRElSN3ljZmhiK1RiRmtST0Nx?=
 =?utf-8?B?bUZPcnNtYUZXWk95cVFzVkZDM3dESlZ0azdQeEVqTWZtOUNHS1RCRm0wT2hQ?=
 =?utf-8?B?Qzl0WWZscWpxUUVGVW4rVGpVcG5YamwxRnVwSUI1TndJQnhWS3dJWDRTNnFx?=
 =?utf-8?B?ajVoQ1BET0h6MVdQKzdJbzJjQysyR20yR3FlYVN1cnFzeXJSSmkwQTdVL2xK?=
 =?utf-8?B?TEV2RlRUNEpTZkVycTc2cExhUkhNanU3Y3N0RGFDMG9zS2hXM3VmdlkreU1R?=
 =?utf-8?B?c1cyUy9PMHhERHVEbTNUSHZpbFcyYnBsMDdXRkV2cjR4ejk1ZW5CaU1kQWlL?=
 =?utf-8?B?T2g3NUliNUtVbHRJYXllSVExeVlpeFN4YTgzMTlzaW5BUytJS3B6ZGNLbnNi?=
 =?utf-8?B?d0FZWDdQck5mTGd3Yml2eWY0bXl5Z1dLT000WllhQy9MM2pWMlFBVCs0QU1I?=
 =?utf-8?B?QjNNU01FYmoraUovVHhHZVpHdkYzRVZ5cUZGdDh4bVFrcENmQ2RxRXd0K1dI?=
 =?utf-8?B?dUE1eEFOT1VRTUZGSzNpbXBqeU1idzl1OWxlcE1MT0swY2oyUmRuSWlpZFhW?=
 =?utf-8?B?TnlJb1RJbnJySXdwL0Fyd2pSeHZwUmY5dzNQM0xncEJ2a281b3U0RFRFZytk?=
 =?utf-8?B?VGdCR3dWU041OUVvTzI3WngvK1RhdDdROGc5RnlqMWtzR1hhMWxaWlNZQU9Z?=
 =?utf-8?B?Sis2NlFtYUlkUDQrSlVVUHJRaVl5OEtpaE1IVDNGR1ViaEhRdWxhN2xQQklC?=
 =?utf-8?B?bzB2ZDhJaldXak9LYTQ2bW8yNmNnZWVhQ3FYRldJN29jak9kRlBVeEtMYk9M?=
 =?utf-8?B?Y213Z3hoQWttQldsNEJ2eU1zQkNmN08xZTFjU0EvdlFELzNINjdqODFlbFpy?=
 =?utf-8?B?TTRIQThEcnA2SGovN2EzWVNPQ3VlRGlsQmlKUkNqWVhTL2lIUGNCcjF6bHdI?=
 =?utf-8?B?SnpOaWIrZ3NPclY3blpnNU5kN3ZOU1VzT1ZTN0dzWVU2VW9FQzJvOFVTSWpn?=
 =?utf-8?B?cmtTSUhYYnJHeEI2Y25rMCtFbnB5UEJGelRtdG0vZFBuU2hGdlFRQUxjSW0v?=
 =?utf-8?B?czVqWHlpa3ZoNytIUWpteGJnZmUrVWlUMFE4Qjc1SkVmS3NnMVhhOVVjOW00?=
 =?utf-8?B?WW8rWitNMWRpenkxOUtoMzMxSWlPRGVtL3g0T3YvaTN5TGxSU3BGOXE3VnQ0?=
 =?utf-8?Q?f4m6oKFa5mUKZ9x/8aez7hIQJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7262692e-ed19-4bef-8d08-08dc3dc5cc65
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:11:33.0103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w01DvdObtyoXkp2bdgvlKwHuln8/9lVhhcSYJ/AX4mRnIhhHxGVGKgwlQNNYDgF+oHc1BLSIbzge/nt7ZyVBAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
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

--------------pGXLQWTIdZl0N4mvy3cMSrlD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stan,

On 3/6/2024 3:23 PM, Lisovskiy, Stanislav wrote:
> On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
>> big joiner outputs are statically assigned to pipe,
>> rewrite to assign dynamically
>>
>> v2: Don't change license (Bhanu)
>>      Add documentation for generate_combinations (Bhanu)
>>      Print the pipe name (Bhanu)
>>      Remove unwanted commit (Bhanu)
>>      Move combine output logic to igt_fixture (Bhanu)
>>      split revamp and force joiner (Bhanu)
>>
>> Cc: Karthik B S<karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>> ---
>>   tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
>>   1 file changed, 187 insertions(+), 204 deletions(-)
>>
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>> index 28678b958..ba4097d8b 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_big_joiner.c
>> @@ -43,16 +43,19 @@
>>    *
>>    * SUBTEST: basic
>>    * Description: Verify the basic modeset on big joiner mode on all pipes
>> - *
>> - * SUBTEST: 2x-modeset
>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>>    */
>> -
>>   IGT_TEST_DESCRIPTION("Test big joiner");
>>   
>> -struct bigjoiner_output {
>> -	uint32_t output_id;
>> -	drmModeModeInfo mode;
>> +#define MAX_OUTPUTS 256
>> +#define MAX_COMBINATIONS 1000
>> +#define INVALID_TEST_OUTPUT 2
>> +typedef struct {
>> +    int combination[MAX_OUTPUTS];
>> +} Combination;
>> +
>> +enum joiner_type {
>> +	BIG_JOINER = 1 << 1,
>> +	INVALID_JOINER = -1,
>>   };
>>   
>>   typedef struct {
>> @@ -60,273 +63,253 @@ typedef struct {
>>   	igt_display_t display;
>>   	struct igt_fb fb;
>>   	int n_pipes;
>> -	enum pipe pipe1;
>> -	enum pipe pipe2;
>> -	struct bigjoiner_output output[2];
>> +	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
>> +	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
>> +	uint64_t combined_outputs[IGT_MAX_PIPES];
>> +	int big_joiner_output_count;
>> +	int non_big_joiner_output_count;
>> +	int combined_output_count;
>> +	int output_count;
>> +	enum pipe pipe_seq[IGT_MAX_PIPES];
>>   } data_t;
>>   
>>   static int max_dotclock;
>>   
>> -static void test_invalid_modeset(data_t *data)
>> +/*
>> + * The generate_combinations function generates combinations of pipe allocations
>> + * for a given number of outputs
>> + *
>> + * @output_count: Number of outputs to allocate pipes for.
>> + * @pipe_count: Total number of available pipes.
>> + * @pipes_per_output: Number of pipes to be allocated for a single output.
>> + * @combinations: Array to store generated combinations.
>> + * @num_combinations: Pointer to a variable that stores the number of generated combinations.
>> + *
>> + * Example (output_count=2, pipe_count=4, pipes_per_output=2):
>> + * Combination 1: 0 2
>> + * Combination 2: 1 3
> I think this might be a bit overcomplicated - just for your information, we can't deliberately
> choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
> used for bigjoiner.
> Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
> this code in intel_dp.c:
>
> if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode->crtc_hdisplay,
> 			    adjusted_mode->crtc_clock))
>           pipe_config->bigjoiner_pipes = GENMASK(crtc->pipe + 1, crtc->pipe);
>
> Means if you try to do a modeset with resolution > 5K or exceed max_dot_clock on crtc->pipe,
> then _always_ pipe + 1, going to be used for bigjoiner.
>
>
> Stan
>
Thanks for the inputs,
Goal here is to try various combination possible,
Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner output 
(DP-1) then we want to try
DP-1 on PIPE_A
DP-1 on PIPE_B
DP-1 on PIPE_C
DP-1 on PIPE_D

Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner output 
(DP-1, DP-2) then we want to try
DP-1 on PIPE_A and DP-2 on PIPE_C
DP-1 on PIPE_B and DP-2 on PIPE_D And so on, Going forward this will be 
useful we introduce any feature which can allow having more pipes per 
output also.

>
>> +*/
>> +static void generate_combinations(int output_count, int pipe_count,
>> +				  int pipes_per_output,
>> +				  Combination combinations[MAX_COMBINATIONS],
>> +				  uint64_t *num_combinations)
>>   {
>> -	igt_output_t *output;
>> -	igt_display_t *display = &data->display;
>> -	int ret;
>> +	int i, index;
>> +	int current_combination[MAX_OUTPUTS];
>>   
>> -	igt_info("Bigjoiner test on ");
>> -	for_each_connected_output(display, output){
>> -		enum pipe p = output->pending_pipe;
>> -		drmModeModeInfo *mode;
>> -		igt_pipe_t *pipe;
>> -		igt_plane_t *plane;
>> +	for (i = 0; i < output_count; ++i)
>> +		current_combination[i] = i * pipes_per_output;
>>   
>> -		if (p == PIPE_NONE)
>> -			continue;
>> -
>> -		mode = igt_output_get_mode(output);
>> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
>> -		kmstest_dump_mode(mode);
>> +	while (*num_combinations < MAX_COMBINATIONS && current_combination[0] <= pipe_count - output_count * pipes_per_output) {
>> +		for (i = 0; i < output_count; ++i)
>> +			combinations[*num_combinations].combination[i] = current_combination[i];
>>   
>> -		pipe = &display->pipes[p];
>> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +		(*num_combinations)++;
>>   
>> -		igt_plane_set_fb(plane, &data->fb);
>> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> -	}
>> +		index = output_count - 1;
>> +		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
>> +			index--;
>>   
>> -	igt_assert(!igt_check_bigjoiner_support(display));
>> +		if (index < 0)
>> +			break;
>>   
>> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
>> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
>> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +		current_combination[index]++;
>> +		for (i = index + 1; i < output_count; ++i)
>> +			current_combination[i] = current_combination[i - 1] + pipes_per_output;
>> +    }
>> +}
>>   
>> -	igt_display_reset(&data->display);
>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
>> +{
>> +	igt_output_t *output;
>>   
>> -	igt_assert_lt(ret, 0);
>> +	for_each_connected_output(&data->display, output) {
>> +		if (output->id == output_id)
>> +			return output;
>> +	}
>> +	igt_assert("Output not found\n");
>> +	return NULL;
>>   }
>>   
>> -static void test_basic_modeset(data_t *data)
>> +static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
>>   {
>> +	int i, j, ret;
>> +	igt_output_t *output;
>> +	uint64_t *outputs;
>> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
>> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
>>   	drmModeModeInfo *mode;
>> -	igt_output_t *output, *bigjoiner_output = NULL;
>> -	igt_display_t *display = &data->display;
>> -	igt_pipe_t *pipe;
>> -	igt_plane_t *plane;
>>   
>> -	igt_display_reset(display);
>> -
>> -	for_each_connected_output(display, output) {
>> -		if (data->output[0].output_id == output->id) {
>> -			bigjoiner_output = output;
>> -			break;
>> +	outputs = combined ? data->combined_outputs : data->big_joiner_outputs;
>> +
>> +	for (i = 0; i < data->n_pipes-1; i++) {
>> +		igt_display_reset(&data->display);
>> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>> +			output = get_output_by_id_or_assert(data, outputs[j]);
>> +			igt_assert(output);
>> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
>> +			mode = igt_output_get_mode(output);
>> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
>> +				 igt_output_name(output), mode->hdisplay,
>> +				 mode->vdisplay, mode->vrefresh,
>> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>   		}
>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>   	}
>> -
>> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
>> -
>> -	mode = &data->output[0].mode;
>> -	igt_output_override_mode(bigjoiner_output, mode);
>> -
>> -	pipe = &display->pipes[data->pipe1];
>> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -	igt_plane_set_fb(plane, &data->fb);
>> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> -
>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>> -
>> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>> -	igt_plane_set_fb(plane, NULL);
>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>   }
>>   
>> -static void test_dual_display(data_t *data)
>> +static void tets_big_joiner_on_last_pipe(data_t *data)
>>   {
>> +	int i, ret;
>> +	uint64_t *outputs;
>> +	igt_output_t *output;
>> +	igt_plane_t *primary;
>> +	igt_fb_t fb;
>>   	drmModeModeInfo *mode;
>> -	igt_output_t *output, *bigjoiner_output[2];
>> -	igt_display_t *display = &data->display;
>> -	igt_pipe_t *pipe;
>> -	igt_plane_t *plane1, *plane2;
>> -	int count = 0;
>> -
>> -	igt_display_reset(display);
>> -
>> -	for_each_connected_output(display, output) {
>> -		if (data->output[count].output_id == output->id) {
>> -			bigjoiner_output[count] = output;
>> -			count++;
>> -		}
>>   
>> -		if (count > 1)
>> -			break;
>> +	outputs = data->big_joiner_outputs;
>> +	for (i = 0; i < data->big_joiner_output_count; i++) {
>> +		igt_display_reset(&data->display);
>> +		output = get_output_by_id_or_assert(data, outputs[i]);
>> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>> +		mode = igt_output_get_mode(output);
>> +		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
>> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>> +				 igt_output_name(output), mode->hdisplay,
>> +				 mode->vdisplay, mode->vrefresh);
>> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +							  DRM_FORMAT_MOD_LINEAR, &fb);
>> +		igt_plane_set_fb(primary, &fb);
>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>   	}
>> +}
>>   
>> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>> -
>> -	/* Set up first big joiner output on Pipe A*/
>> -	mode = &data->output[0].mode;
>> -	igt_output_override_mode(bigjoiner_output[0], mode);
>> -
>> -	pipe = &display->pipes[data->pipe1];
>> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -	igt_plane_set_fb(plane1, &data->fb);
>> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>> -
>> -	/* Set up second big joiner output on Pipe C*/
>> -	mode = &data->output[1].mode;
>> -	igt_output_override_mode(bigjoiner_output[1], mode);
>> -
>> -	pipe = &display->pipes[data->pipe2];
>> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -	igt_plane_set_fb(plane2, &data->fb);
>> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>> -
>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>> +static void test_basic_modeset(data_t *data, int num_outputs,
>> +			       Combination combinations[MAX_COMBINATIONS],
>> +			       uint64_t num_combinations)
>> +{
>> +	int i, j, ret;
>> +	igt_display_t *display = &data->display;
>> +	igt_output_t *output[num_outputs];
>> +	igt_plane_t *primary[num_outputs];
>> +	igt_fb_t fb[num_outputs];
>> +	drmModeModeInfo *mode;
>>   
>> -	/* Clean up */
>> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>> -	igt_plane_set_fb(plane1, NULL);
>> -	igt_plane_set_fb(plane2, NULL);
>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>> +	for (i = 0; i < num_combinations; i++) {
>> +		igt_display_reset(display);
>> +		for (j = 0; j < num_outputs; j++) {
>> +			output[j] = get_output_by_id_or_assert(data,
>> +						     data->big_joiner_outputs[j]);
>> +			igt_info("Assigning pipe %s to %s%s",
>> +				 kmstest_pipe_name(data->pipe_seq[combinations[i].combination[j]]),
>> +				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
>> +			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
>> +			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
>> +			mode = igt_output_get_mode(output[j]);
>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>> +			igt_plane_set_fb(primary[j], &fb[j]);
>> +		}
>> +		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>> +		igt_assert_f(ret == 0, "Commit failed\n");
>> +    }
>>   }
>>   
>>   igt_main
>>   {
>> +	int i, j;
>>   	data_t data;
>>   	igt_output_t *output;
>> -	drmModeModeInfo mode;
>> -	int valid_output = 0, i, count = 0, j = 0;
>> -	uint16_t width = 0, height = 0;
>> -	enum pipe pipe_seq[IGT_MAX_PIPES];
>> +	drmModeModeInfo default_mode;
>>   
>> +	i = j = 0;
>>   	igt_fixture {
>>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>   		kmstest_set_vt_graphics_mode();
>> -
>>   		igt_display_require(&data.display, data.drm_fd);
>>   		igt_require(data.display.is_atomic);
>> -
>>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>> +		data.big_joiner_output_count = 0;
>> +		data.non_big_joiner_output_count = 0;
>> +		data.combined_output_count = 0;
>> +		data.output_count = 0;
>>   
>>   		for_each_connected_output(&data.display, output) {
>>   			bool found = false;
>>   			drmModeConnector *connector = output->config.connector;
>> -
>> -			/*
>> -			 * Bigjoiner will come in to the picture when the
>> -			 * resolution > 5K or clock > max-dot-clock.
>> -			 */
>>   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
>> -
>>   			if (found) {
>> -				data.output[count].output_id = output->id;
>> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
>> -				count++;
>> -
>> -				width = max(width, mode.hdisplay);
>> -				height = max(height, mode.vdisplay);
>> +				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
>> +				igt_output_override_mode(output, &connector->modes[0]);
>> +			} else {
>> +				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
>> +				kmstest_get_connector_default_mode(data.drm_fd, connector, &default_mode);
>> +				igt_output_override_mode(output, &default_mode);
>>   			}
>> -			valid_output++;
>> +			data.output_count++;
>> +		}
>> +
>> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
>> +			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
>> +			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
>>   		}
>>   
>>   		data.n_pipes = 0;
>>   		for_each_pipe(&data.display, i) {
>>   			data.n_pipes++;
>> -			pipe_seq[j] = i;
>> +			data.pipe_seq[j] = i;
>>   			j++;
>>   		}
>> -
>> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>> -
>> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>   	}
>>   
>>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic") {
>> -		for (i = 0; i < data.n_pipes - 1; i++) {
>> -			data.pipe1 = pipe_seq[i];
>> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>> -				test_basic_modeset(&data);
>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>> +
>> +		for (i = 0; i < data.big_joiner_output_count; i++) {
>> +			uint64_t num_combinations = 0;
>> +			Combination combinations[MAX_COMBINATIONS];
>> +
>> +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
>> +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
>> +					 i+1, data.n_pipes, num_combinations);
>> +
>> +			if (num_combinations > 0)
>> +				igt_dynamic_f("%dx-big-joiner", i+1)
>> +					test_basic_modeset(&data, i+1, combinations, num_combinations);
>> +			else
>> +				break;
>>   		}
>>   	}
>>   
>> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>> -		     "when the pipe is active with a big joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset") {
>> -		data.pipe1 = pipe_seq[j - 1];
>> -
>> -		igt_display_reset(&data.display);
>> -		for_each_connected_output(&data.display, output) {
>> -			if (data.output[0].output_id != output->id)
>> -				continue;
>> -
>> -			mode = data.output[0].mode;
>> -			igt_output_set_pipe(output, data.pipe1);
>> -			igt_output_override_mode(output, &mode);
>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>   
>> -			igt_dynamic_f("pipe-%s-%s",
>> -				      kmstest_pipe_name(data.pipe1),
>> -				      igt_output_name(output))
>> -				test_invalid_modeset(&data);
>> -		}
>> +		if (data.big_joiner_output_count >= 1)
>> +			igt_dynamic_f("big_joiner_on_last_pipe")
>> +				tets_big_joiner_on_last_pipe(&data);
>>   
>> -		if(valid_output > 1) {
>> -			for (i = 0; i < data.n_pipes - 1; i++) {
>> -				igt_output_t *first_output = NULL, *second_output = NULL;
>> -
>> -				data.pipe1 = pipe_seq[i];
>> -				data.pipe2 = pipe_seq[i + 1];
>> -
>> -				igt_display_reset(&data.display);
>> -				for_each_connected_output(&data.display, output) {
>> -					if (data.output[0].output_id == output->id) {
>> -						first_output = output;
>> -						mode = data.output[0].mode;
>> -
>> -						igt_output_set_pipe(output, data.pipe1);
>> -						igt_output_override_mode(output, &mode);
>> -					} else if (second_output == NULL) {
>> -						second_output = output;
>> -						igt_output_set_pipe(output, data.pipe2);
>> -
>> -						break;
>> -					}
>> -				}
>> -
>> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>> -					      kmstest_pipe_name(data.pipe1),
>> -					      igt_output_name(first_output),
>> -					      kmstest_pipe_name(data.pipe2),
>> -					      igt_output_name(second_output))
>> -					test_invalid_modeset(&data);
>> -			}
>> -		}
>> -	}
>> +		if (data.big_joiner_output_count > 1)
>> +			igt_dynamic_f("invalid_combinations_with_two_bigjoiner")
>> +				test_invalid_modeset_two_joiner(&data, false);
>>   
>> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>> -	igt_subtest_with_dynamic("2x-modeset") {
>> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
>> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>> -			data.pipe1 = pipe_seq[i];
>> -			data.pipe2 = pipe_seq[i + 2];
>> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>> -				test_dual_display(&data);
>> +		if (data.combined_output_count) {
>> +			igt_dynamic_f("invalid_combinations_with_bigjoiner_non_bigjoiner")
>> +				test_invalid_modeset_two_joiner(&data, true);
>>   		}
>>   	}
>>   
>>   	igt_fixture {
>> -		igt_remove_fb(data.drm_fd, &data.fb);
>>   		igt_display_fini(&data.display);
>>   		drm_close_driver(data.drm_fd);
>>   	}
>> -- 
>> 2.25.1
Thanks and Regards
Kunal Joshi
--------------pGXLQWTIdZl0N4mvy3cMSrlD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Stan,<br>
    </p>
    <div class="moz-cite-prefix">On 3/6/2024 3:23 PM, Lisovskiy,
      Stanislav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Zeg9KosfNa0Lld1C@intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">big joiner outputs are statically assigned to pipe,
rewrite to assign dynamically

v2: Don't change license (Bhanu)
    Add documentation for generate_combinations (Bhanu)
    Print the pipe name (Bhanu)
    Remove unwanted commit (Bhanu)
    Move combine output logic to igt_fixture (Bhanu)
    split revamp and force joiner (Bhanu)

Cc: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>
Cc: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
 tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
 1 file changed, 187 insertions(+), 204 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 28678b958..ba4097d8b 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -43,16 +43,19 @@
  *
  * SUBTEST: basic
  * Description: Verify the basic modeset on big joiner mode on all pipes
- *
- * SUBTEST: 2x-modeset
- * Description: Verify simultaneous modeset on 2 big joiner outputs
  */
-
 IGT_TEST_DESCRIPTION(&quot;Test big joiner&quot;);
 
-struct bigjoiner_output {
-	uint32_t output_id;
-	drmModeModeInfo mode;
+#define MAX_OUTPUTS 256
+#define MAX_COMBINATIONS 1000
+#define INVALID_TEST_OUTPUT 2
+typedef struct {
+    int combination[MAX_OUTPUTS];
+} Combination;
+
+enum joiner_type {
+	BIG_JOINER = 1 &lt;&lt; 1,
+	INVALID_JOINER = -1,
 };
 
 typedef struct {
@@ -60,273 +63,253 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb;
 	int n_pipes;
-	enum pipe pipe1;
-	enum pipe pipe2;
-	struct bigjoiner_output output[2];
+	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
+	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
+	uint64_t combined_outputs[IGT_MAX_PIPES];
+	int big_joiner_output_count;
+	int non_big_joiner_output_count;
+	int combined_output_count;
+	int output_count;
+	enum pipe pipe_seq[IGT_MAX_PIPES];
 } data_t;
 
 static int max_dotclock;
 
-static void test_invalid_modeset(data_t *data)
+/*
+ * The generate_combinations function generates combinations of pipe allocations
+ * for a given number of outputs
+ *
+ * @output_count: Number of outputs to allocate pipes for.
+ * @pipe_count: Total number of available pipes.
+ * @pipes_per_output: Number of pipes to be allocated for a single output.
+ * @combinations: Array to store generated combinations.
+ * @num_combinations: Pointer to a variable that stores the number of generated combinations.
+ *
+ * Example (output_count=2, pipe_count=4, pipes_per_output=2):
+ * Combination 1: 0 2
+ * Combination 2: 1 3
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think this might be a bit overcomplicated - just for your information, we can't deliberately
choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
used for bigjoiner.
Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
this code in intel_dp.c:

if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode-&gt;crtc_hdisplay,
			    adjusted_mode-&gt;crtc_clock))
         pipe_config-&gt;bigjoiner_pipes = GENMASK(crtc-&gt;pipe + 1, crtc-&gt;pipe);

Means if you try to do a modeset with resolution &gt; 5K or exceed max_dot_clock on crtc-&gt;pipe,
then _always_ pipe + 1, going to be used for bigjoiner.


Stan

</pre>
    </blockquote>
    Thanks for the inputs,<br>
    Goal here is to try various combination possible,<br>
    Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner
    output (DP-1) then we want to try<br>
    DP-1 on PIPE_A<br>
    DP-1 on PIPE_B<br>
    DP-1 on PIPE_C<br>
    DP-1 on PIPE_D<br>
    <br>
    Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner
    output (DP-1, DP-2) then we want to try<br>
    DP-1 on PIPE_A and DP-2 on PIPE_C<br>
    DP-1 on PIPE_B and DP-2 on PIPE_<span style="white-space: pre-wrap">D

And so on,
Going forward this will be useful we introduce any feature which can allow having more pipes per output also.</span><br>
    <br>
    <blockquote type="cite" cite="mid:Zeg9KosfNa0Lld1C@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+*/
+static void generate_combinations(int output_count, int pipe_count,
+				  int pipes_per_output,
+				  Combination combinations[MAX_COMBINATIONS],
+				  uint64_t *num_combinations)
 {
-	igt_output_t *output;
-	igt_display_t *display = &amp;data-&gt;display;
-	int ret;
+	int i, index;
+	int current_combination[MAX_OUTPUTS];
 
-	igt_info(&quot;Bigjoiner test on &quot;);
-	for_each_connected_output(display, output){
-		enum pipe p = output-&gt;pending_pipe;
-		drmModeModeInfo *mode;
-		igt_pipe_t *pipe;
-		igt_plane_t *plane;
+	for (i = 0; i &lt; output_count; ++i)
+		current_combination[i] = i * pipes_per_output;
 
-		if (p == PIPE_NONE)
-			continue;
-
-		mode = igt_output_get_mode(output);
-		igt_info(&quot;pipe:%s, output:%s, mode:&quot;, kmstest_pipe_name(p), igt_output_name(output));
-		kmstest_dump_mode(mode);
+	while (*num_combinations &lt; MAX_COMBINATIONS &amp;&amp; current_combination[0] &lt;= pipe_count - output_count * pipes_per_output) {
+		for (i = 0; i &lt; output_count; ++i)
+			combinations[*num_combinations].combination[i] = current_combination[i];
 
-		pipe = &amp;display-&gt;pipes[p];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		(*num_combinations)++;
 
-		igt_plane_set_fb(plane, &amp;data-&gt;fb);
-		igt_fb_set_size(&amp;data-&gt;fb, plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-		igt_plane_set_size(plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	}
+		index = output_count - 1;
+		while (index &gt;= 0 &amp;&amp; current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
+			index--;
 
-	igt_assert(!igt_check_bigjoiner_support(display));
+		if (index &lt; 0)
+			break;
 
-	/* This commit is expectd to fail as this pipe is being used for big joiner */
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		current_combination[index]++;
+		for (i = index + 1; i &lt; output_count; ++i)
+			current_combination[i] = current_combination[i - 1] + pipes_per_output;
+    }
+}
 
-	igt_display_reset(&amp;data-&gt;display);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
+{
+	igt_output_t *output;
 
-	igt_assert_lt(ret, 0);
+	for_each_connected_output(&amp;data-&gt;display, output) {
+		if (output-&gt;id == output_id)
+			return output;
+	}
+	igt_assert(&quot;Output not found\n&quot;);
+	return NULL;
 }
 
-static void test_basic_modeset(data_t *data)
+static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
 {
+	int i, j, ret;
+	igt_output_t *output;
+	uint64_t *outputs;
+	igt_plane_t *primary[INVALID_TEST_OUTPUT];
+	igt_fb_t fb[INVALID_TEST_OUTPUT];
 	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output = NULL;
-	igt_display_t *display = &amp;data-&gt;display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
 
-	igt_display_reset(display);
-
-	for_each_connected_output(display, output) {
-		if (data-&gt;output[0].output_id == output-&gt;id) {
-			bigjoiner_output = output;
-			break;
+	outputs = combined ? data-&gt;combined_outputs : data-&gt;big_joiner_outputs;
+
+	for (i = 0; i &lt; data-&gt;n_pipes-1; i++) {
+		igt_display_reset(&amp;data-&gt;display);
+		for (j = 0; j &lt; INVALID_TEST_OUTPUT; j++) {
+			output = get_output_by_id_or_assert(data, outputs[j]);
+			igt_assert(output);
+			igt_output_set_pipe(output, data-&gt;pipe_seq[i + j]);
+			mode = igt_output_get_mode(output);
+			igt_info(&quot;Assigning pipe %s to %s with mode %dx%d@%d%s&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[i + j]),
+				 igt_output_name(output), mode-&gt;hdisplay,
+				 mode-&gt;vdisplay, mode-&gt;vrefresh,
+				 j == INVALID_TEST_OUTPUT - 1 ? &quot;\n&quot; : &quot;, &quot;);
+			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &amp;fb[j]);
+			igt_plane_set_fb(primary[j], &amp;fb[j]);
 		}
+		ret = igt_display_try_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
+		igt_assert_f(ret != 0, &quot;Commit shouldn't have passed\n&quot;);
 	}
-
-	igt_output_set_pipe(bigjoiner_output, data-&gt;pipe1);
-
-	mode = &amp;data-&gt;output[0].mode;
-	igt_output_override_mode(bigjoiner_output, mode);
-
-	pipe = &amp;display-&gt;pipes[data-&gt;pipe1];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane, &amp;data-&gt;fb);
-	igt_fb_set_size(&amp;data-&gt;fb, plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	igt_plane_set_size(plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
-	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
-static void test_dual_display(data_t *data)
+static void tets_big_joiner_on_last_pipe(data_t *data)
 {
+	int i, ret;
+	uint64_t *outputs;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	igt_fb_t fb;
 	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output[2];
-	igt_display_t *display = &amp;data-&gt;display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane1, *plane2;
-	int count = 0;
-
-	igt_display_reset(display);
-
-	for_each_connected_output(display, output) {
-		if (data-&gt;output[count].output_id == output-&gt;id) {
-			bigjoiner_output[count] = output;
-			count++;
-		}
 
-		if (count &gt; 1)
-			break;
+	outputs = data-&gt;big_joiner_outputs;
+	for (i = 0; i &lt; data-&gt;big_joiner_output_count; i++) {
+		igt_display_reset(&amp;data-&gt;display);
+		output = get_output_by_id_or_assert(data, outputs[i]);
+		igt_output_set_pipe(output, data-&gt;pipe_seq[data-&gt;n_pipes - 1]);
+		mode = igt_output_get_mode(output);
+		igt_info(&quot;Assigning pipe %s to %s with mode %dx%d@%d\n&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[data-&gt;n_pipes - 1]),
+				 igt_output_name(output), mode-&gt;hdisplay,
+				 mode-&gt;vdisplay, mode-&gt;vrefresh);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_create_pattern_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+							  DRM_FORMAT_MOD_LINEAR, &amp;fb);
+		igt_plane_set_fb(primary, &amp;fb);
+		ret = igt_display_try_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
+		igt_assert_f(ret != 0, &quot;Commit shouldn't have passed\n&quot;);
 	}
+}
 
-	igt_output_set_pipe(bigjoiner_output[0], data-&gt;pipe1);
-	igt_output_set_pipe(bigjoiner_output[1], data-&gt;pipe2);
-
-	/* Set up first big joiner output on Pipe A*/
-	mode = &amp;data-&gt;output[0].mode;
-	igt_output_override_mode(bigjoiner_output[0], mode);
-
-	pipe = &amp;display-&gt;pipes[data-&gt;pipe1];
-	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane1, &amp;data-&gt;fb);
-	igt_fb_set_size(&amp;data-&gt;fb, plane1, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	igt_plane_set_size(plane1, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	/* Set up second big joiner output on Pipe C*/
-	mode = &amp;data-&gt;output[1].mode;
-	igt_output_override_mode(bigjoiner_output[1], mode);
-
-	pipe = &amp;display-&gt;pipes[data-&gt;pipe2];
-	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane2, &amp;data-&gt;fb);
-	igt_fb_set_size(&amp;data-&gt;fb, plane2, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	igt_plane_set_size(plane2, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static void test_basic_modeset(data_t *data, int num_outputs,
+			       Combination combinations[MAX_COMBINATIONS],
+			       uint64_t num_combinations)
+{
+	int i, j, ret;
+	igt_display_t *display = &amp;data-&gt;display;
+	igt_output_t *output[num_outputs];
+	igt_plane_t *primary[num_outputs];
+	igt_fb_t fb[num_outputs];
+	drmModeModeInfo *mode;
 
-	/* Clean up */
-	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
-	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
-	igt_plane_set_fb(plane1, NULL);
-	igt_plane_set_fb(plane2, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	for (i = 0; i &lt; num_combinations; i++) {
+		igt_display_reset(display);
+		for (j = 0; j &lt; num_outputs; j++) {
+			output[j] = get_output_by_id_or_assert(data,
+						     data-&gt;big_joiner_outputs[j]);
+			igt_info(&quot;Assigning pipe %s to %s%s&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[combinations[i].combination[j]]),
+				 output[j]-&gt;name, j == num_outputs - 1 ? &quot;\n&quot; : &quot;, &quot;);
+			igt_output_set_pipe(output[j], data-&gt;pipe_seq[combinations[i].combination[j]]);
+			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
+			mode = igt_output_get_mode(output[j]);
+			igt_create_pattern_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &amp;fb[j]);
+			igt_plane_set_fb(primary[j], &amp;fb[j]);
+		}
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_assert_f(ret == 0, &quot;Commit failed\n&quot;);
+    }
 }
 
 igt_main
 {
+	int i, j;
 	data_t data;
 	igt_output_t *output;
-	drmModeModeInfo mode;
-	int valid_output = 0, i, count = 0, j = 0;
-	uint16_t width = 0, height = 0;
-	enum pipe pipe_seq[IGT_MAX_PIPES];
+	drmModeModeInfo default_mode;
 
+	i = j = 0;
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
-
 		igt_display_require(&amp;data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
-
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
+		data.big_joiner_output_count = 0;
+		data.non_big_joiner_output_count = 0;
+		data.combined_output_count = 0;
+		data.output_count = 0;
 
 		for_each_connected_output(&amp;data.display, output) {
 			bool found = false;
 			drmModeConnector *connector = output-&gt;config.connector;
-
-			/*
-			 * Bigjoiner will come in to the picture when the
-			 * resolution &gt; 5K or clock &gt; max-dot-clock.
-			 */
 			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
-
 			if (found) {
-				data.output[count].output_id = output-&gt;id;
-				memcpy(&amp;data.output[count].mode, &amp;mode, sizeof(drmModeModeInfo));
-				count++;
-
-				width = max(width, mode.hdisplay);
-				height = max(height, mode.vdisplay);
+				data.big_joiner_outputs[data.big_joiner_output_count++] = output-&gt;id;
+				igt_output_override_mode(output, &amp;connector-&gt;modes[0]);
+			} else {
+				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output-&gt;id;
+				kmstest_get_connector_default_mode(data.drm_fd, connector, &amp;default_mode);
+				igt_output_override_mode(output, &amp;default_mode);
 			}
-			valid_output++;
+			data.output_count++;
+		}
+
+		if (data.big_joiner_output_count == 1 &amp;&amp; data.non_big_joiner_output_count &gt; 0) {
+			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
+			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
 		}
 
 		data.n_pipes = 0;
 		for_each_pipe(&amp;data.display, i) {
 			data.n_pipes++;
-			pipe_seq[j] = i;
+			data.pipe_seq[j] = i;
 			j++;
 		}
-
-		igt_require_f(count &gt; 0, &quot;No output with 5k+ mode (or) clock &gt; max-dot-clock found\n&quot;);
-
-		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR, &amp;data.fb);
 	}
 
 	igt_describe(&quot;Verify the basic modeset on big joiner mode on all pipes&quot;);
 	igt_subtest_with_dynamic(&quot;basic&quot;) {
-		for (i = 0; i &lt; data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			igt_dynamic_f(&quot;pipe-%s&quot;, kmstest_pipe_name(pipe_seq[i]))
-				test_basic_modeset(&amp;data);
+		igt_require_f(data.big_joiner_output_count &gt; 0, &quot;Big joiner output not found\n&quot;);
+		igt_require_f(data.n_pipes &gt; 1, &quot;Minimum of 2 pipes are required\n&quot;);
+
+		for (i = 0; i &lt; data.big_joiner_output_count; i++) {
+			uint64_t num_combinations = 0;
+			Combination combinations[MAX_COMBINATIONS];
+
+			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &amp;num_combinations);
+			igt_info(&quot;Number of combinations for %d outputs and %d pipes are %ld\n&quot;,
+					 i+1, data.n_pipes, num_combinations);
+
+			if (num_combinations &gt; 0)
+				igt_dynamic_f(&quot;%dx-big-joiner&quot;, i+1)
+					test_basic_modeset(&amp;data, i+1, combinations, num_combinations);
+			else
+				break;
 		}
 	}
 
-	igt_describe(&quot;Verify if the modeset on the adjoining pipe is rejected &quot;
-		     &quot;when the pipe is active with a big joiner modeset&quot;);
 	igt_subtest_with_dynamic(&quot;invalid-modeset&quot;) {
-		data.pipe1 = pipe_seq[j - 1];
-
-		igt_display_reset(&amp;data.display);
-		for_each_connected_output(&amp;data.display, output) {
-			if (data.output[0].output_id != output-&gt;id)
-				continue;
-
-			mode = data.output[0].mode;
-			igt_output_set_pipe(output, data.pipe1);
-			igt_output_override_mode(output, &amp;mode);
+		igt_require_f(data.big_joiner_output_count &gt; 0, &quot;Big joiner output not found\n&quot;);
+		igt_require_f(data.n_pipes &gt; 1, &quot;Minimum of 2 pipes are required\n&quot;);
 
-			igt_dynamic_f(&quot;pipe-%s-%s&quot;,
-				      kmstest_pipe_name(data.pipe1),
-				      igt_output_name(output))
-				test_invalid_modeset(&amp;data);
-		}
+		if (data.big_joiner_output_count &gt;= 1)
+			igt_dynamic_f(&quot;big_joiner_on_last_pipe&quot;)
+				tets_big_joiner_on_last_pipe(&amp;data);
 
-		if(valid_output &gt; 1) {
-			for (i = 0; i &lt; data.n_pipes - 1; i++) {
-				igt_output_t *first_output = NULL, *second_output = NULL;
-
-				data.pipe1 = pipe_seq[i];
-				data.pipe2 = pipe_seq[i + 1];
-
-				igt_display_reset(&amp;data.display);
-				for_each_connected_output(&amp;data.display, output) {
-					if (data.output[0].output_id == output-&gt;id) {
-						first_output = output;
-						mode = data.output[0].mode;
-
-						igt_output_set_pipe(output, data.pipe1);
-						igt_output_override_mode(output, &amp;mode);
-					} else if (second_output == NULL) {
-						second_output = output;
-						igt_output_set_pipe(output, data.pipe2);
-
-						break;
-					}
-				}
-
-				igt_dynamic_f(&quot;pipe-%s-%s-pipe-%s-%s&quot;,
-					      kmstest_pipe_name(data.pipe1),
-					      igt_output_name(first_output),
-					      kmstest_pipe_name(data.pipe2),
-					      igt_output_name(second_output))
-					test_invalid_modeset(&amp;data);
-			}
-		}
-	}
+		if (data.big_joiner_output_count &gt; 1)
+			igt_dynamic_f(&quot;invalid_combinations_with_two_bigjoiner&quot;)
+				test_invalid_modeset_two_joiner(&amp;data, false);
 
-	igt_describe(&quot;Verify simultaneous modeset on 2 big joiner outputs&quot;);
-	igt_subtest_with_dynamic(&quot;2x-modeset&quot;) {
-		igt_require_f(count &gt; 1, &quot;2 outputs with big joiner modes are required\n&quot;);
-		igt_require_f(data.n_pipes &gt; 3, &quot;Minumum of 4 pipes are required\n&quot;);
-		for (i = 0; (i + 2) &lt; data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			data.pipe2 = pipe_seq[i + 2];
-			igt_dynamic_f(&quot;pipe-%s-%s&quot;, kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
-				test_dual_display(&amp;data);
+		if (data.combined_output_count) {
+			igt_dynamic_f(&quot;invalid_combinations_with_bigjoiner_non_bigjoiner&quot;)
+				test_invalid_modeset_two_joiner(&amp;data, true);
 		}
 	}
 
 	igt_fixture {
-		igt_remove_fb(data.drm_fd, &amp;data.fb);
 		igt_display_fini(&amp;data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.25.1
</pre>
      </blockquote>
    </blockquote>
    Thanks and Regards<br>
    Kunal Joshi<span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------pGXLQWTIdZl0N4mvy3cMSrlD--
