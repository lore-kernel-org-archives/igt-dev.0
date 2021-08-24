Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B2D6E0B8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Aug 2021 18:50:37 +0000 (UTC)
Date: Tue, 24 Aug 2021 11:50:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20210824185032.GA18188@unerlige-ril-10.165.21.208>
References: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
 <20210803200737.30843-4-umesh.nerlige.ramappa@intel.com>
 <877dgb1oxd.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <877dgb1oxd.wl-ashutosh.dixit@intel.com>
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

On Mon, Aug 23, 2021 at 08:50:38PM -0700, Dixit, Ashutosh wrote:
>On Tue, 03 Aug 2021 13:07:36 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Currently report from OA buffer are read from the perf_fd. The kernel
>> patches enable mmaping the OA buffer into user space to allow for faster
>> report queries across different platforms and engines.
>>
>> Enable OA buffer to be mmaped by the recorder tool based on command line
>> option -M.
>>
>> Example:
>> i915-perf-recorder -m RenderBasic -s 8000 -k "mono" -M
>>
>> The recorder processes the mmaped OA buffer by periodically reading the
>> OA TAIL PTR register from a batch and determining the number of reports
>> available. These reports are then logged in the circular-buffer as
>> INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE records. In this implementation
>> the periodicity of checking the TAIL is the same as writing correlation
>> timestamps (1 sec).
>
>I haven't looked at everything so correct me if I am wrong but I have this
>other concern about INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE. What is the
>reason for introducing this? I would have thought that whether OA data has
>been collected using read's or mmap is a property only of the recorder and
>should not be exposed to the reader or gpuvis. So in the mmap case the
>recorder should basically do what the kernel does but not introduce a new
>perf record type. But now we are seeing changes both in the reader and
>gpuvis because we have introduced INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE?
>Thanks.

Data coming from the mmaped buffer is different from that coming from 
the read. When we issue a read, the kernel attaches a record header to 
each report. The data from the mmapped buffer is just raw reports 
without this header. Lionel had mentioned that we add a new record here 
with multiple reports in a record rather than add a header to each 
report at this stage (which I think might make us a little slow in 
reading the OA buffer).

Also note that this does not replace the old mechanism of capturing 
reports using read. Instead it's another way to capture reports.

Regards,
Umesh
