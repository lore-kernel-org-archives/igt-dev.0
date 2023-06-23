Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BC210E0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 02:45:08 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 23 Jun 2023 02:45:03 +0000
Message-ID: <CY5PR11MB62110C26D361D25F0E2EBACD9523A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230622060228.2885144-1-anshuman.gupta@intel.com>
 <20230622060228.2885144-3-anshuman.gupta@intel.com>
 <87r0q3s7u6.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87r0q3s7u6.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] lib/igt_aux: Enable PM Suspend
 dbg messages
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Thursday, June 22, 2023 11:22 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Nilaw=
ar,
> Badal <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>
> Subject: Re: [PATCH i-g-t v3 2/2] lib/igt_aux: Enable PM Suspend dbg
> messages
>=20
> On Wed, 21 Jun 2023 23:02:28 -0700, Anshuman Gupta wrote:
> >
>=20
> Hi Anshuman,
>=20
> > @@ -940,6 +950,14 @@ static void
> igt_aux_enable_pm_suspend_dbg(void)
> >		igt_warn("Unable to open printk parameters Err:%d\n",
> errno);
> >	}
> >
> > +	/* pm_debug_messages depends on  CONFIG_PM_SLEEP_DEBUG
> */
> > +	if (!faccessat(power_dir, "pm_debug_messages", R_OK |  W_OK, 0))
> {
> > +		__pm_debug_messages_state =3D
> igt_sysfs_get_boolean(sysfs_fd, "pm_debug_messages");
> > +		igt_sysfs_set_boolean(power_dir, "pm_debug_messages",
> true);
> > +	}
> > +
> > +
> 	igt_install_exit_handler(igt_aux_pm_suspend_dbg_restore_exit_ha
> ndler);
>=20
> We already installed this exit handler in Patch 1 (under 'if (sysfs_fd >
> 0)') so we shouldn't install it twice, correct?
Thanks for noticing it , I messed it while rebasing. Rev2 has added only on=
ce.
Thanks,
Anshuman.
>=20
> Thanks.
> --
> Ashutosh
