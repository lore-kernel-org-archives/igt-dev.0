Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA36E8A3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 23:57:38 +0000 (UTC)
Date: Thu, 26 Aug 2021 16:57:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20210826235736.GD18188@unerlige-ril-10.165.21.208>
References: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
 <20210803200737.30843-4-umesh.nerlige.ramappa@intel.com>
 <878s0r1uq5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <878s0r1uq5.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH 4/5] tools/i915-perf: Add mmapped OA buffer
 support to i915-perf-recorder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 06:45:22PM -0700, Dixit, Ashutosh wrote:
>On Tue, 03 Aug 2021 13:07:36 -0700, Umesh Nerlige Ramappa wrote:
>>
>> +	/*
>> +	 * We do not have permissions to update the OA HEAD register, so we
>> +	 * would end up with a buffer lost error once the OA buffer fills up. To
>
>s/buffer lost/data lost/ ?
>
>> +	 * avoid that, drain the OA buffer into a zero mem device. The drain
>> +	 * eventually updates the head register in i915.
>> +	 */
>> +	while (read(ctx->perf_fd, ctx->zero_mem, ctx->oa_buffer_size) > 0 || errno == EINTR);
>
>Also this looks strange that in this mmap mode userspace cannot update the
>head and it must re-read the data using read() which it has already
>previously read from the mmap'd buffer. Is this an acceptable interface and
>has it been reviewed? Maybe when the OA buffer is mmap'd i915 should not
>report the data lost error (and silently clear it) and leave it to
>userspace to manage this? And anyway I think the mmap and the read() modes
>are mutually exclusive so the data lost error will be seen only in the
>read() mode not in the mmap mode correct? So I don't understand why this
>drain operation needs to be done. Thanks.

Looks like I can do away with the drain and things still work the same 
way. I was trying to resolve the buffer overflow error, but didn't think 
that we can just ignore the error in the mmap case. Since this code 
already maintains a head pointer and reads the buffer periodically, we 
should be good.

Thanks,
Umesh
