Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4266E245
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 10:23:24 +0000 (UTC)
Date: Fri, 21 Feb 2020 12:23:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200221102321.GD25209@platvala-desk.ger.corp.intel.com>
References: <20200220133416.1194071-1-lionel.g.landwerlin@intel.com>
 <20200221100908.GA25209@platvala-desk.ger.corp.intel.com>
 <18a8e969-c475-2c17-c249-bc16b5f7fb00@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18a8e969-c475-2c17-c249-bc16b5f7fb00@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tools/i915-perf: workaround
 overzelous compiler warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 12:17:24PM +0200, Lionel Landwerlin wrote:
> On 21/02/2020 12:09, Petri Latvala wrote:
> > On Thu, Feb 20, 2020 at 03:34:16PM +0200, Lionel Landwerlin wrote:
> > > Take 2.
> > > 
> > > Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > ---
> > >   tools/i915-perf/i915_perf_recorder_commands.h | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/i915-perf/i915_perf_recorder_commands.h b/tools/i915-perf/i915_perf_recorder_commands.h
> > > index 4855d80f..44dd4438 100644
> > > --- a/tools/i915-perf/i915_perf_recorder_commands.h
> > > +++ b/tools/i915-perf/i915_perf_recorder_commands.h
> > > @@ -35,5 +35,6 @@ struct recorder_command_base {
> > >   };
> > >   struct recorder_command_dump {
> > > -	uint8_t path[0];
> > > +	uint8_t unused;
> > > +	uint8_t path[];
> > >   };
> > And now all your mallocs need + 1.
> 
> 
> You're right, I forgot the sizeof(struct recorder_command_dump).
> 
> 
> > 
> > Why do you insist on having two structs?
> 
> 
> I want the person reading this code to understand what the packets exchanged
> look like.

Fair enough.

> 
> 
> >   The recorder_command_dump
> > struct only acts as "here be an array" object and you don't do
> > anything to it as an object anywhere.
> > 
> > A drive-by note, i915_perf_recorder_commands.h lacks include guards.
> > 
> > 
> > 
> > diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
> > index a8d0d30f..be5996c0 100644
> > --- a/tools/i915-perf/i915_perf_control.c
> > +++ b/tools/i915-perf/i915_perf_control.c
> > @@ -93,12 +93,12 @@ main(int argc, char *argv[])
> >   				sizeof(struct recorder_command_base) + strlen(dump_file) + 1;
> >   			struct {
> >   				struct recorder_command_base base;
> > -				struct recorder_command_dump dump;
> > +				uint8_t dump[];
> >   			} *data = malloc(total_len);
> >   			data->base.command = RECORDER_COMMAND_DUMP;
> >   			data->base.size = total_len;
> > -			snprintf((char *) data->dump.path, strlen(dump_file) + 1, "%s", dump_file);
> > +			snprintf((char *) data->dump, strlen(dump_file) + 1, "%s", dump_file);
> >   			fwrite(data, total_len, 1, command_fifo_file);
> >   		} else {
> > @@ -107,12 +107,12 @@ main(int argc, char *argv[])
> >   			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
> >   			struct {
> >   				struct recorder_command_base base;
> > -				struct recorder_command_dump dump;
> > +				uint8_t dump[];
> >   			} *data = malloc(total_len);
> >   			data->base.command = RECORDER_COMMAND_DUMP;
> >   			data->base.size = total_len;
> > -			snprintf((char *) data->dump.path, path_len, "%s/%s", cwd, dump_file);
> > +			snprintf((char *) data->dump, path_len, "%s/%s", cwd, dump_file);
> >   			fwrite(data, total_len, 1, command_fifo_file);
> >   		}
> > diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> > index 760cabf1..6bbc451e 100644
> > --- a/tools/i915-perf/i915_perf_recorder.c
> > +++ b/tools/i915-perf/i915_perf_recorder.c
> > @@ -605,7 +605,7 @@ read_command_file(struct recording_context *ctx)
> >   	switch (header.command) {
> >   	case RECORDER_COMMAND_DUMP: {
> >   		uint32_t len = header.size - sizeof(header), offset = 0;
> > -		struct recorder_command_dump *dump = malloc(len);
> > +		uint8_t *dump = malloc(len);
> >   		FILE *file;
> >   		while (offset < len &&
> > @@ -616,9 +616,9 @@ read_command_file(struct recording_context *ctx)
> >   				offset += ret;
> >   		}
> > -		fprintf(stdout, "Writing circular buffer to %s\n", dump->path);
> > +		fprintf(stdout, "Writing circular buffer to %s\n", dump);
> > -		file = fopen((const char *) dump->path, "w+");
> > +		file = fopen((const char *) dump, "w+");
> >   		if (file) {
> >   			struct chunk chunks[2];
> > @@ -634,11 +634,11 @@ read_command_file(struct recording_context *ctx)
> >   			     fwrite(chunks[1].data, chunks[1].len, 1, file) != 1) ||
> >   			    !write_correlation_timestamps(file, ctx->drm_fd)) {
> >   				fprintf(stderr, "Unable to write circular buffer data in file '%s'\n",
> > -					dump->path);
> > +					dump);
> >   			}
> >   			fclose(file);
> >   		} else
> > -			fprintf(stderr, "Unable to write dump file '%s'\n", dump->path);
> > +			fprintf(stderr, "Unable to write dump file '%s'\n", dump);
> >   		free(dump);
> >   		break;
> > diff --git a/tools/i915-perf/i915_perf_recorder_commands.h b/tools/i915-perf/i915_perf_recorder_commands.h
> > index 4855d80f..3db11327 100644
> > --- a/tools/i915-perf/i915_perf_recorder_commands.h
> > +++ b/tools/i915-perf/i915_perf_recorder_commands.h
> > @@ -33,7 +33,3 @@ struct recorder_command_base {
> >   	uint32_t command;
> >   	uint32_t size;
> >   };
> > -
> > -struct recorder_command_dump {
> > -	uint8_t path[0];
> > -};
> > 
> Can you leave this structure in there but commented?
> 
> Just so that there is a trace of what you is exchanged between the 2
> processes.

Sure, and the size field can have a comment explaining that it's the
size of the header + dump.

I'm reading that as an implied consent to wrapping the patch in a
commit with your A-b, is that correct?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
