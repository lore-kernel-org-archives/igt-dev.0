Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAD1F8D762
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 18:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6C810E213;
	Thu, 16 Apr 2026 18:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkTBdY1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E426810E213
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776365079; x=1807901079;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y6o+VJtYqx8zo+OEuziRiZwBp3hOplMlpybXVmEBBxI=;
 b=JkTBdY1qdhZVkVxTyGHlvYReUFjHdNyrbIqw2qboQ/K+OmmvuCn9QM51
 wt1V3EzoAgPUwbhZNu2OZ0NuvgIbEdeCClcPpLp1XCNx/kWDxyhuYNPtc
 1N1zswsHdw8wlaGPbpUe4bjEJnsjE5jKddadM318/dXGeQ/ppzCCGjaJH
 ajA/KnKITDO5PHYs3hvGftv4iIC6ww3drL6SE2KWVeW1Bse+Uf5YWtKxA
 tKYJul5YUl6m+WLyxHRL07BJYokENvak92i1W3cd62mNPmOxf8wQqYR9J
 HGpSUfNGmicEuHO56dQaFWOX5GF7GdFWC1yLQbLz5mLQ5T477eozokKJg Q==;
X-CSE-ConnectionGUID: +YBawZ24ScmiezdzdIJhGA==
X-CSE-MsgGUID: dmrbHwmSRRym+U3x/3VWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="102838174"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="102838174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 11:44:38 -0700
X-CSE-ConnectionGUID: +gq9qL1sRtKB8f4goWNMfg==
X-CSE-MsgGUID: NGD5mybDQXCUzz3D3wUmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230690167"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 11:44:36 -0700
Date: Thu, 16 Apr 2026 20:44:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script
 and allowlist
Message-ID: <whs6rir6koqiw3ul22hvvla5qhd4lb5h7z4xhb2xlqbzsd2evu@uwsh6oyshba5>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
 <87h5pdwad7.fsf@intel.com>
 <4aj2f6zypdgeh464ioioadbbb7gv5wmmpxn4o33pim7zwb5wop@5io7kd4hcw4n>
 <87eckgz8s8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eckgz8s8.fsf@intel.com>
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

On Wed, Apr 15, 2026 at 09:51:19AM -0300, Gustavo Sousa wrote:
> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> 
> > On Tue, Apr 14, 2026 at 05:33:08PM -0300, Gustavo Sousa wrote:
> >> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> >> 
> >> > We need to explicitly extract guc logs for failed tests so add hook
> >> > script which does it after subtest/dynsubtest execution. As copying to
> >> > attachments takes a lot of time do it only for failing subtests.
> >> >
> >> > Adding this hook script to CI will extend execution time much and
> >> > using allowlist is necessary. Instead of allowlist argument in the
> >> > runner (previous attempt) now script filters such list on its own and
> >> > decides when to move forward and do some post-test actions. Such
> >> > approach is more flexible but moves decision to script what causes
> >> > it is more prone buggy.
> >> >
> >> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> >> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> >> > ---
> >> > v2: install hook to datadir/hooks
> >> > v3: migrate allowlist from runner to script
> >> > ---
> >> >  scripts/hooks/guc_copy.allowlist  |  2 ++
> >> >  scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++++++++++++++++
> >> >  scripts/meson.build               |  3 ++
> >> >  3 files changed, 52 insertions(+)
> >> >  create mode 100644 scripts/hooks/guc_copy.allowlist
> >> >  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
> >> >
> >> > diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_copy.allowlist
> >> > new file mode 100644
> >> > index 0000000000..04cb3f8298
> >> > --- /dev/null
> >> > +++ b/scripts/hooks/guc_copy.allowlist
> >> 
> >> Do we want really want the allowlist to be part distributed with IGT? I
> >> think we should default it to no allowlist and then CI (or whoever is
> >> using the hook) defines it if that's desired.
> >
> > I think we want this allowlist in igt. If there's a test which requires
> > to copy guc logs due to failure developer who will analyze this can
> > change allowlist without requesting that from CI folks. We already have
> > blocklist management in igt source and moving this allowlist management
> > to CI would split this resposibility. I would keep such management in
> > one place - is igt source code good place for this - I'm not sure, but
> > at the moment it's there.
> 
> Understood.  Yeah, I guess it is fine to keep CI-managed allowlist in
> IGT as well, then.
> 
> Since we have CI blocklists in the tests/intel-ci folder, maybe that's
> where this hook's allowlist should live as well?  Maybe in the future we
> could move intel-ci to belong to the root of the project, since it would
> contain more than testlists.
> 
> Now, I don't think executables generated by IGT apply the blocklists
> automatically, but CI passes the blocklists as argument as part of their
> workflow, right?
> 
> If that's the case, I think it would make sense for the hook to do the
> same.  In other words, my suggestion is that we can have a CI-managed
> allowlist file, but not use it by default -- CI would pass it when using
> the hook.

