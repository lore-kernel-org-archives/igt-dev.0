Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E6210E798
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 16:36:20 +0000 (UTC)
Message-ID: <cd098a3b-adeb-8a77-17e9-8bc82543c750@intel.com>
Date: Wed, 18 Jan 2023 22:06:13 +0530
MIME-Version: 1.0
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
 <20230112073537.27890-4-swati2.sharma@intel.com>
 <e905e151fc0bb6c67f034752a7c428040c66ff47.camel@intel.com>
Content-Language: en-US
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <e905e151fc0bb6c67f034752a7c428040c66ff47.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/8] lib/dsc: Add helpers for VDSC
 YCbCr420 debugfs entry
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



On 13-Jan-23 1:47 PM, Hogander, Jouni wrote:
>> + * Returns: 1 on success or negative error code, in case of failure.
> 0 is usually success, < 0 is error. This is also in coding style
> document. I see igt_force_dsc_enable is also using 1. Maybe you should
> fix that as well in a separate patch.
>   
This ret value is returned from igt_sysfs_write() which returns the 
number of bytes written, or -errno on error.

I guess we can't change this.

-- 
~Swati Sharma
