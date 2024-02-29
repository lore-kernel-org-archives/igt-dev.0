Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472FFC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 17:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD37810E410;
	Thu, 29 Feb 2024 17:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnMLfVuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178110E410
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709228036; x=1740764036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GhIKOSwtApvdq1ovhMKuf9FZ1ZvNYRgb3GxjYkl2FMI=;
 b=EnMLfVuHcto7zMB5G2ROAKY7JIyebPILC6Prz1kCXvd5Zaou0o+KlJmO
 xn+vuGORGk1k9eBAOrd37YB43pmbFJ18glpTcK5DoyxeDYrUV1CFA+IvU
 ihQ9E8p4X65k5cvR64VLu9aU3thvykLSNQdAzp1NZcXnT8fKC0z7PrgX/
 71Wf/vBUVkNln1TEO5lQQtI6G+nCzwkagFW0wSfXUcD6RYEE5BGJJCHN3
 CYuk1OVMNJTVjoMw2yC/Dkj1CjZiW9R4g5STDtciGhPvZeZWSVjVyiXh0
 ZOIi4/0JIPYnSv+FlgUij0PRBgDsgMEqgS3TYoe6T666wczmG2oUdnu0g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6674005"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6674005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8466490"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 09:33:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 09:33:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 09:33:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 09:33:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 09:33:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9TF5e5f6uIhadO3QRCAKEfjcvUQhlL1cqxoeJvuZOcgLT4Z4QAQFiXG3HJ53xoOErChhpjXnU+C77kr6u51HhBiOJy3MROXNoBFv0Hi4RpPPcy/j9AH2B2ih+EsAuQiWWPqrZaopFuJc+wKq3XLE9ZWn3idxmqp4wOGpFgTKX2tUDsRj8+qpWZ8bttr953IK28lAwi3wre+uJo45+XQpqCltS+7lknYMgitLN6+WybmdhhHBMGWjKwrzocLSiD6/ONKedBWpXaDPMj6TuP4OcdHjss5KR5/WISoK+Xl2UiF7vvqVVDGmjvcmPWFcC29ijx6PgNO/SWf5u1X73geVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b50hY3caJqDxFzFPn/GLtp/yUaOf+uriaspYcFuigkw=;
 b=Ob/iu6huz0Mj/U5+nTXFQgCsjBQgLEizrxlk17tSE3aD3oyl40ew2kRRNZPug5PW3OfNB4qpsfgMY0x2+J2e/4/pV0gcC5Dd0qe/BXHiLo0I6P2L4P1T8GsrXmUXcKSaASgBrxsLF5MjKa31i551LBrmEkZzm5lktSmhNut9ef5l+IpLUgHrJZ6gmZA49OGyMYSxVBOiphDN7ghAfAHu5tNI2pROJzTd41lgBzIPnQM8AxegdaUdDCqrTexFpARoY5HZzA0YunzkXbqFvfsCyoD0BTSo20vqUsoRrrzNZBUv92cQWhZ+G/tX2sw9IgZqay8TTPznFOCiehcbUuJ0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 29 Feb
 2024 17:33:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 17:33:48 +0000
Date: Thu, 29 Feb 2024 11:33:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_sysfs: stop leaking fd on write
 failures
