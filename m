Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521AD10E395
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 06:22:03 +0000 (UTC)
Message-ID: <9678fdc6-7305-f58e-d522-7c83ececce27@intel.com>
Date: Thu, 4 May 2023 11:51:57 +0530
MIME-Version: 1.0
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230503114014.132968-1-swati2.sharma@intel.com>
 <20230503114014.132968-3-swati2.sharma@intel.com>
 <bbeb7c62-772f-babf-5517-acfbe9928488@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <bbeb7c62-772f-babf-5517-acfbe9928488@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_dsc: Enable
 validation for VDSC output formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Bhanu! Will make this change.

On 04-May-23 11:10 AM, Modem, Bhanuprakash wrote:
> It is already well takencare, but still while(1) (an infinite loop) 
> looks bit dangerous to me.
> 
> How about using "while (index < connector->count_modes)"?
> 
> Still this patch LGTM
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