I already tried this in v1. But Kamil noticed this would apply same
allowlist to all hooks what likely is not we want. For example if we
would have two hook scripts like a.sh and b.sh and a.sh would like
to execute only for igt@test1@basic, and b.sh to execute on
igt@test2@enhanced we would have problem how to distinguish which
line is for which test. It would need to extend allowlist to sth
like:

a.sh:
igt@test1@basic

b.sh:
igt@test2@enhanced

and do more complicated filtering in script than simple grep -q -f.

At the moment I don't see really good solution, each of them have
pros and cons. Current copy_guc_log_on_fail.sh script tries to look
for allowlist first in IGT_HOOK_ALLOWLIST_DIR. CI may not set this
variable, so script will exit due to lack of allowlist (I've migrated
copy_guc_log.allowlist to tests/intel-ci, so it doesn't exist in script
directory anymore and it just quit. So when CI will decide to enable
hooks integration they just need to configure IGT_HOOK_ALLOWLIST_DIR
- they know when tests/intel-ci exists so they can set this env.

Kamil noticed as well instead of using multiple hook scripts we could
use single hook-wrapper.sh, which in turn would contain all hooks
we want to execute. Like:

hook-wrapper.sh:
#!/bin/bash

scripts/hooks/copy_guc_log_on_fail.sh
scripts/hooks/do_another_hook.sh
scripts/hooks/and_another_one.sh
...

Then CI folks would have less work if we would like to enable
another hook. Just single:
--hook 'post-subtest:scripts/hooks/hook-wrapper.sh' \
--hook 'post-dyn-subtest:scripts/hooks/hook-wrapper.sh'

I like his suggestion, we may do more without burdening CI folks
- they just integrate hooks once. Of course we need to be careful
with scripting to not break anything but this applies to enabling
hooks with or without hook-wrapper.sh

What's your opinion about this?

--
Zbigniew

> 
> >
> >> 
> >> > @@ -0,0 +1,2 @@
> >> > +igt@xe_compute@compute-square
> >> > +igt@xe_exec_basic@once-basic@ccs0
> >> > diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_copy_on_fail.sh
> >> > new file mode 100755
> >> > index 0000000000..595cf5205e
> >> > --- /dev/null
> >> > +++ b/scripts/hooks/guc_copy_on_fail.sh
> >> 
> >> Maybe guc_log_on_fail.sh? I think it is more descriptive than
> >> guc_copy_*, since the latter is a bit vague about what is being copied.
> >
> > I think copy_guc_log_on_fail.sh would describe its intent better.
> 
> Ack.
> 
> >
> >> 
> >> > @@ -0,0 +1,47 @@
> >> > +#!/bin/bash
> >> > +
> >> > +# Hook script for copying guc.log.
> >> > +# Suggested usage with:
> >> > +# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook 'post-dyn-subtest:scripts/hooks/guc_copy_on_fail.sh'
> >> > +
> >> > +# Copy only for failed subtests as this is time-consuming
> >> > +if [ "${IGT_HOOK_RESULT}" != "FAIL" ]; then
> >> > +	exit 0
> >> > +fi
> >> > +
> >> > +# Process and copy guc logs only for those specified in allowlist
> >> > +ALLOWLIST="guc_copy.allowlist"
> >> > +scriptdir=$(dirname $(realpath $0))
> >> 
> >> It is safer to use "$0" above.
> >
> > Fix me if I'm wrong but $0 won't contain absolute path if script
> > was executed using relative path like "./scripts/xyz.sh"
> 
> I mean to use "$0" (rather than $0) as argument of realpath.  Actually,
> I think the safest would be:
> 
>   scriptdir=$(dirname "$(realpath "$0")")
> 
> >
> >> 
> >> > +
> >> > +if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
> >> > +	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
> >> > +	exit 0
> >> > +fi
> >> 
> >> Well, we could allow the hook user to define the output and default it
> >> to "$IGT_RUNNER_ATTACHMENTS_DIR/guc_log" if not passed and
> >> $IGT_RUNNER_ATTACHMENTS_DIR is defined.  Otherwise, we should error out
> >> IMO (i.e. exit 1).
> >
> > Ok, in case of missing above enviroment exit with -1 makes sense.
> >
> >> 
> >> As an example, someone could be calling a single test binary directly
> >> and want to use this hook.
> >
> > If standalone test wants to execute hook script which was designed to
> > use within runner it should be executed with proper envs set apriori
> > its execution.
> >
> > I would like to minimize number of envs passed to scripts from the
> > runner - IGT_RUNNER_ATTACHMENTS_DIR should be single mandatory
> > which would point out the script where to write. And single optional
> > mentioned below - IGT_HOOK_ALLOWLIST_DIR in which script could look
> > for allowlist. I didn't set it in the runner because I don't know
> > the allowlist path (this will be know after installing and as DESTDIR=
> > might be used we can't say from the runner perspective where it will
> > be). Assuming script and allowlist will land in same directory (as
> > currently is set in meson) finding it (dirname/realpath) is possible
> > within the script regardless it was installed.
> >
> >> 
> >> We could do some simple argument parsing here or, to make it simpler,
> >> establish that IGT_HOOKS_GUC_LOG_DEST would be such an input variable
> >> (and document it in the doc comment at the start of the script).
> >
> > Multiplying environment is imo bad idea.
> >
> 
> I think the hook should be a standalone tool that could be used for
> either single tests or in the igt_runner environment.  I think we
> should make it easier for both cases, meaning to have a simple way of
> the hook user to define the necesary parameters (destination dir and
> allowlist file) and make it define sensible defaults when it detects
> it is running in a igt_runner environment.
> 
> If you prefer that the hook should be specific for the igt_runner
> environment, then I guess it is fine to avoid the extra work I'm
> suggesting.  We could revisit this in the future if we find users trying
> to use it with standalone tests.
> 
> >> 
> >> > +
> >> > +cd "$IGT_RUNNER_ATTACHMENTS_DIR"
> >> > +
> >> > +# Look for allowlist in following places:
> >> > +# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
> >> > +# 2. Try in <scriptdir>
> >> > +
> >> > +if [ ! -z "$IGT_HOOK_ALLOWLIST_DIR" ]; then
> >> > +	ALLOWLIST_PATH="${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
> >> > +else
> >> > +	ALLOWLIST_PATH="${scriptdir}/${ALLOWLIST}"
> >> > +fi
> >> 
> >> I would just receive the allowlist path from CLI args or, to make it
> >> simpler, from an environment like IGT_HOOKS_GUC_LOG_ALLOWLIST; and I
> >> think we should default to not using any allowlist if none was passed.
> >
> > That's good idea - if script would receive optional arg which is
> > filename it may use it. I'll add this to copy guc log script.
> >
> >> 
> >> > +
> >> > +if [ ! -e "${ALLOWLIST_PATH}" ]; then
> >> > +	exit 0
> >> > +fi
> >> > +
> >> > +STNAME="${IGT_HOOK_TEST_FULLNAME}"
> >> > +echo "${STNAME}" | grep -q -f "${ALLOWLIST_PATH}"
> >> > +if [ $? -ne 0 ]; then
> >> > +	exit 0
> >> > +fi
> >> 
> >> This can simplified with:
> >> 
> >>      if ! echo "$IGT_HOOK_TEST_FULLNAME" | grep -q -f "$ALLOWLIST_PATH"; then
> >>         exit 0;
> >>      fi
> >> 
> >> > +
> >> > +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
> >> 
> >> Suggestion: use $(cd /sys/kernel/debug/dri && find -name guc_log)...
> >> 
> >> > +	attout=$(echo ${log:23} | sed -e 's/\//_/g')
> >> 
> >> ...and then here we don't need this line...
> >> 
> >> > +	mkdir -p "${STNAME}"
> >> > +	cp "$log" "${STNAME}/${attout}"
> >> 
> >> ...and here we can simply do: cp "$log" "$STNAME/${log////_}".
> >
> > Will apply above in v4.
> >
> >> 
> >> One issue with the find command above is that we could potentially
> >> collect GuC log for other device (not the one under test).  I know that
> >> IGT supports selecting a device via the environment variable
> >> IGT_DEVICE.  I wonder if we should make it set an environment for the
> >> device under test; we could use a different variable name to avoid
> >> issues with the existing one.
> >
> > Good point. Question is - how to pass more than one PCIID in multigpu
> > scenarios? For single card it is simple, we can set IGT_HOOK_LAST_PCIID=
> > for each opened device. I'll take a look to this and share my thoughts.
> 
> Ah, interesting.  I wasn't aware of this possibility; so we do have
> tests that work on multiple devices?
> 
> Yeah, maybe a variable that uses some sort of separator.  I guess this
> needs a separate discussion and we can keep the hook looking for
> guc_log files for any available device for now?  We could add a comment
> noting this behavior.
> 
> --
> Gustavo Sousa
> 
> >
> > Thanks for the review.
> > --
> > Zbigniew
> >
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> > +done
> >> > diff --git a/scripts/meson.build b/scripts/meson.build
> >> > index 6e64065c5e..2ce961898d 100644
> >> > --- a/scripts/meson.build
> >> > +++ b/scripts/meson.build
> >> > @@ -15,3 +15,6 @@ endif
> >> >  igt_doc_script = find_program('igt_doc.py', required : build_testplan)
> >> >  gen_rst_index = find_program('gen_rst_index', required : build_sphinx)
> >> >  generate_iga64_codes = find_program('generate_iga64_codes')
> >> > +
> >> > +install_data('hooks/guc_copy_on_fail.sh', install_dir : datadir / 'hooks')
> >> > +install_data('hooks/guc_copy.allowlist', install_dir : datadir / 'hooks')
> >> > -- 
> >> > 2.43.0