Message-ID: <rwu332noevjxmaapc5if63biksu7ftr6bvhcwwt64kof47uz4n@yvmyy34i3un7>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <20240228223134.3908035-2-lucas.demarchi@intel.com>
 <2538584.Sgy9Pd6rRy@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2538584.Sgy9Pd6rRy@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1188ae-40cc-4d5d-b6c3-08dc394c9649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0x8MPoM/sHoabVJtzcc4pRkfiwuQurUwtgr/wGo/izQMo2oRyMUeHcSqcgLcO5BZpxcptpTBBjVJpW9pExZ5zPXP5fdPjqWW1SnYSehzveqqcURMDxOIeaAw2QOSi0Y7uvo1UQjOjzSTf0LuPZun7YZheNpTmevOQiDhhJY9tO+Y51mwrAiFUk8TcRj1TSGo1pKeVFIKejTn2WKHhGxB1lsVI1YpjEAyJoANqoC3OwwtvGuxTCA3x2nbVYSWL4NeKgrjK8FfKG+oE5IyE7qSkaA9ZWCX8cGt2k2YYOmd8Q1z+LFDSID8r6VrjHAfqIDuIpzTngSyTd3xB4aAMWvM7jQCVYGhJ8AyW+1Hi0Rd2Qfhl99s3VpGNlaPqmVGPimPldq/1urUmeRYVcDR04yX4iVly2E8Xh88C+V23VGrBUr3hcPl3XOVlemTA/L4SHNoOZQgROsJtLR3Gam2jknV11SS3E6FHZEDdoDnaGFi4M3UXU3uC5SPqmgp5msLTveyuOtQktZPQcLs3UZYkO5FB48F8G0aqdH6NbTUOq/cKZ/6z+Mdk8+LS/TD+eWtN6ldRFjSsN4hQDgDcz3IEnj3djhAPl4LE1XEUwdC7HK6od38dAtok3dGoMEcdUU/WYv0MCpQTniOP+J55KTPkkkYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NpgC2PmJnG+j2ZKtYxAAmv4q0C/IyPfOE0G6YXoMmkyTP7i2qaXsM9pApgEo?=
 =?us-ascii?Q?c2Pb2t9ZeBd33DTUB7/KJDcOcSvmhvdLytB997DOP2OIkOgneyfqYtZ6JVHN?=
 =?us-ascii?Q?y33WwXkuR1q8nnuwcV8xMNPBopLMTSYl7l7wmXzY4jX+Z7HPp+Rrm9/lRPxs?=
 =?us-ascii?Q?kVwpYZMIkvna+pDNOcrsSoiEKY/SVxpcZXshJNTG6FH3IASV7d2fHu2QqtNe?=
 =?us-ascii?Q?5qUu5Dp+u8GIMJv7Q/tvfyYacx2pnP2tK5h9oFFXy2fpADTRkCNBXXXXri6Z?=
 =?us-ascii?Q?euA7ABoRtY4pp2Zpxs4MIx1AS5U+lj59gqole2iI73+etLbwU84IySnZrBFp?=
 =?us-ascii?Q?AYDdOQ7Q1YsEw0LL8/YfN/XZVBYq34lXdZUSuoNrJ7PP7fro8pW3XOL0kDEI?=
 =?us-ascii?Q?SXMh37P0I+bGONX1DreuPidkKZ59lAgOz13N+slerRASgxqnFKnU/LqgzkbW?=
 =?us-ascii?Q?0xex627TZEp01J3jwjLGVRMDFs3dURZi/8Z9qAMEeSvZG+dAknLDTqr9zczN?=
 =?us-ascii?Q?4YQENTzYe9LJrd6fKA6ZpeNAMkIQu1AM97t8/3xRMBZQsvfdrrPnWy9ActPf?=
 =?us-ascii?Q?XPlxQn6RxoE3bOPHnTPEhJTyBuxwWsVp+moA0mqTyN5j4YnbwWUZJmOuPsP9?=
 =?us-ascii?Q?62otvIynU0QKy46ycCDee1AAMNcJcFwwEZL2ukZHU+ZGnSGKOpy8Mdl3wvPt?=
 =?us-ascii?Q?50+V/Ol7YVprOLoMoA7z1gZsE6NMGahgrZkFPBxMQh7xUy4LcrRdePrHWzjn?=
 =?us-ascii?Q?lAb1F7N8TikcyCYKZk+DaH2i3jGdhb5/EMqf7ATnXUpK/DGmy6jwn4TGpyW+?=
 =?us-ascii?Q?4YhAk8gSdmhjolwCdZCs+F4RzvuEoEyOP9fJG+X8/aBT/RUkWTh+5+OPZXLK?=
 =?us-ascii?Q?c+F/rhya9BC6BKPCiRiBvLPVQCEW1FL5zbgp7O7jfgM9ygU7EFWmQ/6+cdtM?=
 =?us-ascii?Q?ctf88N4kq/0VYfQogMywJbGUAjvWeurOc96xJAJXrVEqyLoLsIiSnp5P3yQV?=
 =?us-ascii?Q?XRVSJchhhV2PNH292i4g+WtRNJxbE3AW7Zr9KpKPkmjKc21kekORvSL8ylUV?=
 =?us-ascii?Q?cQ4afqYkzAcClcov0pWYaD7S1BoMe0boCiOd3WKpp0aZ/yFnLyAVi9uoYe2j?=
 =?us-ascii?Q?HKKAAUeeOcvDN7uTnEiDAtw22gQrYs/lDGIH6J8kmB1xZdcQ5fdB21lvYYWI?=
 =?us-ascii?Q?84WnazkUU3l1iEwh/kYIMsRrT0HbG1kKIDtWRj0M3wlInWTDAkkWa8++PKKH?=
 =?us-ascii?Q?foWO2FY2oJLaVJwzZRzxdrwqNifoc0Z4YedmKMgjfJIWz+Y+cK5jFNoLeVV2?=
 =?us-ascii?Q?3/FxGmriewJFcCfuNlehSNuIlbhf5L9ro/hlICHW2vzHNpj6c9pQYU76NPws?=
 =?us-ascii?Q?qdKtOfS640GLcQmS0Fdg2lu0LQ6a/QTCm+/O0qT7ELcNeobHjfJfE19kmcmk?=
 =?us-ascii?Q?Zf8GHeJYB0xg9uQHYZVjEiUEp+Ci+iarvxp6ly+6l3O8NKnhYBOS0lcucwTq?=
 =?us-ascii?Q?yZcjhKBNnKSZrpRqKndLeOZBfJ54KgzSBz+JyaCqsUjLNyaVHqD91rGq+4uz?=
 =?us-ascii?Q?Mxxb9IU16atWOZhsiynOoVhUEvbrliVrA+O/qu3Lgaqlpa0BlhnJhUiZKL1d?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1188ae-40cc-4d5d-b6c3-08dc394c9649
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 17:33:48.2897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h8fzMfIp/tAVBtv31J5RtUAmpjES+wbzWnXICLKIyZX4RwWY4qvy+Jy68jP3ZtbajfVdg9JVvsaedneIxm9xYoR9/tzKoTf7YeBuQRGQIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

