Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 4 Oct 2023 09:26:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <7oqovb356dx2hm5muop3xjqr4kv7m5fzjisch3vmsmxm33ygtv@eib4jielia35>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
 <20231004031023.3444455-9-lucas.demarchi@intel.com>
 <20231004043130.GA53570@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231004043130.GA53570@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t v2 08/13] lib/intel_mocs: Add
 Xe2 mocs indexes
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

On Tue, Oct 03, 2023 at 09:31:30PM -0700, Matt Roper wrote:
>On Tue, Oct 03, 2023 at 08:10:18PM -0700, Lucas De Marchi wrote:
>> Add WB and UC mocs indexes for Xe2 architecture and later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/intel_mocs.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
>> index 6a4ec25e4..d9de16932 100644
>> --- a/lib/intel_mocs.c
>> +++ b/lib/intel_mocs.c
>> @@ -14,6 +14,8 @@
>>  #define MTL_MOCS_WB_IDX				10
>>  #define GEN12_MOCS_UC_IDX			3
>>  #define GEN12_MOCS_WB_IDX			2
>> +#define XE2_MOCS_UC_IDX				3
>> +#define XE2_MOCS_WB_IDX				1
>
>Wouldn't we want index 4 here (WB in both L3 and L4) rather than just
>L3?

I think we were always using the same index as used on the kernel side.

If we are going to use index 4 here, then we also need to update the
kernel side to actually program it. Right now we are doing:

	static const struct xe_mocs_entry xe2_mocs_table[] = {
		/* Defer to PAT */
		MOCS_ENTRY(0, XE2_L3_0_WB | L4_0_WB, 0),
		/* Cached L3 + L4 */
		MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
		/* Uncached L3, Cached L4 */
		MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
		/* Uncached L3 + L4 */
		MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
	};


Lucas De Marchi
