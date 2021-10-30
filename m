Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <98fe41ea-75fc-463c-23fd-25156a975b53@intel.com>
Date: Fri, 29 Oct 2021 17:32:40 -0700
Content-Language: en-GB
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-3-John.C.Harrison@Intel.com>
 <20211029173905.GA35332@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211029173905.GA35332@jons-linux-dev-box>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tests/i915/gem_exec_capture: Cope
 with larger page sizes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/29/2021 10:39, Matthew Brost wrote:
> On Thu, Oct 21, 2021 at 04:40:38PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> At some point, larger than 4KB page sizes were added to the i915
>> driver. This included adding an informational line to the buffer
>> entries in error capture logs. However, the error capture test was not
>> updated to skip this string, thus it would silently abort processing.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/i915/gem_exec_capture.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
>> index 53649cdb2..47ca64dd6 100644
>> --- a/tests/i915/gem_exec_capture.c
>> +++ b/tests/i915/gem_exec_capture.c
>> @@ -484,6 +484,12 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>>   		addr |= strtoul(str + 1, &str, 16);
>>   		igt_assert(*str++ == '\n');
>>   
>> +		/* gtt_page_sizes = 0x00010000 */
>> +		if (strncmp(str, "gtt_page_sizes = 0x", 19) == 0) {
>> +			str += 19 + 8;
>> +			igt_assert(*str++ == '\n');
>> +		}
> Can you explain this logic to me, for the life of me I can't figure out
> what this doing. That probably warrent's a more detailed comment too.
It's no different to the rest of the processing that this code was 
already doing.

if( start_of_current_line == "gtt_page_sizes = 0x") {
     current_line += strlen(above_string) + strlen(8-digit hex string);
     assert( next_character_of_current_line == end_of_line);
}

I.e. skip over any line that just contains the page size message.

John.

>
> Matt
>
>> +
>>   		if (!(*str == ':' || *str == '~'))
>>   			continue;
>>   
>> -- 
>> 2.25.1
>>