On Thu, Feb 29, 2024 at 12:06:24PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Wednesday, 28 February 2024 23:31:32 CET Lucas De Marchi wrote:
>> Make sure to close the fd before returning.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_sysfs.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 2b0225138..2997925e5 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -515,29 +515,36 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  	va_copy(tmp, ap);
>>  	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>>  	va_end(tmp);
>> -	if (igt_debug_on(ret < 0))
>> -		return -EINVAL;
>> +	if (igt_debug_on(ret < 0)) {
>> +		ret = -EINVAL;
>> +		goto end;
>> +	}
>>
>>  	if (ret > sizeof(stack)) {
>>  		unsigned int len = ret + 1;
>>
>>  		buf = malloc(len);
>> -		if (igt_debug_on(!buf))
>> -			return -ENOMEM;
>> +		if (igt_debug_on(!buf)) {
>> +			ret = -ENOMEM;
>> +			goto end;
>> +		}
>>
>>  		ret = vsnprintf(buf, ret, fmt, ap);
>>  		if (igt_debug_on(ret > len)) {
>> -			free(buf);
>> -			return -EINVAL;
>> +			ret = -EINVAL;
>> +			goto free_buf;
>>  		}
>>  	}
>>
>>  	ret = igt_writen(fd, buf, ret);
>>
>> -	close(fd);
>
>How about moving the code that opens the fd from the top of the body of this
>function to just in front of the call to igt_writen(), and keeping this
>close() here?  That way we wouldn't need the end: section of the error unwind
>path, nor those two jumps to it.

The caveat would be trying to print the string before knowing if the
file can really be written to. I think unwind with goto is pretty common
idiom in kernel and igt, so I think it's acceptable too. If I move the
open(), then I may have to free(buf) in 3 possible cases (fail on
vsnprintf, fail on open, normal case).

The other option (that I prefer, but is not common in igt) would be to use
__attribute__((cleanup(closep))) which would automatically close the
file on any function return. For dealing with heap-allocated + stack in
kmod I use a scratchbuf struct to keep track of when it's needed to free
the buf.  But I'm not sure its worth bringing those to igt for this one
user. Nor moving the open() is looking good if you also consider
free'ing buf. So, let's keep it as is in this patch?

Lucas De Marchi

>
>Thanks,
>Janusz
>
>
>> +free_buf:
>>  	if (buf != stack)
>>  		free(buf);
>>
>> +end:
>> +	close(fd);
>> +
>>  	return ret;
>>  }
>>
>>
>
>
>
>
