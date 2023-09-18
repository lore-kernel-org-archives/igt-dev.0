Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 18 Sep 2023 10:09:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <s4pd63isa3zc5p6roa23gg74puas7m5irxlvolg54f67zcrua6@v7ah2t3b5sqp>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-3-lucas.demarchi@intel.com>
 <20230915174346.GC2706891@mdroper-desk1.amr.corp.intel.com>
 <20230915174712.GD2706891@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915174712.GD2706891@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 02/14] lib/gpu_cmds: Remove
 prefix from gen7_fill_binding_table()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 10:47:12AM -0700, Matt Roper wrote:
>On Fri, Sep 15, 2023 at 10:43:50AM -0700, Matt Roper wrote:
>> On Fri, Sep 15, 2023 at 06:23:34AM -0700, Lucas De Marchi wrote:
>> > This function is used by pretty much all versions. It's odd to have a
>> > gen7 function end up calling next-gen functions and it's error prone:
>> > when adding something to e.g. a gen8 function to realize that behavior
>> > breaks previous platforms.
>>
>> Even more confusing is that we have a gen11_filling_binding_table
>> function as well, but Xe_HP still uses the older "gen7" variant.  Maybe
>> we should incorporate the gen11-specific logic into the single
>> fill_binding_table function as well?  It looks like it only gets used in
>> one path (which winds up being ICL-specific, not even used for EHL/JSL
>> due to lack of media samplers).
>
>Hmm, I guess the signature of the gen11 function doesn't match since it
>takes separate src/dst buffers.

yep, I hit this issue when trying that abstraction. I think we can leave
it to be done on top.

Lucas De Marchi

>
>
>Matt
>
>>
>>
>> Matt
>>
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> >  lib/gpu_cmds.c | 9 ++++-----
>> >  1 file changed, 4 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
>> > index bb35204fb..648451f74 100644
>> > --- a/lib/gpu_cmds.c
>> > +++ b/lib/gpu_cmds.c
>> > @@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>> >  }
>> >
>> >  static uint32_t
>> > -gen7_fill_binding_table(struct intel_bb *ibb,
>> > -			struct intel_buf *buf)
>> > +fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>> >  {
>> >  	uint32_t binding_table_offset;
>> >  	uint32_t *binding_table;
>> > @@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
>> >  	uint32_t offset;
>> >  	uint32_t binding_table_offset, kernel_offset;
>> >
>> > -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
>> > +	binding_table_offset = fill_binding_table(ibb, buf);
>> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>> >
>> >  	intel_bb_ptr_align(ibb, 64);
>> > @@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
>> >  	uint32_t offset;
>> >  	uint32_t binding_table_offset, kernel_offset;
>> >
>> > -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
>> > +	binding_table_offset = fill_binding_table(ibb, buf);
>> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>> >
>> >  	intel_bb_ptr_align(ibb, 64);
>> > @@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>> >  {
>> >  	uint32_t binding_table_offset, kernel_offset;
>> >
>> > -	binding_table_offset = gen7_fill_binding_table(ibb, dst);
>> > +	binding_table_offset = fill_binding_table(ibb, dst);
>> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>> >
>> >  	memset(idd, 0, sizeof(*idd));
>> > --
>> > 2.40.1
>> >
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
